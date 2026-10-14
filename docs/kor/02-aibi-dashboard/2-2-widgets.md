# 2.2) 핵심 위젯 직접 만들기

이 페이지에서는 `① 직접 만들기` 탭에 핵심 위젯 3개를 직접 만든 뒤, 고객을 여러 각도로 나눠 보는 **세그먼트 & 분포** 위젯 4개를 추가합니다.

| # | 위젯 | 유형 | 보여주는 것 |
|---|---|---|---|
| 1 | 총 고객 수 | Counter | 전체 고객 규모 |
| 2 | 세그먼트별 생애 지출 | Bar | 개인 고객과 비즈니스 고객의 지출 비교 |
| 3 | 월별 최근 예약 고객 수 | Line | 마지막 예약 시점별 고객 분포 |
| 4 | RFM 히트맵 — 최근성 × 빈도 | Heatmap | 최근에, 자주 예약한 고객일수록 지출이 큰지 |
| 5 | LTV 분포 (지출 고객) | Histogram | 생애 지출 금액이 어느 구간에 몰려 있는지 |
| 6 | 국가별 예약 빈도 구성 | Bar (누적·가로) | 국가마다 재예약 고객 비중이 어떻게 다른지 |
| 7 | 국가별 규모 vs 고객 가치 | Scatter (버블) | 고객이 많은 국가가 1인당 가치도 높은지 |

먼저 화면 하단의 페이지 탭에서 `① 직접 만들기`를 클릭해 첫 번째 탭으로 이동합니다.

![① 직접 만들기 탭](../assets/images/02-aibi-dashboard/2-2-01-page-1.png)

## 1단계 - 총 고객 수 (Counter)

1. 화면 하단의 도구 모음에서 **Add a visualization**(차트 아이콘)을 클릭한 뒤, 캔버스의 원하는 위치를 클릭해 위젯을 배치합니다. 새 위젯 안에 **Ask Genie Code to edit this chart...** 입력창이 보이지만, 이번 탭에서는 사용하지 않고 오른쪽 설정 패널에서 직접 설정합니다.

    ![Add a visualization](../assets/images/02-aibi-dashboard/2-2-02-add-visualization.png)

2. 오른쪽 설정 패널의 **Visualization**에서 **Counter**를 선택합니다. 데이터셋이 하나뿐이라 그 아래에 `고객 360`이 자동으로 선택되어 있습니다.

    ![Counter 선택](../assets/images/02-aibi-dashboard/2-2-03-counter-type.png)

3. **Value** 옆의 **+**를 클릭해 `user_id`를 선택합니다. 기본 집계는 **SUM**이므로, 추가된 `SUM(user_id)`를 클릭한 뒤 **Transform**에서 **COUNT**를 선택해 `COUNT(user_id)`로 바꿉니다.

    ![Counter Value 설정](../assets/images/02-aibi-dashboard/2-2-04-counter-value.png)

4. 설정 패널 맨 위의 **Title**을 체크하면 위젯 상단에 제목 입력란이 생깁니다. 제목으로 `총 고객 수`를 입력합니다.

    ![Counter 제목 입력](../assets/images/02-aibi-dashboard/2-2-05-counter-title.png)

5. 위젯에 `124.39K`(124,385명)가 표시되는지 확인합니다.

    ![총 고객 수 위젯](../assets/images/02-aibi-dashboard/2-2-06-counter-result.png)

## 2단계 - 세그먼트별 생애 지출 (Bar)

1. **Add a visualization**을 클릭하고, Counter 위젯 오른쪽 빈 곳을 클릭해 위젯을 배치합니다.

    ![두 번째 위젯 배치](../assets/images/02-aibi-dashboard/2-2-07-add-bar.png)

2. **Visualization**이 **Bar**인지 확인합니다. 새 위젯의 기본값이 Bar입니다.

    ![Bar 선택](../assets/images/02-aibi-dashboard/2-2-08-bar-type.png)

3. **X axis** 옆의 **+**를 클릭해 `customer_segment`를, **Y axis** 옆의 **+**를 클릭해 `lifetime_spend`를 선택합니다. Y축은 기본값인 `SUM(lifetime_spend)`를 그대로 둡니다.

    ![Bar 축 설정](../assets/images/02-aibi-dashboard/2-2-09-bar-axes.png)

4. **Title**을 체크하고 위젯 제목을 `세그먼트별 생애 지출`로 입력합니다.

    ![Bar 제목 입력](../assets/images/02-aibi-dashboard/2-2-10-bar-title.png)

5. 개인 고객과 비즈니스 고객의 막대가 모두 약 2M(비즈니스 고객 약 $2.10M, 개인 고객 약 $2.02M)으로 비슷하게 표시되는지 확인합니다.

    ![세그먼트별 생애 지출 위젯](../assets/images/02-aibi-dashboard/2-2-11-bar-result.png)

!!! tip "생애 지출은 어떤 기준인가요?"
    `lifetime_spend`는 Step 1에서 정의한 대로 **숙박이 완료된(`completed`) 예약**의 금액만 합산한 값입니다. 취소되거나 아직 숙박하지 않은 예약은 포함하지 않습니다.

## 3단계 - 월별 최근 예약 고객 수 (Line)

1. **Add a visualization**을 클릭하고, 앞의 두 위젯 아래 빈 곳을 클릭해 위젯을 배치합니다.

    ![세 번째 위젯 배치](../assets/images/02-aibi-dashboard/2-2-12-add-line.png)

2. **Visualization**을 클릭하고 **Line**을 선택합니다.

    ![Line 선택](../assets/images/02-aibi-dashboard/2-2-13-line-type.png)

3. **X axis**에 `last_booking_at`을 선택합니다. 날짜 필드는 기본으로 월 단위(`MONTHLY(last_booking_at)`)가 적용됩니다. **Y axis**에 `user_id`를 선택한 뒤, Counter와 같은 방법으로 집계를 **COUNT**로 바꿉니다.

    ![Line 축 설정](../assets/images/02-aibi-dashboard/2-2-14-line-axes.png)

4. **Title**을 체크하고 위젯 제목을 `월별 최근 예약 고객 수`로 입력합니다.

    ![Line 제목 입력](../assets/images/02-aibi-dashboard/2-2-15-line-title.png)

5. 2025년으로 갈수록 마지막 예약 고객 수가 크게 늘어나는 추이가 표시되는지 확인합니다.

    ![월별 최근 예약 고객 수 위젯](../assets/images/02-aibi-dashboard/2-2-16-line-result.png)

## 4단계 - 레이아웃 정리하기

1. 위젯의 모서리를 드래그해 크기를 조절하고, 위젯을 드래그해 위치를 정리합니다.

    ![완성된 ① 직접 만들기 탭](../assets/images/02-aibi-dashboard/2-2-17-layout.png)

## 5단계 - 세그먼트 & 분포 위젯용 데이터셋 추가하기

히스토그램과 버블 차트는 `고객 360`과 행의 단위가 다른 데이터가 필요합니다. 데이터셋 2개를 더 만듭니다.

| 데이터셋 | 행 단위 | 행 수 | 사용하는 위젯 |
|---|---|---|---|
| `지출 고객` | 숙박 완료 예약이 있는 고객 1명 | 7,195 | LTV 분포 (Histogram) |
| `국가별 고객 요약` | 국가 1개 (고객 500명 이상) | 47 | 국가별 규모 vs 고객 가치 (Scatter) |

1. [2.1)의 2단계](2-1-dataset.md#2-)와 같은 방법으로 **Data** 탭 → **Create from SQL**을 클릭하고, 아래 쿼리를 붙여넣어 실행한 뒤 데이터셋 이름을 `지출 고객`으로 바꿉니다.

    ```sql title="지출 고객 데이터셋"
    --8<-- "lab-files/kor/step2/spender_dataset.sql"
    ```

2. 같은 방법으로 아래 쿼리로 데이터셋을 하나 더 만들고, 이름을 `국가별 고객 요약`으로 바꿉니다.

    ```sql title="국가별 고객 요약 데이터셋"
    --8<-- "lab-files/kor/step2/country_dataset.sql"
    ```

3. **Canvas** 탭으로 돌아와 `① 직접 만들기` 탭의 기존 위젯 아래로 스크롤합니다.

!!! info "왜 `지출 고객`을 따로 만드나요?"
    고객의 94%(117,190명)는 숙박 완료 예약이 없어 생애 지출이 비어 있습니다. `고객 360`으로 히스토그램을 그리면 이 고객들이 차트 밖의 `nulls`로 따로 집계되고, 실제로 돈을 쓴 고객의 분포가 잘 보이지 않습니다. 그래서 지출 고객만 남긴 데이터셋을 씁니다.

## 6단계 - RFM 히트맵 (Heatmap)

**최근성(Recency)**과 **예약 빈도(Frequency)** 두 축으로 고객을 나누고, 셀의 색으로 **평균 생애 지출(Monetary)**을 표시합니다.

1. **Add a visualization**을 클릭하고 기존 위젯 아래 빈 곳을 클릭해 위젯을 배치합니다.

    ![세그먼트 위젯 배치](../assets/images/02-aibi-dashboard/2-2-18-add-segment-widget.png)

2. **Visualization** 드롭다운을 열고 목록을 아래로 스크롤해 **Heatmap**을 선택합니다.

    ![Heatmap 선택](../assets/images/02-aibi-dashboard/2-2-19-heatmap-type.png)

3. **X axis** 옆의 **+**를 클릭합니다. 데이터셋이 여러 개이므로 필드 목록이 데이터셋별로 묶여 있습니다. **고객 360**을 펼치고 `recency_bucket`을 선택합니다.

    ![데이터셋 펼치고 필드 선택](../assets/images/02-aibi-dashboard/2-2-20-heatmap-dataset.png)

4. **Y axis**에 `booking_freq`를, **Color**에 `lifetime_spend`를 선택합니다.

    ![Heatmap 필드 설정](../assets/images/02-aibi-dashboard/2-2-21-heatmap-fields.png)

5. **Color**에 추가된 `SUM(lifetime_spend)`를 클릭하고 **Transform**에서 **AVG**를 선택합니다. 셀 색이 합계가 아니라 **세그먼트별 평균 지출**을 나타내게 됩니다.

    ![Color 집계를 AVG로 변경](../assets/images/02-aibi-dashboard/2-2-22-heatmap-avg.png)

6. 설정 패널 아래쪽의 **Labels**를 켜서 셀 안에 값을 표시합니다. **Title**을 체크하고 제목을 `RFM 히트맵 — 최근성 × 빈도`로 입력합니다.

    ![히트맵 완성](../assets/images/02-aibi-dashboard/2-2-23-heatmap-result.png)

7. 예약 빈도가 높을수록(아래 행) 평균 지출이 크게 늘어나는지 확인합니다. 예를 들어 `1회` 행은 약 48~61, `3회 이상` 행은 약 171~193입니다.

!!! tip "히트맵 읽는 법"
    `recency_bucket`과 `booking_freq` 값 앞의 `1)`, `2)` 같은 번호는 축이 기간 순서대로 정렬되도록 붙인 것입니다. 이 데이터에서는 최근성보다 **예약 빈도**가 지출과 훨씬 강하게 연결되어 있습니다. 그래서 2회 이상 예약 고객을 늘리는 재예약 캠페인이 효과적이라는 해석을 할 수 있습니다.

## 7단계 - LTV 분포 (Histogram)

1. **Add a visualization**을 클릭하고 히트맵 오른쪽 빈 곳에 위젯을 배치합니다. **Visualization**에서 **Histogram**을 선택합니다.

2. **X axis** 옆의 **+**를 클릭하고, 이번에는 **지출 고객**을 펼쳐 `spender_ltv`를 선택합니다.

    ![지출 고객 데이터셋에서 필드 선택](../assets/images/02-aibi-dashboard/2-2-24-histogram-dataset.png)

3. **Y axis**에 **COUNT(\*)**를 선택합니다.

4. X축의 `BIN(spender_ltv)`를 클릭하고 **Bin size**를 `100`으로 바꿉니다. 생애 지출이 $100 단위 구간으로 나뉩니다.

    ![Bin size 100](../assets/images/02-aibi-dashboard/2-2-25-histogram-bin.png)

5. **Title**을 체크하고 제목을 `LTV 분포 (지출 고객)`으로 입력합니다.

    ![LTV 분포 위젯](../assets/images/02-aibi-dashboard/2-2-26-histogram-result.png)

6. 생애 지출이 대부분 $1,000 아래에 고르게 분포하고, $1,000을 넘는 고객은 소수라는 것을 확인합니다.

## 8단계 - 국가별 예약 빈도 구성 (누적 가로 막대)

1. **Add a visualization**을 클릭하고 히트맵 아래 빈 곳에 위젯을 배치합니다. **Visualization**은 기본값 **Bar**를 그대로 둡니다.

2. **X axis**에 **고객 360**의 `country_group`을, **Y axis**에 **COUNT(\*)**를, **Color**에 `booking_freq`를 선택합니다. 같은 막대 안에서 예약 빈도별 고객 수가 쌓여 표시됩니다.

    ![누적 막대 필드 설정](../assets/images/02-aibi-dashboard/2-2-27-stacked-fields.png)

3. **X axis**와 **Y axis** 사이의 **⇅**(축 바꾸기) 아이콘을 클릭해 가로 막대로 바꿉니다. 국가 이름이 세로로 나열되어 읽기 쉬워집니다.

    ![축 바꾸기](../assets/images/02-aibi-dashboard/2-2-28-stacked-swap.png)

4. **Title**을 체크하고 제목을 `국가별 예약 빈도 구성`으로 입력합니다.

    ![국가별 예약 빈도 구성 위젯](../assets/images/02-aibi-dashboard/2-2-29-stacked-result.png)

## 9단계 - 국가별 규모 vs 고객 가치 (버블 차트)

1. **Add a visualization**을 클릭하고 누적 막대 오른쪽 빈 곳에 위젯을 배치합니다. **Visualization**에서 **Scatter**를 선택합니다.

    ![Scatter 선택](../assets/images/02-aibi-dashboard/2-2-30-bubble-type.png)

2. **X axis** 옆의 **+**를 클릭하고 **국가별 고객 요약**을 펼쳐 `customers`를 선택합니다. **Y axis**에 `avg_ltv`를 선택합니다. 이 데이터셋은 국가 1개가 1행이라 점 하나가 국가 하나입니다.

3. **Size**에 `total_spend`를, **Color**에 `country`를 선택합니다. 점의 크기가 국가별 총 지출을 나타내는 버블 차트가 됩니다.

    ![버블 차트 필드 설정](../assets/images/02-aibi-dashboard/2-2-31-bubble-fields.png)

4. **Title**을 체크하고 제목을 `국가별 규모 vs 고객 가치`로 입력합니다.

5. 고객이 압도적으로 많은 인도·중국(오른쪽 큰 버블)도 1인당 평균 LTV는 다른 국가들과 비슷한 $570~580 수준인지 확인합니다.

!!! tip "범례가 너무 길다면"
    `country`는 47개 값이 있어 범례가 길어집니다. 위젯 높이를 키우거나, 색 구분이 필요 없다면 **Color**의 `country`를 빼도 됩니다(위젯 위에 마우스를 올리면 국가 이름이 표시됩니다).

## 10단계 - 세그먼트 & 분포 영역 확인하기

1. 위젯 4개의 크기와 위치를 2×2로 정리합니다.

    ![완성된 세그먼트 & 분포](../assets/images/02-aibi-dashboard/2-2-32-segment-result.png)

!!! success "축하합니다!"
    핵심 위젯 3개와 세그먼트 & 분포 위젯 4개를 직접 만들었습니다. 다음 페이지에서는 Genie Code에게 프롬프트 한 번으로 나머지 위젯을 만들게 합니다.
