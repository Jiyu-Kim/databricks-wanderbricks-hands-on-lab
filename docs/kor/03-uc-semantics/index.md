# 3) Unity Catalog Semantics 구축

<div class="wb-meta" markdown>

- :material-clock-outline: 약 25분
- :material-account-outline: Ana
- :material-file-document-multiple-outline: 페이지 3개

</div>

## 실습 개요

Step 2에서 만든 대시보드의 "예약 전환율", "VIP 고객" 같은 지표는 대시보드 SQL 안에만 정의되어 있습니다. 다른 사람이 다른 도구에서 같은 지표를 계산하면 숫자가 달라질 수 있고, AI도 그 정의를 알 수 없습니다.

이번 실습에서는 **Unity Catalog Semantics**로 비즈니스 지표를 한 번 정의해, 대시보드, SQL, Genie 같은 AI가 모두 같은 정의를 사용하도록 만듭니다.

## 이번 실습에서의 역할

<div class="wb-roles" markdown>

<div class="wb-persona wb-persona--side" markdown>

![Ana](../assets/images/personas/ana.svg)

<p class="wb-persona__name">Ana<span>Data Analyst</span></p>

여러분은 계속해서 데이터 분석가 Ana입니다. 대시보드마다 흩어져 있던 KPI 계산 로직을 **Metric View**로 정의하고, 마케팅 분석 자산을 **Domain**으로 묶어 조직 전체가 찾아 쓸 수 있게 합니다. 이 결과물은 Step 4에서 AI 엔지니어 Aiden이 Genie Agent를 만드는 기반이 됩니다.

</div>

</div>

## Unity Catalog Semantics란?

Unity Catalog Semantics는 비즈니스 지표, 용어, 조직 구조를 정의해 사람과 AI가 데이터를 같은 의미로 해석하도록 돕는 기능입니다.

| 구성 요소 | 설명 | 이 실습에서 |
|---|---|---|
| **Metric View** | KPI를 YAML로 정의하는 Unity Catalog 객체입니다. 측정값(measure)과 분석 기준(dimension)을 분리해, 어떤 기준으로 나눠 보더라도 같은 계산 로직이 적용됩니다. | Step 3.1, 3.2 |
| **Domain** | 데이터 자산을 비즈니스 목적별로 묶는 조직 단위입니다. Governed Tag를 기반으로 만들어집니다. | Step 3.3 |
| **Page** | "매출", "성수기" 같은 비즈니스 용어의 공식 정의입니다. Domain 안에 만들어지며, Genie One이 답변할 때 참조합니다. | Step 4.4 |

## 실습 구조

| 페이지 | 내용 |
|---|---|
| [3.1) Metric View: 예약](3-1-mv-bookings.md) | 예약 데이터의 KPI(예약 건수, 총 예약 금액, 취소율 등)를 정의하는 `mv_bookings`를 만듭니다. |
| [3.2) Metric View: 리뷰](3-2-mv-reviews.md) | 리뷰 데이터의 KPI(리뷰 수, 평균 평점, 저평점 비율 등)를 정의하는 `mv_reviews`를 만듭니다. |
| [3.3) Domain 만들고 연결하기](3-3-domain.md) | Governed Tag와 Domain을 만들고, Metric View 2개를 Domain에 연결합니다. |

!!! info "Page는 Step 4에서 만듭니다"
    Page는 이번 Step에서 개념만 소개하고, Step 4에서 Genie Agent가 모호한 비즈니스 용어 때문에 틀린 답을 낸 것을 확인한 뒤 그 해결책으로 직접 만듭니다.

## 학습 목표

- YAML로 Metric View를 정의하고, `MEASURE()` 함수로 조회할 수 있습니다.
- Metric View의 source로 Gold 대신 Silver 테이블을 사용하는 이유를 이해합니다.
- Domain(과 Governed Tag)을 만들고, 데이터 자산을 Domain에 연결할 수 있습니다.
