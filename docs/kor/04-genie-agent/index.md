# 4) Genie Agent 구축과 고도화

<div class="wb-meta" markdown>

- :material-clock-outline: 약 50분 (Optional 4.5 제외)
- :material-account-outline: Aiden · Mina
- :material-file-document-multiple-outline: 페이지 5개

</div>

## 실습 개요

마케팅 임원 Mina는 캠페인 성과를 확인할 때마다 데이터 팀에 요청하고 기다려야 했습니다. 이번 실습에서는 Step 3에서 만든 Metric View로 Mina가 자연어로 직접 질문할 수 있는 **Genie Agent**를 만듭니다.

AI가 틀린 답을 낼 수 있다는 걱정은 그대로 남아 있습니다. 그래서 Genie Agent를 만든 뒤 현업의 피드백(**Monitoring**)과 정답 기반 평가(**Benchmark**)로 문제를 발견하고, Metric View와 Page를 개선해 정확도를 높이는 과정까지 진행합니다.

## 이번 실습에서의 역할

<div class="wb-roles" markdown>

<div class="wb-persona wb-persona--side" markdown>

![Aiden](../assets/images/personas/aiden.svg)

<p class="wb-persona__name">Aiden<span>AI Engineer</span></p>

여러분은 Wanderbricks의 AI 엔지니어 Aiden입니다. Genie Agent를 만들고, 피드백과 평가 결과를 바탕으로 답변의 정확도를 높입니다.

</div>

<div class="wb-persona wb-persona--side" markdown>

![Mina](../assets/images/personas/mina.svg)

<p class="wb-persona__name">Mina<span>Marketing Executive</span></p>

4.2에서는 잠시 마케팅 임원 Mina가 되어, 실제 업무 질문을 던지고 답변이 틀렸을 때 피드백을 남깁니다.

</div>

</div>

## 실습 구조

<div class="wb-flow">
<div class="wb-flow__track">
<div class="wb-flow__item"><small>4.1</small><strong>만들기</strong><span>Aiden</span></div>
<div class="wb-flow__arrow" aria-hidden="true"></div>
<div class="wb-flow__item"><small>4.2</small><strong>Monitoring</strong><span>Mina가 피드백</span></div>
<div class="wb-flow__arrow" aria-hidden="true"></div>
<div class="wb-flow__item"><small>4.3</small><strong>Benchmark</strong><span>Aiden이 평가</span></div>
<div class="wb-flow__arrow" aria-hidden="true"></div>
<div class="wb-flow__item"><small>4.4</small><strong>개선</strong><span>Metric View 수정 · Page 생성</span></div>
<div class="wb-flow__arrow" aria-hidden="true"></div>
<div class="wb-flow__item"><small>4.4</small><strong>재평가</strong><span>정답 확인</span></div>
<div class="wb-flow__arrow" aria-hidden="true"></div>
<div class="wb-flow__item wb-flow__item--optional"><small>4.5 (Optional)</small><strong>Volumes</strong><span>문서 분석</span></div>
</div>
</div>

| 페이지 | 내용 |
|---|---|
| [4.1) Genie Agent 만들기](4-1-create.md) | Metric View 2개로 Genie Agent를 만들고 첫 질문을 던집니다. |
| [4.2) Monitoring: 현업 피드백 받기](4-2-monitoring.md) | Mina가 모호한 용어("매출")가 들어간 질문을 하고, 틀린 답에 피드백을 남깁니다. |
| [4.3) Benchmark: 정답률 평가하기](4-3-benchmark.md) | 모호한 용어("성수기")가 들어간 질문과 정답 SQL로 평가를 실행합니다. |
| [4.4) 개선: Metric View 수정과 Page 생성](4-4-improve.md) | Metric View에 용어를 정의하고, 비즈니스 용어 Page를 만든 뒤 다시 평가합니다. |
| [4.5) (Optional) Volumes로 문서까지 분석하기](4-5-volumes.md) | 마케팅 문서(PDF)를 연결해, 문서와 데이터를 함께 봐야 답할 수 있는 질문을 합니다. |

## 이번 실습에서 사용하는 기능

| 기능 | 설명 |
|---|---|
| **Genie Agent** | 특정 데이터에 맞춰 구성한 자연어 분석 에이전트입니다. 질문을 SQL로 바꿔 실행하고 결과를 설명합니다. |
| **Monitoring** | 사용자의 질문과 피드백(👍/👎, 코멘트)을 모아 보는 기능입니다. |
| **Benchmark** | 질문과 정답 SQL을 등록해 Genie Agent의 정확도를 평가하는 기능입니다. |
| **Page** | 비즈니스 용어의 공식 정의입니다. Genie One이 답변할 때 참조합니다. |
| **Volumes** | PDF 같은 비정형 파일을 Genie Agent의 데이터 소스로 연결합니다. |

## 학습 목표

- Metric View를 데이터 소스로 Genie Agent를 만들 수 있습니다.
- Monitoring과 Benchmark로 Genie Agent가 틀린 답을 내는 원인을 찾을 수 있습니다.
- Metric View와 Page를 개선해 답변의 정확도를 높이고, 그 결과를 평가로 확인할 수 있습니다.
