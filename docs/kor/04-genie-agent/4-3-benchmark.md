# 4.3) Benchmark: 정답률 평가하기

이 페이지에서는 질문과 정답 SQL(Ground Truth)을 Benchmark로 등록하고 평가를 실행해, Genie Agent가 정답을 내는지 확인합니다.

!!! info "Benchmark란?"
    Benchmark는 "이 질문에는 이 SQL의 결과가 정답"이라는 기준을 미리 등록해 두고, Genie Agent의 답과 비교해 정확도를 평가하는 기능입니다. Genie Agent를 수정할 때마다 Benchmark를 다시 실행하면, 수정이 정확도를 실제로 높였는지 객관적으로 확인할 수 있습니다.

## 1단계 - Benchmark 질문 추가하기

1. Genie Agent 화면 상단의 **Benchmark**를 클릭합니다.

    ![Benchmark 탭](../assets/images/04-genie-agent/4-3-01-benchmarks-tab.png)

2. 상단의 **Mode**가 기본값인 **Agent**인지 확인하고, **Add benchmark**를 클릭합니다.

    ![Add benchmark](../assets/images/04-genie-agent/4-3-02-add-benchmark.png)

3. **Question**에 아래 질문을 입력합니다.

    ```text
    2024년 성수기 예약 건수는?
    ```

4. **Ground truth SQL answer (optional)** 입력란에 아래 SQL을 입력합니다. `<your_name>`을 본인 이름으로 바꿉니다. Wanderbricks에서 **성수기**는 체크인 월이 6·7·8월(여름)과 12월(연말)인 기간입니다.

    ```sql
    SELECT MEASURE(`예약 건수`) AS peak_season_bookings
    FROM <your_name>_wanderbricks_marketing.default.mv_bookings
    WHERE YEAR(`체크인 월`) = 2024
      AND MONTH(`체크인 월`) IN (6, 7, 8, 12);
    ```

5. **Run**을 클릭해 **Preview**에 정답 SQL의 결과 `8001`이 표시되는지 확인한 뒤, **Add benchmark**를 클릭합니다.

    ![Benchmark 질문과 정답 SQL](../assets/images/04-genie-agent/4-3-03-benchmark-form.png)

## 2단계 - 평가 실행하기

1. **Run all benchmarks**를 클릭합니다.

    ![Run all benchmarks](../assets/images/04-genie-agent/4-3-04-run-benchmarks.png)

2. 평가가 끝나면 평가 결과 화면이 열리고, 정확도가 **0% accurate** (0/1)로 표시되는지 확인합니다.

    ![Benchmark 결과 Bad](../assets/images/04-genie-agent/4-3-05-benchmark-bad.png)

3. 왼쪽 목록에서 질문을 클릭합니다. **Assessment**가 **Bad**, **Score reason**에 **Filter Issue** 등이 표시되고, **Failure analysis**에서 Genie의 SQL이 정답 SQL과 어떻게 다른지 확인할 수 있습니다.

    ![Genie SQL과 정답 SQL 비교](../assets/images/04-genie-agent/4-3-06-benchmark-detail.png)

!!! warning "무엇이 잘못되었나요?"
    Metric View에는 "성수기"를 판단할 기준이 없습니다. 그래서 Genie는 성수기의 월을 임의로 가정하거나(예: 11월 포함), 체크인 월이 아닌 예약일 기준으로 집계해 정답(8,001건)과 다른 결과(예: 9,737건)를 냅니다. Genie가 어떻게 답하든, **"성수기"라는 비즈니스 용어가 정의되어 있지 않다**는 것이 원인입니다.

!!! success "축하합니다!"
    Monitoring과 Benchmark로 두 가지 문제를 발견했습니다. 다음 페이지에서 이 문제들을 해결합니다.
