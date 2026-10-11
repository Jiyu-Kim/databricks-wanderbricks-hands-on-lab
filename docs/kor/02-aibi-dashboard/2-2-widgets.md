# 2.2) 핵심 위젯 직접 만들기

이 페이지에서는 `① 직접 만들기` 탭에 핵심 위젯 3개를 직접 만듭니다.

| # | 위젯 | 유형 | 보여주는 것 |
|---|---|---|---|
| 1 | 총 고객 수 | Counter | 전체 고객 규모 |
| 2 | 세그먼트별 생애 지출 | Bar | 개인 고객과 비즈니스 고객의 지출 비교 |
| 3 | 월별 최근 예약 고객 수 | Line | 마지막 예약 시점별 고객 분포 |

먼저 화면 하단의 페이지 탭에서 `① 직접 만들기`를 클릭해 첫 번째 탭으로 이동합니다.

![① 직접 만들기 탭](../assets/images/02-aibi-dashboard/2-2-01-page-1.png)

## 1단계 - 총 고객 수 (Counter)

1. 화면 하단의 도구 모음에서 **Add a visualization**을 클릭한 뒤, 캔버스의 원하는 위치를 클릭해 위젯을 배치합니다.

    ![Add a visualization](../assets/images/02-aibi-dashboard/2-2-02-add-visualization.png)

2. 오른쪽 설정 패널에서 **Dataset**으로 `고객 360`을, **Visualization**으로 **Counter**를 선택합니다.

    ![Counter 선택](../assets/images/02-aibi-dashboard/2-2-03-counter-type.png)

3. **Value**에 `user_id`를 선택하고, 집계 함수를 **COUNT**로 바꿉니다.

    ![Counter Value 설정](../assets/images/02-aibi-dashboard/2-2-04-counter-value.png)

4. 위젯 설정 패널에서 **Title**을 켜고, 위젯 제목을 `총 고객 수`로 입력합니다.

    ![Counter 제목 입력](../assets/images/02-aibi-dashboard/2-2-05-counter-title.png)

5. 위젯에 `124,385`가 표시되는지 확인합니다.

    ![총 고객 수 위젯](../assets/images/02-aibi-dashboard/2-2-06-counter-result.png)

## 2단계 - 세그먼트별 생애 지출 (Bar)

1. **Add a visualization**을 클릭하고, Counter 위젯 옆에 위젯을 배치합니다.

    ![두 번째 위젯 배치](../assets/images/02-aibi-dashboard/2-2-07-add-bar.png)

2. **Dataset**으로 `고객 360`을, **Visualization**으로 **Bar**를 선택합니다.

    ![Bar 선택](../assets/images/02-aibi-dashboard/2-2-08-bar-type.png)

3. **X axis**에 `customer_segment`를, **Y axis**에 `lifetime_spend`를 선택하고 집계 함수를 **SUM**으로 둡니다.

    ![Bar 축 설정](../assets/images/02-aibi-dashboard/2-2-09-bar-axes.png)

4. 위젯 제목을 `세그먼트별 생애 지출`로 입력합니다.

    ![Bar 제목 입력](../assets/images/02-aibi-dashboard/2-2-10-bar-title.png)

5. 비즈니스 고객 약 $2.10M, 개인 고객 약 $2.02M의 막대가 표시되는지 확인합니다.

    ![세그먼트별 생애 지출 위젯](../assets/images/02-aibi-dashboard/2-2-11-bar-result.png)

!!! tip "생애 지출은 어떤 기준인가요?"
    `lifetime_spend`는 Step 1에서 정의한 대로 **숙박이 완료된(`completed`) 예약**의 금액만 합산한 값입니다. 취소되거나 아직 숙박하지 않은 예약은 포함하지 않습니다.

## 3단계 - 월별 최근 예약 고객 수 (Line)

1. **Add a visualization**을 클릭하고, 앞의 두 위젯 아래에 위젯을 배치합니다.

    ![세 번째 위젯 배치](../assets/images/02-aibi-dashboard/2-2-12-add-line.png)

2. **Dataset**으로 `고객 360`을, **Visualization**으로 **Line**을 선택합니다.

    ![Line 선택](../assets/images/02-aibi-dashboard/2-2-13-line-type.png)

3. **X axis**에 `last_booking_at`을 선택하고, 날짜 단위를 **Monthly**로 바꿉니다. **Y axis**에 `user_id`를 선택하고 집계 함수를 **COUNT**로 바꿉니다.

    ![Line 축 설정](../assets/images/02-aibi-dashboard/2-2-14-line-axes.png)

4. 위젯 제목을 `월별 최근 예약 고객 수`로 입력합니다.

    ![Line 제목 입력](../assets/images/02-aibi-dashboard/2-2-15-line-title.png)

5. 2025년으로 갈수록 마지막 예약 고객 수가 크게 늘어나는 추이가 표시되는지 확인합니다.

    ![월별 최근 예약 고객 수 위젯](../assets/images/02-aibi-dashboard/2-2-16-line-result.png)

## 4단계 - 레이아웃 정리하기

1. 위젯의 모서리를 드래그해 크기를 조절하고, 위젯을 드래그해 위치를 정리합니다.

    ![완성된 ① 직접 만들기 탭](../assets/images/02-aibi-dashboard/2-2-17-layout.png)

!!! success "축하합니다!"
    핵심 위젯 3개를 직접 만들었습니다. 다음 페이지에서는 Genie Code에게 프롬프트 한 번으로 나머지 위젯을 만들게 합니다.
