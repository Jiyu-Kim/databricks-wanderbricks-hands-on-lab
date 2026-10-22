# 1) Lakeflow 파이프라인 구축

<div class="wb-meta" markdown>

- :material-clock-outline: 약 30분 (Optional 1.4 제외)
- :material-account-outline: Daniel
- :material-file-document-multiple-outline: 페이지 4개

</div>

## 실습 개요

Wanderbricks의 고객, 예약, 리뷰 데이터는 원본 그대로 쌓여 있어 분석할 때마다 정제 작업을 반복해야 했습니다. 이번 실습에서는 **Lakeflow Spark Declarative Pipelines**로 원천 데이터를 수집하고 정제해, 분석팀이 믿고 쓸 수 있는 테이블을 만듭니다.

## 이번 실습에서의 역할

<div class="wb-roles" markdown>

<div class="wb-persona wb-persona--side" markdown>

![Daniel](../assets/images/personas/daniel.svg)

<p class="wb-persona__name">Daniel<span>Data Engineer</span></p>

여러분은 Wanderbricks의 데이터 엔지니어 Daniel입니다. 원천 데이터를 Bronze → Silver → Gold 단계로 정제하는 파이프라인을 만들어, 다음 단계의 데이터 분석가 Ana에게 신뢰할 수 있는 테이블을 전달합니다.

</div>

</div>

## 실습 구조

이 파이프라인은 메달리온 아키텍처에 따라 3개 레이어, 총 7개의 데이터셋을 만듭니다.

<div class="wb-arch">
  <div class="wb-arch__col">
    <p class="wb-arch__label">samples.wanderbricks</p>
    <div class="wb-arch__node"><strong>users</strong></div>
    <div class="wb-arch__node"><strong>bookings</strong></div>
    <div class="wb-arch__node"><strong>reviews</strong></div>
  </div>
  <div class="wb-arch__flow" aria-hidden="true"></div>
  <div class="wb-arch__col">
    <p class="wb-arch__label">Bronze · 원본 보존</p>
    <div class="wb-arch__node"><strong>bronze_<wbr>users</strong></div>
    <div class="wb-arch__node"><strong>bronze_<wbr>bookings</strong></div>
    <div class="wb-arch__node"><strong>bronze_<wbr>reviews</strong></div>
  </div>
  <div class="wb-arch__flow" aria-hidden="true"></div>
  <div class="wb-arch__col">
    <p class="wb-arch__label">Silver · 정제와 품질 검증</p>
    <div class="wb-arch__node"><strong>silver_<wbr>dim_<wbr>users</strong></div>
    <div class="wb-arch__node"><strong>silver_<wbr>fact_<wbr>bookings</strong></div>
    <div class="wb-arch__node"><strong>silver_<wbr>fact_<wbr>reviews</strong></div>
  </div>
  <div class="wb-arch__flow" aria-hidden="true"></div>
  <div class="wb-arch__col wb-arch__col--center">
    <p class="wb-arch__label">Gold · 비즈니스 집계</p>
    <div class="wb-arch__node"><strong>gold_<wbr>customer_<wbr>360</strong></div>
  </div>
</div>

| 페이지 | 내용 |
|---|---|
| [1.1) Bronze: 원천 데이터 수집](1-1-bronze.md) | 파이프라인을 만들고, 원천 테이블 3개를 그대로 수집하는 Bronze 테이블을 정의합니다. |
| [1.2) Silver·Gold: 정제와 고객 360](1-2-silver-gold.md) | 데이터 품질 규칙(Expectations)으로 Silver 테이블을 정제하고, 고객 1명당 1행의 Gold 테이블을 만듭니다. |
| [1.3) 파이프라인 실행과 결과 확인](1-3-run.md) | 파이프라인을 실행하고, 파이프라인 그래프와 데이터 품질 결과를 확인합니다. |
| [1.4) (Optional) Genie Code와 Visual Data Prep](1-4-optional-genie-code-vdp.md) | 같은 파이프라인을 Genie Code 프롬프트로 만들어 보고, 코드 없이 데이터를 가공하는 Visual Data Prep을 살펴봅니다. |

## 이번 실습에서 사용하는 기능

| 기능 | 설명 |
|---|---|
| **Lakeflow Pipelines Editor** | 파이프라인의 소스 코드 파일을 만들고, 실행하고, 결과를 확인하는 통합 편집기입니다. |
| **Streaming Table** | 새로 들어온 데이터만 증분으로 처리하는 테이블입니다. Bronze와 Silver 레이어에 사용합니다. |
| **Materialized View** | 쿼리 결과를 미리 계산해 저장하는 뷰입니다. Gold 레이어의 집계에 사용합니다. |
| **Expectations** | 데이터 품질 규칙입니다. 규칙을 위반한 행을 제거하거나 기록합니다. |

## 학습 목표

- SQL만으로 Bronze → Silver → Gold 파이프라인을 선언적으로 정의할 수 있습니다.
- Expectations로 데이터 품질 규칙을 적용하고, 그 결과를 확인할 수 있습니다.
- 파이프라인 그래프로 테이블 간의 의존 관계를 확인할 수 있습니다.
