# 4) Build and Improve a Genie Agent

<div class="wb-meta" markdown>

- :material-clock-outline: About 50 min (excluding Optional 4.5)
- :material-account-outline: Aiden · Mina
- :material-file-document-multiple-outline: 5 pages

</div>

## Lab overview

Marketing executive Mina had to request data from the team and wait every time she wanted to check campaign performance. In this lab, you'll use the Metric Views created in Step 3 to build a **Genie Agent** that lets Mina ask questions in natural language directly.

There's still concern that AI might give wrong answers. So after building the Genie Agent, you'll use business feedback (**Monitoring**) and ground-truth validation (**Benchmark**) to find problems, then improve accuracy by refining the Metric View and creating Pages.

## Your role in this lab

<div class="wb-roles" markdown>

<div class="wb-persona wb-persona--side" markdown>

![Aiden](../assets/images/personas/aiden.svg)

<p class="wb-persona__name">Aiden<span>AI Engineer</span></p>

You are Aiden, the AI engineer at Wanderbricks. You build the Genie Agent and increase the accuracy of its answers based on feedback and evaluation results.

</div>

<div class="wb-persona wb-persona--side" markdown>

![Mina](../assets/images/personas/mina.svg)

<p class="wb-persona__name">Mina<span>Marketing Executive</span></p>

In 4.2, you'll briefly become marketing executive Mina, asking real business questions and leaving feedback when answers are wrong.

</div>

</div>

## Lab structure

<div class="wb-flow">
<div class="wb-flow__track">
<div class="wb-flow__item"><small>4.1</small><strong>Create</strong><span>Aiden</span></div>
<div class="wb-flow__arrow" aria-hidden="true"></div>
<div class="wb-flow__item"><small>4.2</small><strong>Monitoring</strong><span>Mina gives feedback</span></div>
<div class="wb-flow__arrow" aria-hidden="true"></div>
<div class="wb-flow__item"><small>4.3</small><strong>Benchmark</strong><span>Aiden evaluates</span></div>
<div class="wb-flow__arrow" aria-hidden="true"></div>
<div class="wb-flow__item"><small>4.4</small><strong>Improve</strong><span>Update Metric View · Create Pages</span></div>
<div class="wb-flow__arrow" aria-hidden="true"></div>
<div class="wb-flow__item"><small>4.4</small><strong>Re-evaluate</strong><span>Verify answers</span></div>
<div class="wb-flow__arrow" aria-hidden="true"></div>
<div class="wb-flow__item wb-flow__item--optional"><small>4.5 (Optional)</small><strong>Volumes</strong><span>Analyze documents</span></div>
</div>
</div>

| Page | Content |
|---|---|
| [4.1) Create a Genie Agent](4-1-create.md) | Build a Genie Agent from 2 Metric Views and ask your first question. |
| [4.2) Monitoring: Collect Business Feedback](4-2-monitoring.md) | Mina asks a question with an ambiguous term ("revenue") and leaves feedback when the answer is wrong. |
| [4.3) Benchmark: Evaluate Accuracy](4-3-benchmark.md) | Run an evaluation using a question with an ambiguous term ("peak season") and ground-truth SQL. |
| [4.4) Improve: Update Metric View and Create Pages](4-4-improve.md) | Define terms in the Metric View, create business term Pages, and re-evaluate. |
| [4.5) (Optional) Analyze Documents with Volumes](4-5-volumes.md) | Connect marketing documents (PDFs) so Genie can answer questions requiring both data and documents. |

## Features used in this lab

| Feature | Description |
|---|---|
| **Genie Agent** | A natural language analysis agent configured for specific data. It converts questions to SQL, runs them, and explains results. |
| **Monitoring** | A feature that collects and displays user questions and feedback (👍/👎, comments). |
| **Benchmark** | A feature that evaluates Genie Agent accuracy by registering questions and ground-truth SQL. |
| **Page** | The official definition of a business term. Genie One refers to Pages when answering. |
| **Volumes** | Connect unstructured files like PDFs as data sources for Genie Agent. |

## Learning goals

- You can build a Genie Agent using Metric Views as data sources.
- You can identify why a Genie Agent gives wrong answers using Monitoring and Benchmark.
- You can improve accuracy by refining the Metric View and Pages, and verify the results with evaluation.
