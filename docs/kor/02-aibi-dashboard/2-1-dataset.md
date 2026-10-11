# 2.1) 데이터셋과 탭 만들기

이 페이지에서는 대시보드를 만들고, 위젯이 공통으로 사용할 데이터셋 `고객 360`과 탭 2개를 만듭니다.

## 1단계 - 대시보드 만들기

1. 왼쪽 사이드바 상단의 **New**를 클릭한 뒤 **Dashboard**를 클릭합니다.

    ![New > Dashboard](../assets/images/02-aibi-dashboard/2-1-01-new-dashboard.png)

2. 화면 상단의 대시보드 이름(**New Dashboard ...**)을 클릭하고 `<your_name> - Wanderbricks Customer 360`을 입력합니다. 예를 들어 이름이 Jiyu라면 `jiyu - Wanderbricks Customer 360`을 입력합니다.

    ![대시보드 이름 입력](../assets/images/02-aibi-dashboard/2-1-02-dashboard-name.png)

## 2단계 - 데이터셋 만들기

대시보드의 위젯은 **데이터셋**을 바탕으로 만들어집니다. `gold_customer_360`을 고객 세그먼트, 국가 그룹, 예약 빈도, 지출 구간, 최근성, 평점 구간 같은 분석용 차원으로 가공한 데이터셋을 만듭니다.

1. 화면 상단의 **Data** 탭을 클릭합니다.

    ![Data 탭](../assets/images/02-aibi-dashboard/2-1-03-data-tab.png)

2. **Create from SQL**을 클릭합니다.

    ![Create from SQL](../assets/images/02-aibi-dashboard/2-1-04-create-from-sql.png)

3. SQL 편집기에 아래 쿼리를 붙여넣습니다. 쿼리 안의 `jiyu_wanderbricks_marketing`을 본인의 카탈로그 이름으로 바꿉니다.

    ```sql title="고객 360 데이터셋"
    --8<-- "lab-files/kor/step2/customer_360_dataset.sql"
    ```

4. **Run**을 클릭해 쿼리를 실행합니다. 결과가 124,385행인지 확인합니다.

    ![데이터셋 쿼리 실행 결과](../assets/images/02-aibi-dashboard/2-1-05-dataset-run.png)

5. 왼쪽 데이터셋 목록에서 방금 만든 데이터셋의 이름(**Untitled dataset**)을 클릭하고 `고객 360`으로 바꿉니다.

    ![데이터셋 이름 바꾸기](../assets/images/02-aibi-dashboard/2-1-06-dataset-rename.png)

### 데이터셋 이해하기

이 데이터셋은 `gold_customer_360`의 각 고객에게 아래와 같은 분석용 컬럼을 추가합니다.

| 컬럼 | 의미 | 값 |
|---|---|---|
| `customer_segment` | 고객 유형 | 개인 고객 / 비즈니스 고객 |
| `country_group` | 국가 그룹 | 고객 수 상위 8개국 + 기타 |
| `is_booker` | 예약 경험 여부 | 예약 1건 이상이면 1 |
| `is_repeat` | 재예약 여부 | 예약 2건 이상이면 1 |
| `booking_freq` | 예약 빈도 | 0회 / 1회 / 2회 / 3회 이상 |
| `spend_tier` | 생애 지출 구간 | 지출 없음 / $350 미만 / … / $1,200 이상 |
| `recency_bucket` | 마지막 예약 이후 경과 기간 | 30일 이내 / 31–90일 / 91–180일 / 180일 초과 / 예약 없음 |
| `rating_band` | 평균 평점 구간 | 1–2점 / 2–3점 / 3–4점 / 4–5점 / 리뷰 없음 |

!!! info "최근성의 기준일"
    샘플 데이터는 2025년 7월 30일까지 존재합니다. 그래서 `recency_bucket`은 오늘 날짜가 아니라 데이터의 가장 최근 예약일(`as_of_ts`)을 기준으로 경과 기간을 계산합니다.

## 3단계 - 탭 2개 만들기

대시보드에 탭 2개를 만듭니다. 첫 번째 탭에서는 위젯을 직접 만들고, 두 번째 탭에서는 Genie Code로 위젯을 만듭니다.

1. 화면 상단의 **Canvas** 탭을 클릭해 캔버스로 돌아옵니다.

    ![Canvas 탭](../assets/images/02-aibi-dashboard/2-1-07-canvas-tab.png)

2. 화면 하단의 페이지 탭에서 기본 페이지 이름(**Untitled page**)을 더블클릭하고 `① 직접 만들기`로 바꿉니다.

    ![첫 번째 탭 이름 바꾸기](../assets/images/02-aibi-dashboard/2-1-08-rename-page-1.png)

3. 페이지 탭 옆의 **+** 를 클릭해 새 페이지를 추가하고, 이름을 `② Genie Code로 만들기`로 바꿉니다.

    ![두 번째 탭 추가](../assets/images/02-aibi-dashboard/2-1-09-add-page-2.png)

!!! success "축하합니다!"
    대시보드와 데이터셋 `고객 360`, 탭 2개를 만들었습니다. 다음 페이지에서 첫 번째 탭에 핵심 위젯을 직접 만듭니다.
