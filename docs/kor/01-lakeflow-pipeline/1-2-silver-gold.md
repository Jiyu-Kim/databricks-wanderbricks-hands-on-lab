# 1.2) Silver·Gold: 정제와 고객 360

이 페이지에서는 데이터 품질 규칙(Expectations)으로 Bronze 데이터를 정제하는 Silver 테이블 3개와, 고객 1명당 1행으로 요약한 Gold 테이블 `gold_customer_360`을 정의합니다.

## 1단계 - Silver 파일 작성하기

1. 파일 브라우저에서 `transformations` 폴더 옆의 **+** 아이콘을 클릭한 뒤 **Transformation**을 클릭합니다.

    ![+ > Transformation](../assets/images/01-lakeflow-pipeline/1-2-01-add-transformation.png)

2. 파일 이름을 `silver`로 바꿉니다. 파일 이름에 마우스를 올리면 나타나는 케밥 메뉴(⋮)에서 **Rename**을 클릭합니다.

    ![silver 파일 만들기](../assets/images/01-lakeflow-pipeline/1-2-02-create-silver-file.png)

3. `silver.sql`에 아래 코드를 붙여넣습니다.

    ```sql title="silver.sql"
    --8<-- "lab-files/kor/step1/silver.sql"
    ```

    ![silver.sql 작성](../assets/images/01-lakeflow-pipeline/1-2-03-silver-code.png)

### 코드 이해하기: Expectations

Silver 테이블에는 `CONSTRAINT ... EXPECT (...) ON VIOLATION DROP ROW` 구문으로 데이터 품질 규칙을 정의했습니다. 규칙을 위반한 행은 테이블에 저장되지 않고, 위반 건수는 파이프라인 실행 결과에 기록됩니다.

| 테이블 | 주요 규칙 | 제거되는 행 |
|---|---|---|
| `silver_dim_users` | `email IS NOT NULL` | 124,509건 중 email이 없는 124건 |
| `silver_fact_bookings` | `total_amount > 0`, `check_out >= check_in`, 유효한 status | 72,247건 중 금액이 0 이하인 1건 |
| `silver_fact_reviews` | `is_deleted = false`, `rating BETWEEN 1 AND 5` | 99,793건 중 삭제(soft-delete)된 476건 (이 476건은 평점 값도 유효하지 않아 두 규칙을 동시에 위반합니다) |

!!! info "ON VIOLATION 옵션"
    `ON VIOLATION DROP ROW`를 생략하면 위반한 행도 저장하되 위반 건수만 기록합니다. `silver_dim_users`의 `valid_type` 규칙이 이 방식입니다. `ON VIOLATION FAIL UPDATE`를 사용하면 위반이 발생했을 때 파이프라인 실행을 중단합니다.

## 2단계 - Gold 파일 작성하기

1. 같은 방법으로 `transformations` 폴더 옆의 **+** 아이콘 → **Transformation**을 클릭하고, 파일 이름 `gold`로 바꿉니다.

    ![gold 파일 만들기](../assets/images/01-lakeflow-pipeline/1-2-04-create-gold-file.png)

2. `gold.sql`에 아래 코드를 붙여넣습니다.

    ```sql title="gold.sql"
    --8<-- "lab-files/kor/step1/gold.sql"
    ```

    ![gold.sql 작성](../assets/images/01-lakeflow-pipeline/1-2-05-gold-code.png)

3. 파일 브라우저의 `transformations` 폴더에 `bronze.sql`, `silver.sql`, `gold.sql` 파일 3개가 있는지 확인합니다.

    ![transformations 폴더의 파일 3개](../assets/images/01-lakeflow-pipeline/1-2-06-three-files.png)

### 코드 이해하기: 고객 360

`gold_customer_360`은 고객 1명당 1행으로 생애 예약 수, 지출액, 평균 평점, 최근 예약일을 요약한 **Materialized View**입니다. Step 2의 대시보드가 이 테이블을 사용합니다.

| 컬럼 | 설명 |
|---|---|
| `lifetime_bookings` | 생애 누적 예약 수 (모든 예약 상태 포함) |
| `lifetime_spend` | 생애 누적 지출액 (숙박 완료(`completed`) 예약의 금액 합계) |
| `avg_rating_given` | 고객이 남긴 리뷰의 평균 평점 |
| `last_booking_at` | 가장 최근 예약 생성 시각 |

!!! tip "왜 먼저 집계한 뒤 조인하나요?"
    고객 1명은 예약을 여러 건, 리뷰를 여러 건 가질 수 있습니다. 예약과 리뷰를 고객 테이블에 한꺼번에 조인한 뒤 집계하면, 예약 수 × 리뷰 수만큼 행이 늘어나 합계가 부풀려집니다(팬아웃). 그래서 예약(`bk`)과 리뷰(`rv`)를 각각 고객 단위로 먼저 집계한 뒤 고객 테이블에 조인합니다.

!!! info "컬럼 코멘트와 기본 키"
    테이블 정의 안에 컬럼 코멘트(`COMMENT`)와 기본 키(`PRIMARY KEY`)를 함께 선언했습니다. 이렇게 하면 파이프라인을 다시 실행해도 메타데이터가 유지되고, 이후 Genie 같은 AI 기능이 테이블을 더 정확하게 이해할 수 있습니다.

!!! success "축하합니다!"
    Silver 테이블 3개와 Gold 테이블 1개를 정의했습니다. 다음 페이지에서 파이프라인을 실행하고 결과를 확인합니다.
