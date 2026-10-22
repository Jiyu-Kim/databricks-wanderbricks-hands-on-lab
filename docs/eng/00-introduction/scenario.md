# Wanderbricks Scenario & Personas

## What is Wanderbricks?

![Wanderbricks: An online vacation rental marketplace that connects travelers worldwide with property hosts](../assets/images/00-introduction/wanderbricks-overview.svg)

**Wanderbricks** is an online vacation rental marketplace that connects travelers worldwide with property hosts. It is a fictional company modeled on platforms like Airbnb and Booking.com, with the following characteristics:

- **Global customers:** About 120,000 customers from 165 countries book accommodations on Wanderbricks.
- **Two customer types:** Nearly half are **individual** customers booking for leisure, and half are **business** customers who book corporate accommodations for business travel and groups.
- **Booking lifecycle:** A booking progresses through **pending** → **confirmed** → **completed**, and can be **cancelled** at any stage.
- **Distinct seasonality:** Bookings concentrate in summer (June–August) and year-end (December).

## The Problem Wanderbricks Faces

Recently, at an executive meeting, the same question yielded different numbers each time:

> *"What was our revenue last quarter?"*
>
> The finance team brought numbers that counted only completed bookings, while the marketing team brought the total booking value including cancelled bookings. The two numbers differed by nearly tenfold.

The problems didn't stop there:

- **Scattered data:** Customer, booking, and review data sits in separate places in raw form, requiring repeated data cleaning every time you need to analyze.
- **KPI defined per dashboard:** Metrics like "VIP customer" and "booking conversion rate" are buried inside dashboard SQL, leading different people to calculate them differently.
- **Data team dependency:** Even a simple question from a marketing executive requires requesting from the data team and waiting days for a response.
- **Unanswered questions:** In July 2025, after a refund policy change, cancellation rates spiked dramatically. But no one could immediately say whether it exceeded the range the policy document predicted.

| Situation | Challenge | Action | Result |
|---|---|---|---|
| Data is scattered, KPI definitions vary by person | Establish a single trusted data foundation and shared business definitions | Build a pipeline → dashboard → semantic layer → AI agent on Databricks | Business users ask in natural language; the entire organization sees the same numbers |

## Meet the Wanderbricks Data Team

In this lab, you become one of the four personas below and solve Wanderbricks' challenges.

<div class="wb-personas wb-personas--detail" markdown>

<div class="wb-persona wb-persona--head" markdown>

![Daniel](../assets/images/personas/daniel.svg)

### Daniel <span class="wb-sep">·</span> <span>Data Engineer</span>

*"Source data arrives daily, but we don't have tables the analytics team can trust yet."*

**Daily work:**

- Collect and load data from multiple source systems
- Manage scripts that clean missing and incorrect values
- Handle data quality issue inquiries

**Responsible for:** Step 1

</div>

<div class="wb-persona wb-persona--head" markdown>

![Ana](../assets/images/personas/ana.svg)

### Ana <span class="wb-sep">·</span> <span>Data Analyst</span>

*"We recalculate the same KPI on every dashboard, and the numbers don't match."*

**Daily work:**

- Build dashboards for executives and business teams
- Handle repeated data extraction requests
- Manage KPI definitions and calculation logic

**Responsible for:** Step 2, Step 3

</div>

<div class="wb-persona wb-persona--head" markdown>

![Aiden](../assets/images/personas/aiden.svg)

### Aiden <span class="wb-sep">·</span> <span>AI Engineer</span>

*"I want to build an AI that business users can ask directly, but I'm worried it will give wrong answers."*

**Daily work:**

- Build in-house AI agents and applications
- Evaluate and improve AI answer quality
- Connect structured and unstructured data to AI

**Responsible for:** Step 4

</div>

<div class="wb-persona wb-persona--head" markdown>

![Mina](../assets/images/personas/mina.svg)

### Mina <span class="wb-sep">·</span> <span>Marketing Executive</span>

*"I want to check campaign performance right away, but I have to request from the data team and wait."*

**Daily work:**

- Plan marketing campaigns and allocate budgets by country and segment
- Check campaign performance against targets
- Monitor revenue metrics for executive reporting

**Responsible for:** Step 4.2, Step 5

</div>

</div>

## The Lab Journey

The four personas build their deliverables in the sequence below, with each stage building on the previous one.

<div class="wb-flow" markdown>

<div class="wb-flow__track" markdown>

<div class="wb-flow__item" markdown>

![Daniel](../assets/images/personas/daniel.svg)
<small>Step 1 · Daniel</small>
<strong>Lakeflow Pipeline</strong>
<span>Bronze → Silver → Gold</span>

</div>

<div class="wb-flow__arrow" aria-hidden="true"></div>

<div class="wb-flow__item" markdown>

![Ana](../assets/images/personas/ana.svg)
<small>Step 2 · Ana</small>
<strong>AI/BI Dashboard</strong>
<span>Customer 360</span>

</div>

<div class="wb-flow__arrow" aria-hidden="true"></div>

<div class="wb-flow__item" markdown>

![Ana](../assets/images/personas/ana.svg)
<small>Step 3 · Ana</small>
<strong>Domain · Metric View</strong>
<span>Business metrics</span>

</div>

<div class="wb-flow__arrow" aria-hidden="true"></div>

<div class="wb-flow__item" markdown>

![Aiden](../assets/images/personas/aiden.svg)
![Mina](../assets/images/personas/mina.svg)
<small>Step 4 · Aiden & Mina</small>
<strong>Genie Agent</strong>
<span>Build & improve</span>

</div>

<div class="wb-flow__arrow" aria-hidden="true"></div>

<div class="wb-flow__item" markdown>

![Mina](../assets/images/personas/mina.svg)
<small>Step 5 · Mina</small>
<strong>Genie One</strong>
<span>Ask in natural language</span>

</div>

</div>

</div>

When you're ready, head to [Step 1) Build a Lakeflow Pipeline](../01-lakeflow-pipeline/index.md) to start Daniel's work.
