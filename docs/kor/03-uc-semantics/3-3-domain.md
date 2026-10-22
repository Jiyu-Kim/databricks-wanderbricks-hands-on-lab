# 3.3) Domain 만들고 연결하기

이 페이지에서는 Domain을 만들고, 앞에서 만든 Metric View 2개를 Domain에 연결합니다. Domain에 연결된 자산은 **Discover** 페이지에서 비즈니스 영역별로 찾아볼 수 있습니다.

<div class="wb-arch">
  <div class="wb-arch__col">
    <p class="wb-arch__label">1단계 · Domain 만들기</p>
    <div class="wb-arch__node"><strong>Domain</strong><span>wanderbricks_<wbr>marketing</span></div>
    <div class="wb-arch__node"><strong>Governed Tag</strong><span>wanderbricks_<wbr>marketing · 함께 생성</span></div>
  </div>
  <div class="wb-arch__flow" aria-hidden="true"></div>
  <div class="wb-arch__col">
    <p class="wb-arch__label">2단계 · Tag 연결</p>
    <div class="wb-arch__node"><strong>mv_bookings</strong><span>Governed Tag 연결</span></div>
    <div class="wb-arch__node"><strong>mv_reviews</strong><span>Governed Tag 연결</span></div>
  </div>
  <div class="wb-arch__flow" aria-hidden="true"></div>
  <div class="wb-arch__col wb-arch__col--center">
    <p class="wb-arch__label">3단계 · Domain에 표시</p>
    <div class="wb-arch__node"><strong>Domain</strong><span>Metric View 2개 표시</span></div>
  </div>
</div>

## 1단계 - Domain 만들기

Domain은 Governed Tag를 기반으로 만들어집니다. Domain을 만들 때 같은 이름의 Governed Tag가 함께 만들어집니다.

1. 왼쪽 사이드바에서 **Discover**를 클릭한 뒤, 우측 상단의 **Create** → **Create domain**을 클릭합니다.

    ![Discover > Create domain](../assets/images/03-uc-semantics/3-3-04-create-domain.png)

2. **Source**는 **New tag**를 그대로 두고, 오른쪽 입력란에 `<your_name>_wanderbricks_marketing`(예: `jiyu_wanderbricks_marketing`)을 입력합니다. 나머지 항목은 아래와 같이 입력하고 **Create**를 클릭합니다.

    | 항목 | 입력값 |
    |---|---|
    | **Subtitle** | `고객·예약·리뷰 마케팅 지표` |
    | **Description** | `Wanderbricks 마케팅팀이 사용하는 예약·리뷰 KPI와 비즈니스 용어를 모은 도메인입니다.` |
    | **Business Contacts** (선택) | 본인 |

    ![Domain 정보 입력](../assets/images/03-uc-semantics/3-3-06-domain-form.png)

3. Domain은 **Draft** 상태로 만들어집니다. 우측 상단의 **Publish**를 클릭해 다른 사용자도 볼 수 있게 게시합니다.

    ![Domain Publish](../assets/images/03-uc-semantics/3-3-07-publish-domain.png)

## 2단계 - Metric View에 Tag 연결하기

1. **Catalog**에서 `<your_name>_wanderbricks_marketing` → `default` → `mv_bookings`를 클릭합니다.

    ![mv_bookings 열기](../assets/images/03-uc-semantics/3-3-08-open-mv-bookings.png)

2. 아래로 스크롤해 **About this metric view** 영역의 **Tags** 아래에 있는 **Add tags**를 클릭합니다.

    ![Add tags](../assets/images/03-uc-semantics/3-3-09-add-tags.png)

3. **Key**에 이름을 입력해 `<your_name>_wanderbricks_marketing`을 선택하고, **Value**는 비워 둔 채 **Save**를 클릭합니다.

    ![Tag 선택 후 저장](../assets/images/03-uc-semantics/3-3-10-select-tag-save.png)

4. 같은 방법으로 `mv_reviews`에도 Tag를 연결합니다.

    ![mv_reviews Tag 연결](../assets/images/03-uc-semantics/3-3-11-tag-mv-reviews.png)

??? tip "SQL로 Tag 연결하기"
    SQL Editor에서 아래 쿼리를 실행해도 같은 결과를 얻을 수 있습니다.

    ```sql
    ALTER VIEW <your_name>_wanderbricks_marketing.default.mv_bookings
      SET TAGS ('<your_name>_wanderbricks_marketing' = '');
    ALTER VIEW <your_name>_wanderbricks_marketing.default.mv_reviews
      SET TAGS ('<your_name>_wanderbricks_marketing' = '');
    ```

## 3단계 - Domain에서 확인하기

1. 왼쪽 사이드바에서 **Discover**를 클릭한 뒤, 상단 필터의 **Domain**을 클릭합니다. 검색창에 본인 이름을 입력하고 `<your_name>_wanderbricks_marketing`을 선택합니다.

    ![Domain 선택](../assets/images/03-uc-semantics/3-3-12-open-domain.png)

2. Domain 페이지에 `mv_bookings`와 `mv_reviews`가 표시되는지 확인합니다.

    ![Domain에 연결된 Metric View](../assets/images/03-uc-semantics/3-3-13-domain-assets.png)

!!! info "Tag가 반영되기까지"
    Tag를 연결한 자산이 Domain 페이지에 표시되기까지 몇 분 정도 걸릴 수 있습니다. 바로 보이지 않으면 잠시 후 새로고침합니다.

!!! success "축하합니다!"
    Ana의 업무를 마쳤습니다. 비즈니스 KPI를 Metric View로 정의하고, 마케팅 분석 자산을 Domain으로 묶었습니다. 다음 Step에서는 AI 엔지니어 Aiden이 되어, 이 Metric View로 마케팅 임원 Mina가 사용할 Genie Agent를 만듭니다.
