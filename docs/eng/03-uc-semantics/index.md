# 3) Build Unity Catalog Semantics

<div class="wb-meta" markdown>

- :material-clock-outline: About 25 min
- :material-account-outline: Ana
- :material-file-document-multiple-outline: 3 pages

</div>

## Lab Overview

The dashboard metrics you built in Step 2—like "Booking Conversion Rate" and "VIP Customers"—are defined only inside the dashboard SQL. If someone calculates the same metrics using a different tool, the numbers may differ, and AI cannot understand the definitions either.

In this lab, you'll define business metrics once using **Unity Catalog Semantics** so that the dashboard, SQL, and AI tools like Genie all use the same definitions.

## Your Role in This Lab

<div class="wb-roles" markdown>

<div class="wb-persona wb-persona--side" markdown>

![Ana](../assets/images/personas/ana.svg)

<p class="wb-persona__name">Ana<span>Data Analyst</span></p>

You continue as data analyst Ana. You'll define the KPI calculation logic scattered across dashboards into **Metric Views** and bundle the marketing analytics assets into a **Domain**, making them discoverable and reusable across the organization. This foundation will enable AI Engineer Aiden to build the Genie Agent in Step 4.

</div>

</div>

## What Is Unity Catalog Semantics?

Unity Catalog Semantics helps people and AI interpret data with shared meaning by defining business metrics, terms, and organizational structure.

| Component | Description | In This Lab |
|---|---|---|
| **Metric View** | A Unity Catalog object that defines KPIs in YAML. It separates measures (calculated metrics) from dimensions (analysis criteria), ensuring the same calculation logic applies regardless of how you slice the data. | Steps 3.1, 3.2 |
| **Domain** | An organizational unit that groups data assets by business purpose, built on Governed Tags. | Step 3.3 |
| **Page** | An official definition for business terms like "Revenue" or "Peak Season." Pages live in a Domain and are referenced by Genie One when answering questions. | Step 4.4 |

## Lab Structure

| Page | Content |
|---|---|
| [3.1) Metric View: Bookings](3-1-mv-bookings.md) | Create `mv_bookings` to define booking KPIs (booking count, gross booking value, cancellation rate, etc.). |
| [3.2) Metric View: Reviews](3-2-mv-reviews.md) | Create `mv_reviews` to define review KPIs (review count, average rating, low rating share, etc.). |
| [3.3) Create and Link a Domain](3-3-domain.md) | Create a Governed Tag and Domain, then connect both Metric Views to the Domain. |

!!! info "Pages are created in Step 4"
    Pages are only conceptually introduced here; you'll create them in Step 4 as a solution to fix incorrect answers from the Genie Agent caused by ambiguous business terms.

## Learning Objectives

- Define a Metric View in YAML and query it using the `MEASURE()` function.
- Understand why Metric Views use Silver tables instead of Gold tables as their source.
- Create a Domain (and Governed Tag) and connect data assets to it.
