# 5) Genie One으로 질문하기

## 실습 개요 📋

Step 4에서 만든 Page는 Genie Agent가 아니라 **Genie One**이 참조합니다. 이번 실습에서는 Genie One에서 비즈니스 용어가 들어간 질문을 던지고, Genie One이 여러분이 만든 Page를 근거로 답하는지 확인합니다.

## 이번 실습에서의 역할

<div class="grid" markdown>

<div class="card persona" markdown>

![Mina](../assets/images/personas/mina.svg){ width="96" }

<div markdown>

**📈 Mina - Marketing Executive**

*"이제 데이터 팀에 요청하지 않고, 궁금한 걸 바로 물어보고 싶어요."*

여러분은 마케팅 임원 Mina입니다. 특정 Genie Agent를 찾아 들어가지 않고, Genie One에서 바로 질문합니다.

</div>

</div>

</div>

## Genie Agent와 Genie One은 무엇이 다른가요?

| | Genie Agent | Genie One |
|---|---|---|
| 범위 | 특정 데이터에 맞춰 구성한 전용 에이전트 | 워크스페이스 전체의 데이터와 비즈니스 정의 |
| 참고하는 정보 | 연결된 Metric View·테이블, Instructions | Metric View, Domain, **Page**, Genie Agent 등 |
| 적합한 질문 | 정해진 업무 영역의 반복적인 분석 | 어떤 데이터를 봐야 할지 모르는 질문, 용어의 정의 |

Genie One은 **Genie Ontology**를 바탕으로 답합니다. Genie Ontology는 여러분이 직접 정의한 Unity Catalog Semantics(Metric View, Domain, Page)와, 대시보드·쿼리 등에서 자동으로 추출한 맥락을 합친 것입니다. Page로 정의한 용어가 있으면 Genie One은 자동으로 추론한 맥락보다 Page의 정의를 우선합니다.

## 1단계 - Genie One 열기

1. 화면 우측 상단의 앱 전환 아이콘(**Switch apps**)을 클릭한 뒤 **Genie One**을 클릭합니다.

    ![Genie One 열기](../assets/images/05-genie-one/5-01-open-genie-one.png)

2. Genie One 화면(**How can I help you?**)이 열리면 입력창을 확인합니다.

    ![Genie One 화면](../assets/images/05-genie-one/5-02-genie-one-home.png)

## 2단계 - 용어의 정의를 묻기

1. 아래 질문을 입력하고 전송합니다.

    !!! info "Prompt:"
        ```text
        Wanderbricks에서 매출과 실매출은 어떻게 달라? 2024년 기준으로 각각 얼마야?
        ```

    ![질문 입력](../assets/images/05-genie-one/5-03-ask-revenue-definition.png)

2. Genie One이 매출(confirmed·completed 기준)과 실매출(completed 기준)의 차이를 설명하고, 2024년 금액을 함께 답하는지 확인합니다.

    ![매출·실매출 답변](../assets/images/05-genie-one/5-04-revenue-answer.png)

3. 답변 맨 아래의 **Genie Ontology (2)**를 클릭해, 출처(citation)로 Step 4에서 만든 **매출**과 **실매출** Page가 표시되는지 확인합니다. 답변 본문의 정의 옆에 있는 Page 아이콘도 같은 출처를 가리킵니다.

    ![Page citation](../assets/images/05-genie-one/5-05-page-citation.png)

## 3단계 - 출처 Page 열어보기

1. **Genie Ontology** 메뉴에서 **매출**을 클릭합니다.

    ![citation 클릭](../assets/images/05-genie-one/5-06-click-citation.png)

2. 오른쪽 패널에 Step 4에서 만든 `매출` Page의 Domain, Synonyms, Definition이 표시되는지 확인합니다.

    ![매출 Page](../assets/images/05-genie-one/5-07-page-opened.png)

## 4단계 - 성수기 질문하기

1. 왼쪽 위의 **New chat**을 클릭해 새 대화를 시작하고, 아래 질문을 입력합니다.

    !!! info "Prompt:"
        ```text
        Wanderbricks에서 성수기는 언제를 말해? 그리고 2024년 성수기 예약 건수는?
        ```

2. Genie One이 성수기를 체크인 기준 6·7·8·12월로 설명하고, 2024년 성수기 예약 건수를 **8,001건**으로 답하는지 확인합니다. 답변 아래의 **Genie Ontology (1)**를 클릭하면 **성수기** Page가 출처로 표시됩니다.

    ![성수기 답변](../assets/images/05-genie-one/5-08-peak-season-answer.png)

!!! tip "숫자만 묻는 질문은 Genie Agent로 연결될 수 있습니다"
    "2024년 국가별 매출 Top 5"처럼 숫자만 묻는 질문에는 Genie One이 Step 4에서 만든 Genie Agent에 질문을 넘겨 답하고, Page 대신 Genie Agent 링크를 출처로 표시할 수 있습니다. 용어의 정의를 함께 물으면 Page가 출처로 표시되는 것을 더 쉽게 확인할 수 있습니다.

!!! info "공유 워크스페이스에서 실습하는 경우"
    같은 워크스페이스에서 다른 실습자가 만든 Wanderbricks 관련 Page가 함께 출처로 표시될 수 있습니다. 여러분의 Domain(`<your_name>_wanderbricks_marketing`)에 속한 Page인지 확인합니다.

!!! success "축하합니다!"
    Mina의 업무를 마쳤습니다. 데이터 팀에 요청하지 않고, 조직이 합의한 용어 정의와 거버넌스가 적용된 지표를 바탕으로 비즈니스 질문에 대한 답을 직접 얻었습니다.
