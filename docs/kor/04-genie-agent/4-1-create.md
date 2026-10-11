# 4.1) Genie Agent 만들기

이 페이지에서는 Step 3에서 만든 Metric View 2개를 데이터 소스로 Genie Agent를 만들고, 첫 질문을 던져 봅니다.

## 1단계 - Genie Agent 만들기

1. 왼쪽 사이드바에서 **Genie Agents**를 클릭한 뒤, 우측 상단의 **New**를 클릭합니다.

    ![Genie Agents > New](../assets/images/04-genie-agent/4-1-01-new-genie-agent.png)

2. **Connect your data** 창에서 **Metric views** 필터를 클릭하고, `<your_name>_wanderbricks_marketing.default`의 `mv_bookings`와 `mv_reviews`를 선택한 뒤 **Create**를 클릭합니다.

    ![Metric View 2개 선택](../assets/images/04-genie-agent/4-1-02-select-sources.png)

    !!! tip "왜 Metric View만 연결하나요?"
        테이블을 연결하면 Genie는 "매출"이나 "취소율"을 매번 스스로 계산합니다. Metric View를 연결하면 Step 3에서 정의한 계산 로직을 그대로 사용하므로, 누가 질문해도 같은 숫자가 나옵니다.

## 2단계 - 기본 정보 설정하기

1. 화면 우측 상단의 **Configure**를 클릭한 뒤 **About** 탭을 클릭합니다.

    ![Configure > About](../assets/images/04-genie-agent/4-1-03-settings-tab.png)

2. **About this agent** 옆의 연필 아이콘을 클릭합니다. **Edit agent details** 창에서 아래와 같이 입력하고 **Save**를 클릭합니다.

    | 항목 | 입력값 |
    |---|---|
    | **Name** | `<your_name> - Wanderbricks 마케팅 어시스턴트` (예: `jiyu - Wanderbricks 마케팅 어시스턴트`) |
    | **Default warehouse** | 사용할 SQL Warehouse (예: **Serverless Starter Warehouse**) |

    ![Edit agent details](../assets/images/04-genie-agent/4-1-04-settings-form.png)

3. Genie가 제안한 설명(**Genie Suggested Description**)이 표시되어 있다면 오른쪽 위의 **X**로 닫습니다. **Description** 옆의 연필 아이콘을 클릭하고, **Edit description** 창에 `Wanderbricks 마케팅팀이 예약·리뷰 지표를 자연어로 분석하는 Genie Agent입니다.`를 입력한 뒤 **Save**를 클릭합니다.

    ![Description 입력](../assets/images/04-genie-agent/4-1-04b-description.png)

## 3단계 - Instructions와 Sample question 추가하기

1. **Instructions** 탭을 클릭하고, **General Instructions** 입력란에 아래 내용을 붙여넣은 뒤 **Save**를 클릭합니다. 입력란에 회색으로 보이는 예시 문구는 안내용이라 지우지 않아도 됩니다.

    ```text title="Instructions"
    - 데이터는 2025-07-30까지 존재합니다. "최근"은 오늘이 아니라 2025-07-30을 기준으로 해석합니다.
    - 국가명은 대문자 전체 이름입니다. (예: UNITED STATES, SOUTH KOREA, JAPAN)
    - 금액의 통화 단위는 USD입니다.
    ```

    ![Instructions 입력](../assets/images/04-genie-agent/4-1-05-instructions.png)

2. **About** 탭으로 돌아가 **Common questions** 옆의 연필 아이콘을 클릭합니다. **Edit common questions** 창의 입력란에 아래 질문을 입력하고 **Add**를 클릭한 뒤 **Save**를 클릭합니다. Common question은 사용자가 새 대화를 시작할 때 추천 질문으로 표시됩니다.

    ```text
    국가별 예약 건수 Top 10을 알려줘
    ```

    ![Sample question 추가](../assets/images/04-genie-agent/4-1-06-sample-question.png)

## 4단계 - 첫 질문하기

1. **Configure** 패널을 닫고, 화면 상단의 **Chat**이 선택되어 있는지 확인합니다. 입력창 아래에 추천 질문으로 표시된 **국가별 예약 건수 Top 10을 알려줘**를 클릭합니다.

    ![추천 질문 클릭](../assets/images/04-genie-agent/4-1-07-click-sample.png)

    !!! info "Agent 모드와 Chat 모드"
        입력창 아래의 **Agent** / **Chat** 토글로 답변 방식을 고를 수 있습니다. 기본값인 **Agent** 모드는 여러 단계로 추론해 더 깊이 분석합니다. 이 실습은 기본값인 **Agent** 모드를 그대로 사용합니다.

2. Genie가 SQL을 생성해 실행하고, 결과를 표와 설명으로 보여줍니다. INDIA(약 13,400건)와 CHINA(약 13,100건)가 1, 2위인지 확인합니다.

    ![첫 질문 답변](../assets/images/04-genie-agent/4-1-08-first-answer.png)

3. 결과 차트 위의 **Show code**를 클릭해, Genie가 `` MEASURE(`예약 건수`) ``로 Metric View를 조회한 것을 확인합니다.

    ![생성된 SQL](../assets/images/04-genie-agent/4-1-09-show-code.png)

!!! success "축하합니다!"
    Genie Agent를 만들고 첫 질문에 대한 답을 받았습니다. 다음 페이지에서는 Mina가 되어 실제 업무 질문을 던져 봅니다.
