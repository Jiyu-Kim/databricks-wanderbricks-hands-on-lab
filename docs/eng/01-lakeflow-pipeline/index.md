# 1) Build a Lakeflow Pipeline

<div class="wb-meta" markdown>

- :material-clock-outline: About 30 min (excluding Optional 1.4)
- :material-account-outline: Daniel
- :material-file-document-multiple-outline: 4 pages

</div>

## Lab overview

Wanderbricks' customer, booking, and review data has been sitting in its raw form, requiring repeated cleansing each time the analysis team wants to use it. In this lab, you'll use **Lakeflow Spark Declarative Pipelines** to ingest and cleanse source data, creating tables that the analytics team can trust.

## Your role in this lab

<div class="wb-roles" markdown>

<div class="wb-persona wb-persona--side" markdown>

![Daniel](../assets/images/personas/daniel.svg)

<p class="wb-persona__name">Daniel<span>Data Engineer</span></p>

You are Daniel, a data engineer at Wanderbricks. You will build a pipeline to cleanse source data through Bronze → Silver → Gold stages, delivering trusted tables to the next analyst, Ana.

</div>

</div>

## Lab architecture

This pipeline creates 7 datasets across 3 medallion layers.

<div class="wb-arch">
  <div class="wb-arch__col">
    <p class="wb-arch__label">samples.wanderbricks</p>
    <div class="wb-arch__node"><strong>users</strong></div>
    <div class="wb-arch__node"><strong>bookings</strong></div>
    <div class="wb-arch__node"><strong>reviews</strong></div>
  </div>
  <div class="wb-arch__flow" aria-hidden="true"></div>
  <div class="wb-arch__col">
    <p class="wb-arch__label">Bronze · Raw archive</p>
    <div class="wb-arch__node"><strong>bronze_<wbr>users</strong></div>
    <div class="wb-arch__node"><strong>bronze_<wbr>bookings</strong></div>
    <div class="wb-arch__node"><strong>bronze_<wbr>reviews</strong></div>
  </div>
  <div class="wb-arch__flow" aria-hidden="true"></div>
  <div class="wb-arch__col">
    <p class="wb-arch__label">Silver · Cleanse & validate</p>
    <div class="wb-arch__node"><strong>silver_<wbr>dim_<wbr>users</strong></div>
    <div class="wb-arch__node"><strong>silver_<wbr>fact_<wbr>bookings</strong></div>
    <div class="wb-arch__node"><strong>silver_<wbr>fact_<wbr>reviews</strong></div>
  </div>
  <div class="wb-arch__flow" aria-hidden="true"></div>
  <div class="wb-arch__col wb-arch__col--center">
    <p class="wb-arch__label">Gold · Business aggregate</p>
    <div class="wb-arch__node"><strong>gold_<wbr>customer_<wbr>360</strong></div>
  </div>
</div>

| Page | Content |
|---|---|
| [1.1) Bronze: Ingest Source Data](1-1-bronze.md) | Create the pipeline and define Bronze tables that ingest the 3 source tables as-is. |
| [1.2) Silver & Gold: Cleanse and Customer 360](1-2-silver-gold.md) | Cleanse Silver tables with data quality rules (Expectations) and build a Gold table with one row per customer. |
| [1.3) Run the Pipeline and Check Results](1-3-run.md) | Run the pipeline, check the pipeline graph and data quality results. |
| [1.4) (Optional) Genie Code and Visual Data Prep](1-4-optional-genie-code-vdp.md) | Build the same pipeline by asking Genie Code in natural language, and explore Visual Data Prep for code-free data transformation. |

## Features used in this lab

| Feature | Description |
|---|---|
| **Lakeflow Pipelines Editor** | Unified editor to create, run, and view pipeline source code and results. |
| **Streaming Table** | Processes only newly arrived data incrementally. Used in Bronze and Silver layers. |
| **Materialized View** | Pre-computes and caches query results. Used for Gold layer aggregations. |
| **Expectations** | Data quality rules. Violated rows are removed or recorded. |

## Learning objectives

- Define a Bronze → Silver → Gold pipeline declaratively in SQL only.
- Apply data quality rules with Expectations and verify the results.
- View table dependencies using the pipeline graph.
