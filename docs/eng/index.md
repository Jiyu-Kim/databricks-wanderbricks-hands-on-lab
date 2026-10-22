---
hide:
  - navigation
  - toc
---

<div class="wb-hero" markdown>

<div class="wb-hero__text" markdown>

<p class="wb-hero__eyebrow">Lakeflow · AI/BI · Unity Catalog · Genie</p>

# Wanderbricks <span>Hands-on Lab</span>

<p class="wb-hero__lead">Build an end-to-end data & AI platform on Databricks, from raw source data all the way to AI agents.</p>

<div class="wb-hero__actions" markdown>

[Start the lab :material-arrow-right:](00-introduction/index.md){ .md-button .md-button--primary }
[Check prerequisites](00-introduction/prerequisites.md){ .md-button }

</div>

<div class="wb-hero__facts" markdown>

- :material-stairs: 5 hands-on steps
- :material-account-group: 4 personas
- :material-database-check: Built-in sample data
- :material-clock-outline: About 4 hours

</div>

</div>

<div class="wb-hero__art" markdown>

![Wanderbricks connects travelers and hosts around the world](assets/images/00-introduction/wanderbricks-overview.svg)

</div>

</div>

## Workshop overview

**Wanderbricks** is a fictional online vacation-rental marketplace that connects travelers with property hosts around the world. In this lab, you step into the roles of four personas on the Wanderbricks data team and, each in their own role, use Databricks to complete a single data & AI platform.

<div class="wb-personas" markdown>

<div class="wb-persona" markdown>

![Daniel](assets/images/personas/daniel.svg)

<p class="wb-persona__name">Daniel<span>Data Engineer</span></p>

Builds the **pipeline** that ingests and cleanses booking, customer, and review data.
{ .wb-persona__role }

</div>

<div class="wb-persona" markdown>

![Ana](assets/images/personas/ana.svg)

<p class="wb-persona__name">Ana<span>Data Analyst</span></p>

Builds a **dashboard** and defines business metrics as **governed Metric Views**.
{ .wb-persona__role }

</div>

<div class="wb-persona" markdown>

![Aiden](assets/images/personas/aiden.svg)

<p class="wb-persona__name">Aiden<span>AI Engineer</span></p>

Builds a **Genie Agent** the marketing executive can query in natural language, then improves its accuracy with business feedback and evaluation.
{ .wb-persona__role }

</div>

<div class="wb-persona" markdown>

![Mina](assets/images/personas/mina.svg)

<p class="wb-persona__name">Mina<span>Marketing Executive</span></p>

Asks business questions in **Genie One** and gets trustworthy answers.
{ .wb-persona__role }

</div>

</div>

!!! tip "No data preparation needed"
    The lab uses `samples.wanderbricks`, the sample dataset that comes with every Databricks workspace.

## Lab journey

<div class="wb-journey" markdown>

<div class="wb-step" markdown>

<div class="wb-step__num">1</div>

<div class="wb-step__main" markdown>

[Build a Lakeflow Pipeline](01-lakeflow-pipeline/index.md)
{ .wb-step__title }

Cleanse booking, customer, and review data from Bronze → Silver → Gold.
{ .wb-step__task }

Implement streaming ingestion, data quality checks (Expectations), and incremental processing declaratively with just a few lines of SQL.
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

[Build an AI/BI Dashboard](02-aibi-dashboard/index.md)
{ .wb-step__title }

Build a Customer 360 dashboard.
{ .wb-step__task }

Configure the widgets yourself, or have Genie Code build the dashboard from a single prompt.
{ .wb-step__desc }

<p class="wb-step__tags"><span>AI/BI Dashboards</span><span>Genie Code</span></p>

</div>

<div class="wb-step__who" markdown>

![Ana](assets/images/personas/ana.svg)
<span>Ana<small>Data Analyst</small></span>

</div>

</div>

<div class="wb-step" markdown>

<div class="wb-step__num">3</div>

<div class="wb-step__main" markdown>

[Build Unity Catalog Semantics](03-uc-semantics/index.md)
{ .wb-step__title }

Define business metrics with Domains and Metric Views.
{ .wb-step__task }

Define KPIs once with Metric Views, and share business context across the organization with Domains and Pages.
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

[Build and Improve a Genie Agent](04-genie-agent/index.md)
{ .wb-step__title }

Build a Genie Agent for the marketing team and improve it.
{ .wb-step__task }

A natural-language analytics agent configured for specific data. Manage its accuracy with Monitoring and Benchmarks.
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

[Ask with Genie One](05-genie-one/index.md)
{ .wb-step__title }

Ask business questions in natural language.
{ .wb-step__task }

A conversational interface that answers questions using data and business definitions from across the workspace.
{ .wb-step__desc }

<p class="wb-step__tags"><span>Genie One</span></p>

</div>

<div class="wb-step__who" markdown>

![Mina](assets/images/personas/mina.svg)
<span>Mina<small>Marketing Executive</small></span>

</div>

</div>

</div>

## Architecture

<div class="wb-arch">
  <div class="wb-arch__col wb-arch__col--center">
    <p class="wb-arch__label">Data source</p>
    <div class="wb-arch__node wb-arch__node--source"><strong>samples.wanderbricks</strong><span>users · bookings · reviews</span></div>
  </div>
  <div class="wb-arch__flow" aria-hidden="true"></div>
  <div class="wb-arch__col">
    <p class="wb-arch__label">Lakeflow pipeline</p>
    <div class="wb-arch__node"><strong>Bronze</strong><span>Ingest source data</span><em>Step 1</em></div>
    <div class="wb-arch__node"><strong>Silver</strong><span>Cleanse and check quality</span><em>Step 1</em></div>
    <div class="wb-arch__node"><strong>Gold</strong><span>gold_customer_360</span><em>Step 1</em></div>
  </div>
  <div class="wb-arch__flow" aria-hidden="true"></div>
  <div class="wb-arch__col wb-arch__col--uc">
    <p class="wb-arch__label">Unity Catalog · Domain</p>
    <div class="wb-arch__node"><strong>Metric View</strong><span>mv_bookings · mv_reviews (built on Silver)</span><em>Step 3</em></div>
    <div class="wb-arch__node"><strong>Page</strong><span>Revenue · Realized revenue · Peak season</span><em>Step 4</em></div>
    <div class="wb-arch__node"><strong>Volume</strong><span>Marketing PDF documents</span><em>Step 4</em></div>
  </div>
  <div class="wb-arch__flow" aria-hidden="true"></div>
  <div class="wb-arch__col">
    <p class="wb-arch__label">Analytics & AI</p>
    <div class="wb-arch__node"><strong>AI/BI Dashboard</strong><span>Built on the Gold table</span><em>Step 2</em></div>
    <div class="wb-arch__node"><strong>Genie Agent</strong><span>Metric View + Volume</span><em>Step 4</em></div>
    <div class="wb-arch__node wb-arch__node--accent"><strong>Genie One</strong><span>Genie Agent + Page</span><em>Step 5</em></div>
  </div>
</div>

## Ready to start? 🎯

<div class="wb-ready" markdown>

- [ ] You can sign in to a Databricks workspace.
- [ ] You have permission to create a catalog, or you have already asked your admin for it. See [Prerequisites](00-introduction/prerequisites.md) for details.
- [ ] You can focus on the lab for about 4 hours.

[Go to the introduction and start :material-arrow-right:](00-introduction/index.md){ .md-button .md-button--primary }

</div>
