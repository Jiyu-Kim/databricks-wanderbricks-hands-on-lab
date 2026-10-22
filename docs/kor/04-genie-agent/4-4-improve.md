# 4.4) 개선: Metric View 수정과 Page 생성

4.2와 4.3에서 발견한 두 문제는 모두 **비즈니스 용어가 정의되어 있지 않다**는 같은 원인에서 나왔습니다. 이 페이지에서는 두 가지 방법으로 용어를 정의합니다.

| 방법 | 대상 | 효과 |
|---|---|---|
| **① Metric View 수정** | `mv_bookings`에 `매출`, `실매출`, `성수기 여부`, `체크인 연도` 추가 | Genie Agent가 정확한 SQL을 생성합니다. |
| **② Page 생성** | Domain에 `매출`, `실매출`, `성수기` Page 추가 | 조직 전체의 용어 정의를 표준화하고, Genie One이 정의를 답할 때 참조합니다. |

마지막으로 Benchmark를 다시 실행하고 4.2의 질문을 다시 던져, 개선 효과를 확인합니다.

## 1단계 - Metric View에 용어 추가하기

### 1.1) 편집 모드 열기

1. 왼쪽 사이드바에서 **Catalog**를 클릭한 뒤 `<your_name>_wanderbricks_marketing` → `default` → `mv_bookings`를 클릭합니다.

    ![mv_bookings 열기](../assets/images/04-genie-agent/4-4-01-open-mv-bookings.png)

2. 우측 상단의 **Edit**를 클릭합니다. 편집 화면이 YAML로 열리면 우측 상단의 **UI**를 클릭합니다. 편집 화면 왼쪽에 **Measures** (6)와 **Fields** (8) 목록이 표시됩니다.

    ![Edit 화면](../assets/images/04-genie-agent/4-4-02-edit-mode.png)

### 1.2) Measure `매출` 추가하기

1. **Measures** 옆의 **+** (**Add measure**)를 클릭합니다.

    ![Add measure](../assets/images/04-genie-agent/4-4-03-add-measure.png)

2. **Expression** 오른쪽의 **Custom**을 클릭해 SQL 식을 직접 입력할 수 있게 합니다.

    ![Expression Custom](../assets/images/04-genie-agent/4-4-04-expression-custom.png)

3. 아래 값을 입력합니다. **Expression**을 입력하면 이름이 자동으로 채워지므로, **Expression**을 먼저 입력한 뒤 **Measure name**과 **Display name**을 입력합니다.

    | 항목 | 입력값 |
    |---|---|
    | **Measure name** | `매출` |
    | **Expression** | `SUM(source.total_amount) FILTER (WHERE source.status IN ('confirmed', 'completed'))` |
    | **Display name** | `매출` |
    | **Comment** | `매출(총매출). 확정된 예약(status = confirmed, completed)의 total_amount 합계. 취소(cancelled)와 대기(pending)는 제외. 통화 USD.` |
    | **Synonyms** | `총매출, 매출액, revenue, gross revenue, sales` |
    | **Format** | 입력란 클릭 → **Type**에서 **$** 선택 (**Currency**: US dollars) |

    ![매출 measure 입력](../assets/images/04-genie-agent/4-4-05-measure-revenue.png)

### 1.3) Measure `실매출` 추가하기

1. 같은 방법으로 **Add measure** → **Custom**을 클릭하고 아래 값을 입력합니다.

    | 항목 | 입력값 |
    |---|---|
    | **Measure name** | `실매출` |
    | **Expression** | `SUM(source.total_amount) FILTER (WHERE source.status = 'completed')` |
    | **Display name** | `실매출` |
    | **Comment** | `실매출(순매출). 숙박이 완료된 예약(status = completed)의 total_amount 합계로, 실제 실현된 매출. 통화 USD.` |
    | **Synonyms** | `순매출, 실현 매출, net revenue, net sales, realized revenue` |
    | **Format** | 입력란 클릭 → **Type**에서 **$** 선택 (**Currency**: US dollars) |

    ![실매출 measure 입력](../assets/images/04-genie-agent/4-4-06-measure-net-revenue.png)

### 1.4) Field `성수기 여부` 추가하기

1. **Fields** 옆의 **+** (**Add field**)를 클릭하고, **Expression**의 **Custom**을 클릭합니다.

    ![Add field](../assets/images/04-genie-agent/4-4-07-add-field.png)

2. **Expression**을 먼저 입력한 뒤 나머지 값을 입력합니다.

    | 항목 | 입력값 |
    |---|---|
    | **Field name** | `성수기 여부` |
    | **Expression** | `CASE WHEN MONTH(source.check_in) IN (6, 7, 8, 12) THEN '성수기' ELSE '비수기' END` |
    | **Display name** | `성수기 여부` |
    | **Comment** | `체크인 월 기준 성수기 구분. 성수기 = 6·7·8월(여름) + 12월(연말) 체크인, 그 외 = 비수기. 값은 정확히 '성수기' 또는 '비수기' 두 가지이며 필터는 등호(= '성수기')로 비교한다. 'N년 성수기'의 연도는 체크인 연도로 필터링한다.` |
    | **Synonyms** | `성수기, 비수기, 피크 시즌, peak season, 시즌` |

    ![성수기 여부 field 입력](../assets/images/04-genie-agent/4-4-08-field-peak-season.png)

### 1.5) Field `체크인 연도` 추가하기

1. 같은 방법으로 **Add field** → **Custom**을 클릭하고 아래 값을 입력합니다.

    | 항목 | 입력값 |
    |---|---|
    | **Field name** | `체크인 연도` |
    | **Expression** | `YEAR(source.check_in)` |
    | **Display name** | `체크인 연도` |
    | **Comment** | `숙박 체크인 날짜(check_in)의 연도. 성수기·시즌 등 숙박 시점 기준 분석의 연도 필터에 사용.` |
    | **Synonyms** | `체크인년도, 숙박 연도, 여행 연도, check-in year` |

    ![체크인 연도 field 입력](../assets/images/04-genie-agent/4-4-09-field-checkin-year.png)

### 1.6) `총 예약 금액`의 설명 보완하기

`총 예약 금액`이 매출이 아니라는 점을 Comment에 명시해, Genie가 매출 질문에 이 measure를 사용하지 않도록 합니다.

1. **Measures** 목록에서 `총 예약 금액`을 클릭합니다.

    ![총 예약 금액 선택](../assets/images/04-genie-agent/4-4-10-select-gbv.png)

2. **Comment**의 맨 뒤에 아래 문장을 추가합니다.

    ```text
     매출이 아님 - 매출은 `매출`, 실매출(순매출)은 `실매출` measure 사용.
    ```

    ![총 예약 금액 Comment 수정](../assets/images/04-genie-agent/4-4-11-gbv-comment.png)

### 1.7) 저장하고 확인하기

1. 우측 상단의 **Save**를 클릭합니다. 목록이 **Measures** (8), **Fields** (10)으로 바뀐 것을 확인합니다.

    ![Save](../assets/images/04-genie-agent/4-4-12-save.png)

2. **SQL Editor**에서 아래 쿼리를 실행해 새 measure와 field가 정상적으로 동작하는지 확인합니다.

    ```sql
    SELECT
      MEASURE(`총 예약 금액`) AS gross_booking_value,
      MEASURE(`매출`)         AS revenue,
      MEASURE(`실매출`)       AS net_revenue,
      MEASURE(`예약 건수`) FILTER (WHERE `성수기 여부` = '성수기' AND `체크인 연도` = 2024) AS peak_2024_bookings
    FROM <your_name>_wanderbricks_marketing.default.mv_bookings;
    ```

3. 결과가 아래와 같은지 확인합니다.

    | gross_booking_value | revenue | net_revenue | peak_2024_bookings |
    |---|---|---|---|
    | 약 $40.0M | 약 $14.0M | 약 $4.1M | 8,001 |

    ![확인 쿼리 결과](../assets/images/04-genie-agent/4-4-13-verify-query.png)

!!! info "UI에서 수정하면 Tag가 유지됩니다"
    UI의 **Edit**로 Metric View를 수정하면 3.3)에서 연결한 Governed Tag가 그대로 유지됩니다. SQL로 수정할 때는 `CREATE OR REPLACE VIEW` 대신 `ALTER VIEW`를 사용해야 Tag가 유지됩니다.

## 2단계 - 비즈니스 용어 Page 만들기

!!! info "Page를 왜 만드나요?"
    Page는 Genie Agent의 SQL 생성에 **직접 영향을 주지 않습니다.** Genie Agent의 SQL 정확도는 1단계에서 수정한 **Metric View**와 Genie Agent의 **Instructions**가 담당합니다.

    Page의 목적은 **조직 전체의 비즈니스 용어를 표준화**하는 것입니다. 예를 들어 사용자가 Genie One에서 "실매출이 뭐야?"라고 질문하면, Genie One이 이 Page를 참조해 정의를 답하고 출처(citation)로 표시합니다. Page가 실제로 참조되는 모습은 Step 5에서 확인합니다.

### 2.1) Page 만들기

1. 왼쪽 사이드바에서 **Discover**를 클릭합니다.

    ![Discover > Pages](../assets/images/04-genie-agent/4-4-14-discover-pages.png)

2. 우측 상단의 **Create** → **Create page**를 클릭합니다.

    ![Create page](../assets/images/04-genie-agent/4-4-15-create-page.png)

3. 아래 **Page ① 매출**의 내용을 입력합니다.
    - 맨 위의 **Click to set page name**을 클릭해 이름을 입력합니다.
    - **Domain**은 3.3)에서 만든 `<your_name>_wanderbricks_marketing`을 선택합니다.
    - **Synonyms**는 **+** 버튼을 클릭해 하나씩 입력하고 Enter를 누릅니다.
    - 본문에는 **Definition**과 **Business use** 제목이 미리 들어 있습니다. 각 제목 아래에 내용을 입력합니다. 표는 툴바의 표 삽입 버튼으로 넣고, 남는 행과 열은 삭제합니다.

    ![Page 입력](../assets/images/04-genie-agent/4-4-16-page-form.png)

4. **Publish**를 클릭합니다.

    ![Page Publish](../assets/images/04-genie-agent/4-4-17-page-publish.png)

5. 같은 방법으로 **Page ② 실매출**과 **Page ③ 성수기**를 만들고 Publish합니다.

!!! warning "Page에는 개인정보를 넣지 마세요"
    Page의 이름, 설명, 동의어, 본문은 암호화되지 않은 상태로 저장됩니다. 개인정보나 민감한 정보를 넣지 않습니다.

### 2.2) Page 내용

=== "① 매출"

    | 항목 | 입력값 |
    |---|---|
    | **Name** | `매출` |
    | **Domain** | `<your_name>_wanderbricks_marketing` |
    | **Owner** | 본인 |
    | **Synonyms** | `총매출`, `매출액`, `revenue`, `gross revenue`, `sales` |
    | **Description** | Wanderbricks의 매출(총매출)은 확정된 예약 금액의 합계입니다. 총 예약 금액(GBV)이나 실매출과는 다른 지표입니다. |

    **Body**

    ```markdown
    ## Definition
    매출 = 예약 상태가 confirmed 또는 completed인 예약의 total_amount 합계(USD)입니다. 취소(cancelled)와 대기(pending) 건은 제외합니다.

    | 지표 | 포함 상태 | 2022-12 ~ 2025-07 합계 |
    |---|---|---|
    | 총 예약 금액 (GBV) | 모든 상태 | 약 $40.0M |
    | 매출 | confirmed, completed | 약 $14.0M |
    | 실매출 | completed | 약 $4.1M |

    ## Business use
    - 시장·세그먼트별 확정 수요의 규모를 보고할 때 사용합니다.
    - 질문에 "매출"만 있으면 이 정의를 적용합니다.
    - 관련 자산: mv_bookings의 `매출` measure
    ```

=== "② 실매출"

    | 항목 | 입력값 |
    |---|---|
    | **Name** | `실매출` |
    | **Domain** | `<your_name>_wanderbricks_marketing` |
    | **Owner** | 본인 |
    | **Synonyms** | `순매출`, `실현 매출`, `net revenue`, `net sales`, `realized revenue` |
    | **Description** | 숙박이 완료되어 실제로 실현된 매출입니다. 경영 보고와 캠페인 목표의 기준 지표입니다. |

    **Body**

    ```markdown
    ## Definition
    실매출 = 예약 상태가 completed(숙박 완료)인 예약의 total_amount 합계(USD)입니다. 확정되었지만 아직 숙박하지 않은 confirmed 건은 포함하지 않습니다.

    ## Business use
    - 경영 보고와 캠페인 성과의 매출 목표는 실매출 기준으로 측정합니다. (예: Summer Escape 2025 캠페인의 국가별 목표 실매출)
    - 관련 자산: mv_bookings의 `실매출` measure
    ```

=== "③ 성수기"

    | 항목 | 입력값 |
    |---|---|
    | **Name** | `성수기` |
    | **Domain** | `<your_name>_wanderbricks_marketing` |
    | **Owner** | 본인 |
    | **Synonyms** | `피크 시즌`, `peak season`, `high season`, `성수기 시즌` |
    | **Description** | Wanderbricks에서 숙박 수요가 집중되는 시기의 정의입니다. |

    **Body**

    ```markdown
    ## Definition
    성수기 = 체크인 월이 6·7·8월(여름) 또는 12월(연말)인 기간입니다. 나머지 월은 비수기입니다.
    기준은 예약 생성일이 아니라 체크인(숙박) 시점입니다. "2024년 성수기"는 체크인 연도가 2024년이고 체크인 월이 6·7·8·12월인 예약을 의미합니다.

    ## Business use
    - 시즌 프로모션 예산 배분과 성수기·비수기의 예약 건수·실매출 비교에 사용합니다.
    - 2024년 기준 성수기 월의 월평균 예약(약 2,000건)은 비수기 월(약 700건)의 약 3배입니다.
    - 관련 자산: mv_bookings의 `성수기 여부`, `체크인 연도` field
    ```

## 3단계 - 개선 효과 확인하기

### 3.1) Benchmark 다시 실행하기

1. Genie Agent 화면 상단의 **Benchmark**를 클릭한 뒤 **Run all benchmarks**를 클릭합니다.

    ![Run all benchmarks](../assets/images/04-genie-agent/4-4-18-rerun-benchmarks.png)

2. 정확도가 **100% accurate** (1/1)로, 질문의 **Assessment**가 **Good**으로 바뀐 것을 확인합니다. 결과를 클릭해 Genie가 `` `성수기 여부` = '성수기' ``와 `` `체크인 연도` = 2024 `` 조건으로 8,001건을 답한 것을 확인합니다.

    ![Benchmark 결과 Good](../assets/images/04-genie-agent/4-4-19-benchmark-good.png)

### 3.2) Monitoring 질문 다시 하기

1. 화면 상단의 **Chat**을 클릭한 뒤 우측 상단의 **New chat** 아이콘을 클릭하고, 4.2와 같은 질문을 입력합니다.

    !!! prompt "프롬프트"
        ```text
        2024년 국가별 매출 Top 5 알려줘
        ```

2. Genie가 `` MEASURE(`매출`) ``을 사용해 INDIA의 매출을 약 $818K로 답했는지 확인합니다.

    ![개선 후 매출 답변](../assets/images/04-genie-agent/4-4-20-revenue-after.png)

### 3.3) Before / After

| 질문 | 개선 전 | 개선 후 |
|---|---|---|
| 2024년 국가별 매출 Top 5 | `총 예약 금액` 사용 → INDIA 약 $2.25M (❌) | `매출` 사용 → INDIA 약 $818K (✅) |
| 2024년 성수기 예약 건수는? | 성수기 기준 없음 → Benchmark **Bad** (❌) | `성수기 여부`·`체크인 연도` 사용 → 8,001건, Benchmark **Good** (✅) |

!!! tip "실제로는 여러 번 반복해야 하는 경우가 많습니다"
    이 실습에서는 검증된 최종 수정안을 한 번에 적용했습니다. 실제 업무에서는 첫 번째 수정 후에도 Genie가 다른 이유로 틀리는 경우가 많습니다. 예를 들어 "2024년"을 예약일 기준으로 해석하거나, '비성수기'처럼 '성수기'를 포함하는 값을 함께 찾는 경우입니다. **Benchmark 실행 → 원인 분석 → Metric View·Instructions 수정 → 다시 실행**을 반복하며 정확도를 높여 갑니다.

!!! success "축하합니다!"
    Monitoring과 Benchmark로 발견한 문제를 Metric View로 해결하고, 비즈니스 용어를 Page로 표준화했습니다. 다음 페이지는 Optional로, 마케팅 문서까지 Genie Agent에 연결해 봅니다.
