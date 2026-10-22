# 4.2) Monitoring: 현업 피드백 받기

이 페이지에서는 마케팅 임원 Mina가 되어 Genie Agent에 업무 질문을 던지고, 답이 틀렸을 때 피드백을 남깁니다. 그리고 다시 Aiden이 되어 **Monitor** 탭에서 그 피드백을 확인합니다.

## 1단계 - Mina로서 질문하기

![Mina](../assets/images/personas/mina.svg){ width="72" align=left }

**📈 Mina:** *"다음 분기 국가별 마케팅 예산을 정하려면, 작년에 어느 나라에서 매출이 많이 나왔는지부터 봐야겠어요."*

<br clear="left">

1. Genie Agent 화면 우측 상단의 **New chat** 아이콘(연필이 있는 사각형)을 클릭해 새 대화를 시작합니다.

    ![New chat](../assets/images/04-genie-agent/4-2-01-new-chat.png)

2. 아래 질문을 입력하고 전송합니다.

    !!! prompt "프롬프트"
        ```text
        2024년 국가별 매출 Top 5 알려줘
        ```

    ![질문 입력](../assets/images/04-genie-agent/4-2-02-ask-revenue.png)

3. 답변의 결과 표와 **Show code**로 생성된 SQL을 확인합니다. Genie가 `` MEASURE(`총 예약 금액`) ``을 사용해, INDIA의 매출을 $2,249,571(약 $2.25M)로 답했는지 확인합니다.

    ![매출 질문 답변](../assets/images/04-genie-agent/4-2-03-revenue-answer.png)

!!! warning "무엇이 잘못되었나요?"
    Wanderbricks에서 **매출**은 확정(`confirmed`)되었거나 숙박이 완료된(`completed`) 예약의 금액입니다. 그런데 Metric View에는 "매출"이라는 measure가 없고, 가장 비슷한 `총 예약 금액`만 있습니다. `총 예약 금액`은 취소(`cancelled`)와 대기(`pending`) 예약까지 포함한 거래 금액이므로, Genie는 매출을 실제보다 약 2.8배 크게 답했습니다.

    | 국가 | Genie의 답 (총 예약 금액) | 올바른 매출 |
    |---|---|---|
    | INDIA | 약 $2.25M | 약 $0.82M |

## 2단계 - 피드백 남기기

1. 답변 아래의 **Is this useful?** 옆에 있는 👎 버튼을 클릭합니다.

    ![👎 클릭](../assets/images/04-genie-agent/4-2-04-thumbs-down.png)

2. 나타나는 이유 중 **Drew wrong conclusions**를 클릭하고, **What went wrong?** 입력란에 아래 내용을 입력한 뒤 **Submit**을 클릭합니다.

    ```text
    매출은 확정(confirmed)·숙박 완료(completed) 예약의 금액만 포함해야 합니다. 취소·대기 예약까지 포함된 총 예약 금액으로 계산되어 실제보다 크게 나왔습니다.
    ```

    ![피드백 코멘트 입력](../assets/images/04-genie-agent/4-2-05-feedback-comment.png)

## 3단계 - Aiden으로서 Monitor 탭에서 피드백 확인하기

![Aiden](../assets/images/personas/aiden.svg){ width="72" align=left }

**🤖 Aiden:** *"현업이 어떤 질문을 하고, 어떤 답에 불만족했는지 확인해 볼게요."*

<br clear="left">

1. Genie Agent 화면 상단의 **Monitor**를 클릭합니다.

    ![Monitor 탭](../assets/images/04-genie-agent/4-2-06-monitor-tab.png)

2. **Activity digest**에서 **Thumbs down**이 1건인 것을 확인합니다. 아래 목록에서 **Rating**이 **Bad**이고 **Comment**에 Mina의 코멘트가 있는 질문 **2024년 국가별 매출 Top 5 알려줘**를 클릭합니다.

    ![피드백 받은 질문](../assets/images/04-genie-agent/4-2-07-feedback-list.png)

3. 오른쪽에 열린 패널에서 사용자의 질문, Genie의 답변(**Show code**를 클릭하면 생성한 SQL), 그리고 맨 아래에 Mina가 남긴 코멘트를 확인합니다.

    ![피드백 상세](../assets/images/04-genie-agent/4-2-08-feedback-detail.png)

!!! tip "Monitoring으로 알 수 있는 것"
    Monitoring은 실제 사용자가 어떤 표현으로 질문하는지, 어떤 답에 만족하지 못했는지를 보여줍니다. 이번 피드백으로 **"매출"이라는 비즈니스 용어가 Metric View에 정의되어 있지 않다**는 문제를 발견했습니다. 이 문제는 4.4에서 해결합니다.

!!! success "축하합니다!"
    현업의 피드백으로 Genie Agent의 문제를 하나 발견했습니다. 다음 페이지에서는 Benchmark로 또 다른 문제를 찾아봅니다.
