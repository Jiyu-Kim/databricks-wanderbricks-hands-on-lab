# 3.1) Metric View: 예약

이 페이지에서는 예약 데이터의 KPI를 정의하는 Metric View `mv_bookings`를 만들고, SQL로 조회해 봅니다.

!!! tip "왜 Gold가 아니라 Silver 테이블을 source로 사용하나요?"
    `gold_customer_360`은 **고객 1명당 1행**으로 미리 요약된 테이블입니다. 이 테이블로는 "월별 예약 건수"나 "국가별 취소율"처럼 예약 단위로 나눠 보는 질문에 답할 수 없습니다. Metric View는 가장 세밀한 단위의 데이터(예약 1건 = 1행)를 source로 두고, 질문에 따라 원하는 기준으로 집계할 수 있게 만드는 것이 핵심입니다. 그래서 `silver_fact_bookings`를 source로 사용합니다.

## 1단계 - Metric View 만들기

1. 왼쪽 사이드바에서 **Catalog**를 클릭한 뒤, `<your_name>_wanderbricks_marketing` → `default` 스키마를 클릭합니다.

    ![default 스키마](../assets/images/03-uc-semantics/3-1-01-default-schema.png)

2. 우측 상단의 **Create**를 클릭한 뒤 **Metric view**를 클릭합니다.

    ![Create > Metric view](../assets/images/03-uc-semantics/3-1-02-create-metric-view.png)

3. **Name**에 `mv_bookings`를 입력합니다.

    ![Metric View 이름 입력](../assets/images/03-uc-semantics/3-1-03-metric-view-name.png)

4. 편집기가 UI 모드로 열려 있다면 우측 상단의 `<>` 토글을 클릭해 YAML 편집기로 전환합니다. YAML 편집기의 내용을 모두 지우고 아래 YAML을 붙여넣습니다. YAML 안의 `<your_name>_wanderbricks_marketing`(2곳)을 본인의 카탈로그 이름으로 바꿉니다.

    ```yaml title="mv_bookings"
    --8<-- "lab-files/kor/step3/mv_bookings.yaml"
    ```

    ![YAML 붙여넣기](../assets/images/03-uc-semantics/3-1-04-yaml-editor.png)

5. **Save**를 클릭합니다. Metric View가 만들어지면 **Overview** 탭에서 **Measures** (6)와 **Fields** (8)가 등록된 것을 확인합니다. Metric View의 dimension은 UI에서 **Fields**로 표시됩니다.

    ![mv_bookings Overview](../assets/images/03-uc-semantics/3-1-05-overview.png)

??? tip "SQL로 Metric View 만들기"
    SQL Editor에서 아래 쿼리를 실행해도 같은 Metric View를 만들 수 있습니다.

    ```sql
    CREATE OR REPLACE VIEW <your_name>_wanderbricks_marketing.default.mv_bookings
    WITH METRICS
    LANGUAGE YAML
    AS $$
    --8<-- "lab-files/kor/step3/mv_bookings.yaml"
    $$;
    ```

## 2단계 - YAML 이해하기

| 항목 | 이 Metric View에서 | 설명 |
|---|---|---|
| `source` | `silver_fact_bookings` | 1행 = 예약 1건인 사실(fact) 테이블입니다. |
| `joins` | `dim_user` → `silver_dim_users` | 예약한 고객의 국가, 유형 정보를 가져옵니다. 예약 여러 건이 고객 1명에 연결되는 다대일(many-to-one) 조인입니다. |
| `dimensions` | 예약일, 예약 월, 체크인 월, 예약 상태, 고객 국가, 고객 유형, 숙박일수 구간, 투숙 인원 | 데이터를 나눠 보는 기준입니다. |
| `measures` | 예약 건수, 총 예약 금액, 평균 예약 금액, 취소율, 예약 고객 수, 평균 숙박일수 | 집계할 KPI입니다. 계산 로직이 한 곳에만 정의됩니다. |
| `comment` | 모든 dimension, measure | 필드의 의미입니다. Genie가 질문을 해석할 때 참고합니다. |
| `synonyms` | 예: 취소율 → 취소 비율, cancellation rate | 사용자가 다른 표현으로 질문해도 같은 필드를 찾도록 돕습니다. |
| `format` | 금액은 USD, 비율은 % | 결과를 표시하는 형식입니다. |

!!! info "총 예약 금액은 모든 예약 상태를 포함합니다"
    `총 예약 금액`은 대기(pending), 확정(confirmed), 취소(cancelled), 숙박 완료(completed)를 모두 포함한 거래 금액(GBV)입니다. 이 정의는 Step 4에서 다시 중요하게 다룹니다.

## 3단계 - SQL로 조회하기

Metric View의 measure는 `MEASURE()` 함수로 조회합니다. 어떤 dimension으로 `GROUP BY` 하든 measure의 계산 로직은 Metric View에 정의된 대로 적용됩니다.

1. 왼쪽 사이드바에서 **SQL Editor**를 클릭하고, 아래 쿼리를 실행합니다.

    ```sql
    SELECT
      MEASURE(`예약 건수`)    AS bookings,
      MEASURE(`총 예약 금액`) AS gross_booking_value,
      MEASURE(`취소율`)       AS cancellation_rate
    FROM <your_name>_wanderbricks_marketing.default.mv_bookings;
    ```

2. 결과가 예약 건수 72,246건, 총 예약 금액 약 $40.0M, 취소율 약 21.2%인지 확인합니다.

    ![전체 KPI 조회 결과](../assets/images/03-uc-semantics/3-1-06-query-total.png)

3. 이번에는 같은 measure를 고객 유형별로 나눠 봅니다.

    ```sql
    SELECT
      `고객 유형`,
      MEASURE(`예약 건수`) AS bookings,
      MEASURE(`취소율`)    AS cancellation_rate
    FROM <your_name>_wanderbricks_marketing.default.mv_bookings
    GROUP BY ALL;
    ```

    ![고객 유형별 조회 결과](../assets/images/03-uc-semantics/3-1-07-query-by-segment.png)

!!! warning "Metric View를 수정할 때는 `ALTER VIEW`를 사용하세요"
    3.3)에서 Metric View에 Governed Tag를 연결한 뒤에 `CREATE OR REPLACE VIEW`로 Metric View를 다시 만들면, 연결한 Tag가 사라져 Domain과의 연결이 끊어집니다. Metric View를 수정할 때는 UI의 **Edit** 또는 `ALTER VIEW ... AS $$ ... $$`를 사용합니다.

!!! success "축하합니다!"
    예약 KPI를 정의한 Metric View `mv_bookings`를 만들었습니다. 다음 페이지에서 리뷰 KPI를 정의하는 `mv_reviews`를 만듭니다.
