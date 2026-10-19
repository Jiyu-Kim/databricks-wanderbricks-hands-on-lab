# 3.2) Metric View: 리뷰

이 페이지에서는 리뷰 데이터의 KPI를 정의하는 Metric View `mv_reviews`를 만듭니다.

!!! tip "왜 예약과 리뷰를 하나의 Metric View로 합치지 않나요?"
    예약 1건에는 리뷰가 여러 개 달릴 수 있습니다. 실제로 99,317건의 리뷰가 54,302건의 예약에 연결되어 있습니다. 예약 Metric View에 리뷰를 조인하면 예약 행이 리뷰 수만큼 늘어나 예약 건수와 금액이 부풀려집니다(팬아웃). 그래서 사실(fact) 테이블마다 Metric View를 따로 만듭니다.

## 1단계 - Metric View 만들기

1. **Catalog**에서 `<your_name>_wanderbricks_marketing` → `default` 스키마를 클릭한 뒤, 우측 상단의 **Create** → **Metric view**를 클릭합니다.

    ![Create > Metric view](../assets/images/03-uc-semantics/3-2-01-create-metric-view.png)

2. **Name**에 `mv_reviews`를 입력합니다.

    ![Metric View 이름 입력](../assets/images/03-uc-semantics/3-2-02-metric-view-name.png)

3. 편집기가 UI 모드로 열려 있다면 우측 상단의 `<>` 토글을 클릭해 YAML 편집기로 전환합니다. YAML 편집기의 내용을 모두 지우고 아래 YAML을 붙여넣습니다. YAML 안의 `<your_name>_wanderbricks_marketing`(2곳)을 본인의 카탈로그 이름으로 바꿉니다.

    ```yaml title="mv_reviews"
    --8<-- "lab-files/kor/step3/mv_reviews.yaml"
    ```

    ![YAML 붙여넣기](../assets/images/03-uc-semantics/3-2-03-yaml-editor.png)

4. **Create**를 클릭합니다. **Overview** 탭에서 **Measures** (4)와 **Fields** (5)가 등록된 것을 확인합니다.

    ![mv_reviews Overview](../assets/images/03-uc-semantics/3-2-04-overview.png)

## 2단계 - SQL로 조회하기

1. **SQL Editor**에서 아래 쿼리를 실행합니다.

    ```sql
    SELECT
      MEASURE(`리뷰 수`)     AS reviews,
      MEASURE(`평균 평점`)   AS avg_rating,
      MEASURE(`저평점 비율`) AS low_rating_share
    FROM <your_name>_wanderbricks_marketing.default.mv_reviews;
    ```

2. 결과가 리뷰 수 99,317건, 평균 평점 약 3.01, 저평점 비율 약 26.1%인지 확인합니다.

    ![리뷰 KPI 조회 결과](../assets/images/03-uc-semantics/3-2-05-query-total.png)

!!! info "고객 유형이 비어 있는 리뷰"
    `고객 유형`으로 나눠 보면 값이 비어 있는 리뷰가 138건 있습니다. Step 1에서 이메일이 없어 Silver에서 제외된 고객이 남긴 리뷰입니다. 정제 규칙이 다른 테이블에 어떤 영향을 주는지 보여주는 예시입니다.

!!! success "축하합니다!"
    Metric View 2개를 만들었습니다. 다음 페이지에서 Domain을 만들고 이 Metric View들을 연결합니다.
