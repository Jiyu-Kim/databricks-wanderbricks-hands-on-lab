# 2) AI/BI 대시보드 구축

## 실습 개요 📋

Step 1에서 Daniel이 만든 `gold_customer_360` 테이블에는 고객 1명당 생애 예약 수, 지출액, 평균 평점, 최근 예약일이 정리되어 있습니다. 이번 실습에서는 이 테이블로 고객의 가치, 활성도, 충성도를 한 화면에서 보여주는 **AI/BI 대시보드**를 만듭니다.

## 이번 실습에서의 역할

<div class="grid" markdown>

<div class="card persona" markdown>

![Ana](../assets/images/personas/ana.svg){ width="96" }

<div markdown>

**📊 Ana - Data Analyst**

여러분은 Wanderbricks의 데이터 분석가 Ana입니다. 경영진과 마케팅팀이 매일 보는 고객 360 대시보드를 만듭니다. 핵심 위젯은 직접 구성하고, 나머지는 Genie Code에게 한 번의 프롬프트로 맡겨 봅니다.

</div>

</div>

</div>

## 실습 구조

| 페이지 | 내용 |
|---|---|
| [2.1) 데이터셋과 탭 만들기](2-1-dataset.md) | 대시보드를 만들고, 위젯이 사용할 데이터셋과 탭 2개를 만듭니다. |
| [2.2) 핵심 위젯 직접 만들기](2-2-widgets.md) | 첫 번째 탭에 핵심 위젯 3개와 세그먼트 & 분포 위젯 4개(Heatmap, Histogram, 누적 막대, 버블)를 직접 만듭니다. |
| [2.3) Genie Code로 한 번에 만들기](2-3-genie-code.md) | 두 번째 탭에서 Genie Code에게 프롬프트 한 번으로 대시보드를 만들게 합니다. |

## 이번 실습에서 사용하는 기능

| 기능 | 설명 |
|---|---|
| **AI/BI 대시보드** | SQL 데이터셋을 바탕으로 시각화 위젯을 배치해 대시보드를 만듭니다. |
| **데이터셋** | 위젯이 공통으로 사용하는 SQL 쿼리입니다. 하나의 데이터셋을 여러 위젯이 재사용합니다. |
| **Genie Code** | 자연어로 요청하면 대시보드 위젯을 자동으로 만들어 주는 AI 어시스턴트입니다. |

## 학습 목표 🎯

- SQL로 대시보드 데이터셋을 정의할 수 있습니다.
- Counter, Bar, Line, Heatmap, Histogram, Scatter 위젯을 직접 만들고 구성할 수 있습니다.
- Genie Code로 자연어 프롬프트 한 번에 여러 위젯을 만들 수 있습니다.

## 예상 소요 시간 ⏱️

약 30분
