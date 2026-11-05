# 1.4) (Optional) Genie Code와 Visual Data Prep

이 페이지는 선택 실습입니다. 1.1~1.3에서 SQL로 직접 만든 파이프라인을 **Genie Code**에게 자연어로 요청해 똑같이 만들어 보고, 코드 없이 데이터를 가공하는 **Visual Data Prep**이 어떻게 생긴 기능인지 살펴봅니다.

| 방법 | 만드는 것 | 이런 분께 |
|---|---|---|
| SQL 직접 작성 (1.1~1.3) | Lakeflow 파이프라인 | 로직을 세밀하게 통제하려는 데이터 엔지니어 |
| Genie Code (1단계~3단계) | 같은 Lakeflow 파이프라인 | 초안을 빠르게 만들고 코드를 검토·수정하려는 분 |
| Visual Data Prep (4단계~6단계) | 캔버스 기반 데이터 준비 흐름 | SQL보다 화면 조작이 편한 분석가 |

!!! warning "다른 스키마를 사용하세요"
    1.1~1.3에서 만든 테이블과 같은 이름(`bronze_users`, `gold_customer_360` 등)을 만들기 때문에, 같은 카탈로그·스키마를 쓰면 기존 파이프라인과 충돌합니다. 이 실습에서는 기본 스키마로 `default`가 아닌 새 스키마(예: `genie_code`)를 사용합니다. 카탈로그에서 스키마를 먼저 만든 뒤 시작합니다.

## 1단계 - 새 파이프라인 만들고 Genie Code 열기

1. 왼쪽 사이드바 상단의 **New** → **ETL pipeline**을 클릭합니다. [1.1)의 1단계](1-1-bronze.md#1-)와 같은 방법으로 파이프라인 이름(예: `<your_name>_wanderbricks_genie_code`)과 기본 카탈로그·스키마(`<your_name>_wanderbricks_marketing` / `genie_code`)를 설정합니다.

2. 편집기의 빈 파일에 보이는 **Create with Genie Code**를 클릭합니다. 오른쪽에 Genie Code 패널이 열립니다. 화면 오른쪽 위의 Genie Code 아이콘으로 열어도 됩니다.

    ![Create with Genie Code](../assets/images/01-lakeflow-pipeline/1-4-01-genie-code-button.png)

## 2단계 - 프롬프트 입력하기

1. Genie Code 입력창에 미리 채워진 문장이 있으면 지우고, 아래 프롬프트를 붙여넣어 전송합니다.

    !!! prompt "프롬프트"
        ```text
        samples.wanderbricks의 users, bookings, reviews로 SQL 메달리온 파이프라인을 만들어줘.
        파일은 bronze.sql / silver.sql / gold.sql 3개로 나눠줘.

        ## Bronze (스트리밍 테이블)
        - bronze_users, bronze_bookings, bronze_reviews
        - 원천을 STREAM()으로 그대로 읽기
        - 컬럼 추가: _ingested_at (current_timestamp), _source (원천 테이블명)
        - 테이블마다 COMMENT, TBLPROPERTIES('quality'='bronze') 추가

        ## Silver (스트리밍 테이블, bronze를 STREAM()으로 읽기)
        공통
        - 규칙은 CONSTRAINT ... EXPECT ... ON VIOLATION DROP ROW로 정의
        - 각 PK/FK 컬럼은 NOT NULL 검증 추가
        - 테이블마다 COMMENT, TBLPROPERTIES('quality'='silver') 추가
        - 원천 컬럼은 유지하고 _ingested_at, _source는 제외

        테이블별 규칙
        - silver_dim_users
          - email NULL 제거
          - email·user_type은 lower(trim), name은 trim, country는 upper(trim)
          - user_type은 individual/business만 허용 (위반 시 DROP 없이 기록만)
          - company_name은 trim 후 빈 문자열이면 NULL로
        - silver_fact_bookings
          - total_amount > 0
          - check_out >= check_in
          - status는 pending/confirmed/cancelled/completed만
          - nights = datediff(check_out, check_in) 추가
        - silver_fact_reviews
          - is_deleted = false (검증에 쓰이므로 컬럼은 유지)
          - rating 1~5

        ## Gold (Materialized View)
        gold_customer_360: 고객 1명당 1행

        컬럼
        - 사용자 속성: user_id, name, country, user_type, is_business
        - lifetime_bookings: 모든 상태의 예약 수 (booking_id 고유 개수, 예약 없으면 0)
        - lifetime_spend: completed 예약 금액 합계 (소수 2자리, completed 예약이 없으면 NULL)
        - avg_rating_given: 평균 평점 (소수 3자리, 리뷰 없으면 NULL)
        - last_booking_at: 가장 최근 예약 생성 시각

        조건
        - bookings, reviews를 각각 user_id로 먼저 집계(CTE)한 뒤 silver_dim_users에 LEFT JOIN (팬아웃 방지)
        - 컬럼 정의에 타입과 한국어 COMMENT를 명시
        - user_id는 NOT NULL + PRIMARY KEY
        - 컬럼 COMMENT에 값 범위·NULL 의미·PII 여부 등을 간단히 포함
        - 테이블 COMMENT(용도: 세그먼트·LTV·이탈 분석, Genie 기준 테이블)와 TBLPROPERTIES('quality'='gold') 추가
        ```

    ![파이프라인 프롬프트 입력](../assets/images/01-lakeflow-pipeline/1-4-02-pipeline-prompt.png)

2. Genie Code가 계획(**Plan**)을 세우고 파일을 만든 뒤, 파이프라인을 실행해 결과를 확인합니다. 2~4분 정도 걸립니다.

    ![Genie Code가 파이프라인을 만드는 중](../assets/images/01-lakeflow-pipeline/1-4-03-pipeline-generating.png)

!!! tip "프롬프트에 무엇을 적어야 하나요?"
    1.2)에서 설명한 **Expectations 규칙**, **팬아웃을 막는 사전 집계**, **컬럼 코멘트와 기본 키**는 Genie Code가 스스로 판단하기 어려운 부분입니다. 프롬프트에 직접 적어 주어야 1.1~1.3과 같은 결과가 나옵니다. 예를 들어 "팬아웃을 막아줘"를 빼면 예약과 리뷰를 한 번에 조인해 생애 지출이 부풀려질 수 있습니다.

## 3단계 - 결과 검토하고 반영하기

1. Genie Code가 만든 파일 3개가 패널 아래 **assets** 목록에 표시되고, 하단 **Tables** 탭에 7개 테이블의 실행 결과가 나타납니다. 파일 이름을 클릭해 코드를 검토한 뒤 **Accept all**을 클릭해 반영합니다.

    ![Genie Code 결과와 Accept all](../assets/images/01-lakeflow-pipeline/1-4-04-pipeline-result.png)

2. 하단의 **Pipeline graph** 탭에서 1.3)과 같은 7개 테이블 그래프가 만들어졌는지 확인합니다. Silver 노드 오른쪽 아래의 숫자(476, 124, 1)는 Expectations로 제거된 행 수입니다.

    ![Genie Code로 만든 파이프라인 그래프](../assets/images/01-lakeflow-pipeline/1-4-05-pipeline-graph.png)

3. 결과가 아래와 같은지 확인합니다. 1.3)에서 SQL로 직접 만든 결과와 같아야 합니다.

    | 테이블 | 행 수 |
    |---|---|
    | `silver_dim_users` | 124,385 |
    | `silver_fact_bookings` | 72,246 |
    | `silver_fact_reviews` | 99,317 |
    | `gold_customer_360` | 124,385 (생애 지출 합계 약 $4.13M) |

!!! info "결과는 매번 조금씩 다를 수 있습니다"
    Genie Code는 생성형 AI이므로 파일 구성, 컬럼 순서, 코멘트 문구는 실습자마다 다를 수 있습니다. 행 수나 합계가 위와 다르면 "silver_fact_reviews의 Expectations를 다시 확인해줘"처럼 후속 요청으로 고칩니다. 코드를 직접 수정해도 됩니다.

## 4단계 - Visual Data Prep 살펴보기

**Visual Data Prep**은 **Lakeflow Designer**에서 데이터를 코드 없이 준비·가공하는 기능입니다. 캔버스에 연산자(operator)를 끌어다 놓고 연결해 흐름을 만들고, 단계마다 결과를 바로 미리 볼 수 있습니다.

1. 왼쪽 사이드바 상단의 **New** → **Visual data prep**을 클릭합니다.

    ![New > Visual data prep](../assets/images/01-lakeflow-pipeline/1-4-06-new-visual-data-prep.png)

2. 왼쪽에 연산자 목록, 가운데에 캔버스가 열립니다. 캔버스 가운데 입력창에 자연어로 원하는 가공을 설명하거나, **Select a source**로 테이블을 골라 직접 시작할 수 있습니다.

    ![Visual Data Prep 화면](../assets/images/01-lakeflow-pipeline/1-4-07-designer-overview.png)

### 주요 연산자

| 분류 | 연산자 | 하는 일 |
|---|---|---|
| Source and output | **Source**, Enter Data | Unity Catalog 테이블·파일을 불러오거나 값을 직접 입력 |
| | **Output**, Notifications | 결과를 테이블·Materialized View·파일로 저장, 실행 결과 알림 |
| AI transformations | **AI Function** | 감성 분석·분류·요약·번역 같은 AI 함수를 행마다 적용 |
| Transformations | **Filter**, Select, Sort, Limit, Unique | 행 필터링, 컬럼 선택, 정렬, 개수 제한, 중복 제거 |
| | **Prepare** | 공백 제거, 대소문자 변환, 값 치환, 수식(Formula) 등 컬럼 정리 |
| | **Aggregate**, Pivot | 그룹별 집계, 행·열 회전 |
| | **Join**, Combine | 키로 테이블 조인, 여러 테이블 합치기(Union 등) |
| | **SQL**, Python | 화면으로 어려운 로직은 코드로 작성 |

## 5단계 - (샘플) 자연어로 흐름 만들기

3단계에서 만든 Silver 테이블로 "고객별 예약 수와 지출"을 구하는 흐름을 만들어 봅니다. 1.2)의 Gold 테이블을 화면으로 만드는 것과 같은 작업입니다.

1. 캔버스 가운데 입력창에 아래 내용을 입력하고 전송합니다. 카탈로그·스키마 이름은 본인 것으로 바꿉니다.

    !!! prompt "프롬프트"
        ```text
        <your_name>_wanderbricks_marketing.genie_code의 silver_fact_bookings를 user_id별로 집계해서 예약 수(booking_id 개수)와 completed 예약의 total_amount 합계(lifetime_spend)를 구하고, silver_dim_users에 user_id로 LEFT JOIN해서 country, user_type과 함께 보여줘.
        ```

    ![Visual Data Prep 프롬프트](../assets/images/01-lakeflow-pipeline/1-4-08-designer-prompt.png)

2. Genie Code가 만들 흐름을 요약해 보여 주며 확인을 요청하면(**Auto-approve needs your confirmation**), 내용을 확인하고 **Allow**를 클릭합니다. 확인 요청 없이 바로 흐름이 만들어지기도 합니다.

    ![Allow로 승인](../assets/images/01-lakeflow-pipeline/1-4-09-designer-allow.png)

3. 캔버스에 흐름(예: Source 2개 → Aggregate → Join → Select)이 만들어지고, 아래 **Preview**에 입력과 출력 데이터가 표시됩니다. 연산자 구성은 실행마다 다를 수 있습니다. **Accept**(또는 **Accept all**)를 클릭해 반영합니다.

    ![Visual Data Prep 흐름](../assets/images/01-lakeflow-pipeline/1-4-10-designer-flow.png)

## 6단계 - 연산자 설정 확인하기

1. 캔버스에서 집계(**Aggregate**) 연산자(예: **Booking aggregation**)를 클릭합니다. 연산자와 컬럼 이름은 실행마다 다를 수 있습니다. 오른쪽 패널에서 그룹 기준(**Group by**: `user_id`)과 집계 항목(**Aggregate by**: `lifetime_bookings`, `lifetime_spend`)을 화면으로 확인하고 바꿀 수 있습니다. 아래 **Preview**에서 연산자의 입력과 출력을 나란히 비교할 수 있습니다.

    ![Aggregate 연산자 설정](../assets/images/01-lakeflow-pipeline/1-4-11-designer-aggregate.png)

2. 결과를 테이블로 저장하려면 마지막 연산자 뒤에 **Output** 연산자를 연결합니다. 상단의 **Run all**로 전체 데이터를 처리하고, 달력 아이콘(**Schedule**)으로 정기 실행 Job을 만들 수 있습니다.

!!! info "Visual Data Prep과 Lakeflow 파이프라인의 차이"
    Visual Data Prep으로 만든 흐름은 Lakeflow 파이프라인이 아니라 `<이름>.designer.ipynb` 노트북 파일로 저장되고, 실행하면 Output 연산자가 테이블·Materialized View·파일을 씁니다. 1.2)에서 사용한 **Streaming Table의 증분 처리**와 **Expectations**는 Visual Data Prep의 공식 문서에서 지원 여부를 확인하지 못했습니다. 품질 검사는 **Guardrails** 연산자로 대신할 수 있습니다. 자세한 내용은 [Lakeflow Designer 문서](https://docs.databricks.com/aws/en/designer/what-is-lakeflow-designer)와 [연산자 목록](https://docs.databricks.com/aws/en/designer/built-in-operators)을 참고하세요.

!!! success "축하합니다!"
    같은 파이프라인을 Genie Code로 만들어 보고, Visual Data Prep으로 코드 없이 데이터를 가공하는 방법을 살펴봤습니다. 실습이 끝나면 이 페이지에서 만든 파이프라인, `genie_code` 스키마, Visual Data Prep 파일을 삭제합니다.
