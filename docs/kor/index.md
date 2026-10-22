---
hide:
  - navigation
  - toc
---

<div class="wb-hero" markdown>

<div class="wb-hero__text" markdown>

<p class="wb-hero__eyebrow">Lakeflow · AI/BI · Unity Catalog · Genie</p>

# Wanderbricks <span>Hands-on Lab</span>

<p class="wb-hero__lead">Databricks 위에서 원천 데이터부터 AI 에이전트까지, 데이터 & AI 플랫폼을 엔드투엔드로 직접 구축해 봅니다.</p>

<div class="wb-hero__actions" markdown>

[실습 시작하기 :material-arrow-right:](00-introduction/index.md){ .md-button .md-button--primary }
[사전 준비 확인하기](00-introduction/prerequisites.md){ .md-button }

</div>

<div class="wb-hero__facts" markdown>

- :material-stairs: 5단계 실습
- :material-account-group: 4명의 페르소나
- :material-database-check: 샘플 데이터 기본 제공
- :material-clock-outline: 약 4시간

</div>

</div>

<div class="wb-hero__art" markdown>

![전 세계 여행자와 숙소 호스트를 연결하는 Wanderbricks](assets/images/00-introduction/wanderbricks-overview.svg)

</div>

</div>

## 워크숍 개요

**Wanderbricks**는 전 세계 여행자와 숙소 호스트를 연결하는 가상의 온라인 휴가용 숙소 예약 마켓플레이스입니다. 이 실습에서 여러분은 Wanderbricks 데이터 팀의 네 명의 페르소나가 되어, 각자의 역할에서 Databricks를 사용해 하나의 데이터 & AI 플랫폼을 완성합니다.

<div class="wb-personas" markdown>

<div class="wb-persona" markdown>

![Daniel](assets/images/personas/daniel.svg)

<p class="wb-persona__name">Daniel<span>Data Engineer</span></p>

예약·고객·리뷰 데이터를 수집하고 정제하는 **파이프라인**을 만듭니다.
{ .wb-persona__role }

</div>

<div class="wb-persona" markdown>

![Ana](assets/images/personas/ana.svg)

<p class="wb-persona__name">Ana<span>Data Analyst</span></p>

**대시보드**를 만들고, 비즈니스 지표를 **거버넌스가 적용된 Metric View**로 정의합니다.
{ .wb-persona__role }

</div>

<div class="wb-persona" markdown>

![Aiden](assets/images/personas/aiden.svg)

<p class="wb-persona__name">Aiden<span>AI Engineer</span></p>

마케팅 임원이 자연어로 질문할 수 있는 **Genie Agent**를 만들고, 현업 피드백과 평가로 정확도를 높입니다.
{ .wb-persona__role }

</div>

<div class="wb-persona" markdown>

![Mina](assets/images/personas/mina.svg)

<p class="wb-persona__name">Mina<span>Marketing Executive</span></p>

**Genie One**에서 비즈니스 질문을 던지고 신뢰할 수 있는 답을 받습니다.
{ .wb-persona__role }

</div>

</div>

!!! tip "별도의 데이터 준비 없이 바로 시작합니다"
    실습 데이터는 모든 Databricks 워크스페이스에 기본 제공되는 샘플 데이터 `samples.wanderbricks`를 사용합니다.

## 실습 여정

<div class="wb-journey" markdown>

<div class="wb-step" markdown>

<div class="wb-step__num">1</div>

<div class="wb-step__main" markdown>

[Lakeflow 파이프라인 구축](01-lakeflow-pipeline/index.md)
{ .wb-step__title }

예약·고객·리뷰 데이터를 Bronze → Silver → Gold로 정제합니다.
{ .wb-step__task }

SQL 몇 줄로 스트리밍 수집, 데이터 품질 검증(Expectations), 증분 처리를 선언적으로 구현합니다.
{ .wb-step__desc }

<p class="wb-step__tags"><span>Lakeflow Spark Declarative Pipelines</span></p>

</div>

<div class="wb-step__who" markdown>

![Daniel](assets/images/personas/daniel.svg)
<span>Daniel<small>Data Engineer</small></span>

</div>

</div>

<div class="wb-step" markdown>

<div class="wb-step__num">2</div>

<div class="wb-step__main" markdown>

[AI/BI 대시보드 구축](02-aibi-dashboard/index.md)
{ .wb-step__title }

고객 360 대시보드를 만듭니다.
{ .wb-step__task }

직접 위젯을 구성하거나, Genie Code에 한 번의 프롬프트로 대시보드를 만들게 할 수 있습니다.
{ .wb-step__desc }

<p class="wb-step__tags"><span>AI/BI 대시보드</span><span>Genie Code</span></p>

</div>

<div class="wb-step__who" markdown>

![Ana](assets/images/personas/ana.svg)
<span>Ana<small>Data Analyst</small></span>

</div>

</div>

<div class="wb-step" markdown>

<div class="wb-step__num">3</div>

<div class="wb-step__main" markdown>

[Unity Catalog Semantics 구축](03-uc-semantics/index.md)
{ .wb-step__title }

비즈니스 지표를 Domain과 Metric View로 정의합니다.
{ .wb-step__task }

Metric View로 KPI를 한 번 정의하고, Domain과 Page로 비즈니스 맥락을 조직 전체에 공유합니다.
{ .wb-step__desc }

<p class="wb-step__tags"><span>Metric View</span><span>Domain</span></p>

</div>

<div class="wb-step__who" markdown>

![Ana](assets/images/personas/ana.svg)
<span>Ana<small>Data Analyst</small></span>

</div>

</div>

<div class="wb-step" markdown>

<div class="wb-step__num">4</div>

<div class="wb-step__main" markdown>

[Genie Agent 구축과 고도화](04-genie-agent/index.md)
{ .wb-step__title }

마케팅용 Genie Agent를 만들고 고도화합니다.
{ .wb-step__task }

특정 데이터에 맞춰 구성한 자연어 분석 에이전트입니다. Monitoring과 Benchmark로 정확도를 관리합니다.
{ .wb-step__desc }

<p class="wb-step__tags"><span>Genie Agent</span><span>Monitoring</span><span>Benchmark</span><span>Page</span><span>Volumes</span></p>

</div>

<div class="wb-step__who wb-step__who--pair" markdown>

![Aiden](assets/images/personas/aiden.svg)
![Mina](assets/images/personas/mina.svg)
<span>Aiden · Mina<small>AI Engineer · Marketing Executive</small></span>

</div>

</div>

<div class="wb-step" markdown>

<div class="wb-step__num">5</div>

<div class="wb-step__main" markdown>

[Genie One으로 질문하기](05-genie-one/index.md)
{ .wb-step__title }

자연어로 비즈니스 질문을 합니다.
{ .wb-step__task }

워크스페이스 전체의 데이터와 비즈니스 정의를 바탕으로 질문에 답하는 대화형 인터페이스입니다.
{ .wb-step__desc }

<p class="wb-step__tags"><span>Genie One</span></p>

</div>

<div class="wb-step__who" markdown>

![Mina](assets/images/personas/mina.svg)
<span>Mina<small>Marketing Executive</small></span>

</div>

</div>

</div>

## 아키텍처

<div class="wb-arch">
  <div class="wb-arch__col wb-arch__col--center">
    <p class="wb-arch__label">데이터 소스</p>
    <div class="wb-arch__node wb-arch__node--source"><strong>samples.wanderbricks</strong><span>users · bookings · reviews</span></div>
  </div>
  <div class="wb-arch__flow" aria-hidden="true"></div>
  <div class="wb-arch__col">
    <p class="wb-arch__label">Lakeflow 파이프라인</p>
    <div class="wb-arch__node"><strong>Bronze</strong><span>원천 데이터 수집</span><em>Step 1</em></div>
    <div class="wb-arch__node"><strong>Silver</strong><span>정제와 품질 검증</span><em>Step 1</em></div>
    <div class="wb-arch__node"><strong>Gold</strong><span>gold_customer_360</span><em>Step 1</em></div>
  </div>
  <div class="wb-arch__flow" aria-hidden="true"></div>
  <div class="wb-arch__col wb-arch__col--uc">
    <p class="wb-arch__label">Unity Catalog · Domain</p>
    <div class="wb-arch__node"><strong>Metric View</strong><span>mv_bookings · mv_reviews (Silver 기반)</span><em>Step 3</em></div>
    <div class="wb-arch__node"><strong>Page</strong><span>매출 · 실매출 · 성수기</span><em>Step 4</em></div>
    <div class="wb-arch__node"><strong>Volume</strong><span>마케팅 문서 PDF</span><em>Step 4</em></div>
  </div>
  <div class="wb-arch__flow" aria-hidden="true"></div>
  <div class="wb-arch__col">
    <p class="wb-arch__label">분석 & AI</p>
    <div class="wb-arch__node"><strong>AI/BI 대시보드</strong><span>Gold 테이블 기반</span><em>Step 2</em></div>
    <div class="wb-arch__node"><strong>Genie Agent</strong><span>Metric View + Volume</span><em>Step 4</em></div>
    <div class="wb-arch__node wb-arch__node--accent"><strong>Genie One</strong><span>Genie Agent + Page</span><em>Step 5</em></div>
  </div>
</div>

## 시작할 준비가 되셨나요? 🎯

<div class="wb-ready" markdown>

- [ ] Databricks 워크스페이스에 로그인할 수 있습니다.
- [ ] 카탈로그를 만들 수 있는 권한이 있거나, 관리자에게 미리 요청해 두었습니다. 자세한 내용은 [사전 준비](00-introduction/prerequisites.md)에서 확인합니다.
- [ ] 약 4시간 동안 실습에 집중할 수 있습니다.

[소개로 이동해 실습 시작하기 :material-arrow-right:](00-introduction/index.md){ .md-button .md-button--primary }

</div>
