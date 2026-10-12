# 2.3) Genie Code로 한 번에 만들기

이 페이지에서는 `② Genie Code로 만들기` 탭에서 **Genie Code**에게 자연어 프롬프트 한 번으로 대시보드 위젯을 만들게 합니다.

## 1단계 - Genie Code 열기

1. 화면 상단의 페이지 탭에서 `② Genie Code로 만들기`를 클릭합니다.

    ![② Genie Code로 만들기 탭](../assets/images/02-aibi-dashboard/2-3-01-page-2.png)

2. 화면 우측 상단의 **Genie Code** 아이콘을 클릭합니다. 오른쪽에 Genie Code 패널이 열리고, 맨 아래에 입력창이 있습니다.

    ![Genie Code 패널 열기](../assets/images/02-aibi-dashboard/2-3-02-open-genie-code.png)

## 2단계 - 프롬프트 입력하기

1. Genie Code 입력창에 아래 프롬프트를 붙여넣고 전송합니다.

    !!! info "Prompt:"
        ```text
        고객 360 데이터셋을 기반으로 고객 360 대시보드를 만들어줘. 대시보드에는 아래 항목을 반드시 포함해줘:
        - 총 고객 수, 예약 전환율, 총 생애 지출 KPI
        - 고객 세그먼트별 지출
        - 월별 최근 예약 추이
        - 국가별 고객 수
        - 예약 빈도별 고객 비중
        - VIP 고객 Top 50 테이블
        ```

    ![프롬프트 입력](../assets/images/02-aibi-dashboard/2-3-03-prompt.png)

2. Genie Code가 대시보드 구성과 데이터셋을 확인하고(**Thoughts**, **Read dashboard configuration** 등) 위젯을 만들어 캔버스에 배치합니다. 1~2분 정도 걸리며, 패널에 **Created widgets**와 요약이 표시될 때까지 기다립니다.

    ![Genie Code가 위젯을 만드는 중](../assets/images/02-aibi-dashboard/2-3-04-generating.png)

## 3단계 - 결과 확인하고 다듬기

1. Genie Code가 만든 위젯을 확인합니다. 프롬프트에 요청한 아래 항목이 모두 만들어졌는지 확인합니다.

    | 항목 | 위젯 유형 (예시) |
    |---|---|
    | 총 고객 수, 예약 전환율, 총 생애 지출 | Counter 3개 (약 124.39K / 43.93 / 4.13M) |
    | 세그먼트별 지출 | Bar |
    | 월별 최근 예약 추이 | Line |
    | 국가별 고객 수 | Bar |
    | 예약 빈도 비중 | Pie |
    | VIP Top 50 | Table |

    ![Genie Code가 만든 위젯](../assets/images/02-aibi-dashboard/2-3-05-result.png)

2. Genie Code가 만든 위젯은 별도의 승인 없이 바로 캔버스에 반영됩니다. 오류가 난 위젯(예: **Unable to render visualization**)이나 고치고 싶은 위젯이 있으면, 같은 패널에 후속 요청을 입력해 수정합니다. 아래는 VIP 테이블 오류를 후속 요청으로 고친 예입니다.

    ![후속 요청으로 위젯 수정](../assets/images/02-aibi-dashboard/2-3-06-accept.png)

!!! tip "결과는 매번 조금씩 다를 수 있습니다"
    Genie Code는 생성형 AI이므로, 같은 프롬프트를 입력해도 위젯의 유형, 배치, 제목이 실습자마다 조금씩 다를 수 있습니다. 원하는 결과가 아니라면 "예약 빈도 비중을 Pie 차트로 바꿔줘"처럼 후속 요청으로 수정할 수 있습니다.

## 4단계 - 대시보드 게시하기

1. 화면 우측 상단의 **Publish**를 클릭합니다.

    ![Publish](../assets/images/02-aibi-dashboard/2-3-07-publish.png)

2. 게시 옵션(**Share data permission**)을 기본값으로 두고 **Publish**를 클릭합니다. 이어서 공유 설정 창이 열리면 닫고, 상단의 **View published**를 클릭해 게시된 대시보드를 확인합니다. 게시본에는 **Data** 탭 없이 두 페이지 탭만 보입니다.

    ![게시된 대시보드](../assets/images/02-aibi-dashboard/2-3-08-published.png)

!!! success "축하합니다!"
    고객 360 대시보드를 완성했습니다. 그런데 "예약 전환율"이나 "VIP 고객" 같은 지표는 지금 이 대시보드의 SQL 안에만 정의되어 있어, 다른 사람이 다른 도구에서 같은 지표를 계산하면 숫자가 달라질 수 있습니다. 다음 Step에서는 Ana가 비즈니스 지표를 **Unity Catalog Semantics**로 정의해 조직 전체가 같은 숫자를 보도록 만듭니다.
