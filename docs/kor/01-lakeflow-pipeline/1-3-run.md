# 1.3) 파이프라인 실행과 결과 확인

이 페이지에서는 파이프라인을 실행하고, 파이프라인 그래프와 데이터 품질 결과, 그리고 최종 Gold 테이블을 확인합니다.

## 1단계 - 파이프라인 실행하기

1. 화면 상단의 **Run pipeline**을 클릭합니다.

    ![Run pipeline](../assets/images/01-lakeflow-pipeline/1-3-01-run-pipeline.png)

2. 실행이 시작되면 하단 패널에 진행 상황이 표시됩니다. 서버리스 컴퓨팅이 준비되고 7개 테이블이 모두 만들어지기까지 몇 분 정도 걸립니다. 상태가 **Completed**로 바뀔 때까지 기다립니다.

    ![실행 완료](../assets/images/01-lakeflow-pipeline/1-3-02-run-completed.png)

!!! tip "Dry run"
    **Run pipeline** 옆의 드롭다운에서 **Dry run**을 선택하면, 데이터를 실제로 처리하지 않고 코드의 문법과 테이블 간 의존 관계만 검증할 수 있습니다.

## 2단계 - 파이프라인 그래프 확인하기

1. 하단 패널에서 **Pipeline graph** 탭을 클릭합니다. Bronze → Silver → Gold로 이어지는 7개 테이블의 의존 관계를 확인합니다.

    ![Pipeline graph](../assets/images/01-lakeflow-pipeline/1-3-03-pipeline-graph.png)

2. 그래프에서 `gold_customer_360` 노드를 클릭하면 테이블의 샘플 데이터를 미리 볼 수 있습니다.

    ![gold_customer_360 미리보기](../assets/images/01-lakeflow-pipeline/1-3-04-graph-preview.png)

## 3단계 - 테이블별 결과와 데이터 품질 확인하기

1. 하단 패널에서 **Tables** 탭을 클릭합니다. 테이블별로 처리된 행 수를 확인합니다.

    ![Tables 탭](../assets/images/01-lakeflow-pipeline/1-3-05-tables-tab.png)

2. Silver 테이블의 결과가 아래와 같은지 확인합니다. Expectations에 따라 일부 행이 제거되었습니다.

    | 테이블 | Bronze 행 수 | Silver 행 수 | 제거된 행 |
    |---|---|---|---|
    | users | 124,509 | 124,385 | 124 |
    | bookings | 72,247 | 72,246 | 1 |
    | reviews | 99,793 | 99,317 | 476 |

3. `silver_dim_users`를 클릭하면 Expectation별로 통과한 행과 위반한 행의 수를 확인할 수 있습니다.

    ![Expectations 결과 1](../assets/images/01-lakeflow-pipeline/1-3-06-01-expectations.png)

    ![Expectations 결과 2](../assets/images/01-lakeflow-pipeline/1-3-06-02-expectations.png)

    !!! info "`silver_fact_reviews`의 Expectations 결과"
        `silver_fact_reviews`에서는 `not_deleted`와 `valid_rating` 규칙이 모두 476건의 위반으로 표시됩니다. 삭제된 리뷰 476건이 평점 값도 유효하지 않아 두 규칙을 동시에 위반하기 때문입니다. 제거된 행은 476건입니다.

## 4단계 - Catalog Explorer에서 Gold 테이블 확인하기

1. 왼쪽 사이드바에서 **Catalog**를 클릭한 뒤 `<your_name>_wanderbricks_marketing` → `default`를 펼칩니다. 파이프라인이 만든 테이블 7개가 있는지 확인합니다.

    ![Catalog Explorer의 테이블 7개](../assets/images/01-lakeflow-pipeline/1-3-07-catalog-tables.png)

2. `gold_customer_360`을 클릭하고 **Overview** 탭에서 컬럼 코멘트와 기본 키(`user_id`)가 등록된 것을 확인합니다.

    ![gold_customer_360 Overview](../assets/images/01-lakeflow-pipeline/1-3-08-gold-overview.png)

3. **Sample Data** 탭을 클릭해 고객 1명당 1행으로 요약된 데이터를 확인합니다. 전체 행 수는 `silver_dim_users`와 같은 124,385건입니다.

    ![gold_customer_360 Sample Data](../assets/images/01-lakeflow-pipeline/1-3-09-gold-sample-data.png)

!!! success "축하합니다!"
    Daniel의 업무를 마쳤습니다. 원천 데이터를 정제해 분석팀이 믿고 쓸 수 있는 Silver·Gold 테이블을 만들었습니다. 다음 Step에서는 데이터 분석가 Ana가 되어 `gold_customer_360`으로 대시보드를 만듭니다.
