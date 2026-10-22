# 4.4) Improve: Update Metric View and Create Pages

Both problems found in 4.2 and 4.3 stem from the same root cause: **business terms are not defined in the Metric View**. On this page, you'll use two approaches to define these terms.

| Approach | Target | Effect |
|---|---|---|
| **① Update Metric View** | Add `Revenue`, `Net Revenue`, `Season`, `Check-in Year` to `mv_bookings` | Genie Agent generates accurate SQL. |
| **② Create Pages** | Add `Revenue`, `Net Revenue`, `Peak Season` Pages to Domain | Standardize term definitions across the organization, and Genie One references Pages when answering definitions. |

Finally, you'll rerun Benchmark and ask the 4.2 question again to verify the improvement.

## Task 1 - Add terms to the Metric View

### 1.1) Open edit mode

1. Click **Catalog** in the left sidebar, navigate to `<your_name>_wanderbricks_marketing` → `default` → `mv_bookings`, then click it.

    ![Open mv_bookings](../assets/images/04-genie-agent/4-4-01-open-mv-bookings.png)

2. Click **Edit** in the top right. When the edit screen opens in YAML, click **UI** in the top right. The left side of the edit screen now shows **Measures** (6) and **Fields** (8) lists.

    ![Edit screen](../assets/images/04-genie-agent/4-4-02-edit-mode.png)

### 1.2) Add the `Revenue` measure

1. Click the **+** button next to **Measures** (**Add measure**).

    ![Add measure](../assets/images/04-genie-agent/4-4-03-add-measure.png)

2. Click **Custom** next to **Expression** to enter a SQL expression directly.

    ![Expression Custom](../assets/images/04-genie-agent/4-4-04-expression-custom.png)

3. Enter the values below. Enter **Expression** first—the name will auto-populate—then enter **Measure name** and **Display name**.

    | Field | Value |
    |---|---|
    | **Measure name** | `Revenue` |
    | **Expression** | `SUM(source.total_amount) FILTER (WHERE source.status IN ('confirmed', 'completed'))` |
    | **Display name** | `Revenue` |
    | **Comment** | `Revenue (total revenue). Sum of total_amount for confirmed and completed bookings (status = confirmed, completed). Excludes cancelled and pending. Currency USD.` |
    | **Synonyms** | `total revenue, revenue amount, gross revenue, sales` |
    | **Format** | Click field → select **$** for **Type** (**Currency**: US dollars) |

    ![Enter Revenue measure](../assets/images/04-genie-agent/4-4-05-measure-revenue.png)

### 1.3) Add the `Net Revenue` measure

1. Similarly, click **Add measure** → **Custom** and enter the values below.

    | Field | Value |
    |---|---|
    | **Measure name** | `Net Revenue` |
    | **Expression** | `SUM(source.total_amount) FILTER (WHERE source.status = 'completed')` |
    | **Display name** | `Net Revenue` |
    | **Comment** | `Net Revenue (realized revenue). Sum of total_amount for completed bookings (status = completed), representing actually realized revenue. Currency USD.` |
    | **Synonyms** | `realized revenue, actual revenue, net sales` |
    | **Format** | Click field → select **$** for **Type** (**Currency**: US dollars) |

    ![Enter Net Revenue measure](../assets/images/04-genie-agent/4-4-06-measure-net-revenue.png)

### 1.4) Add the `Season` field

1. Click the **+** button next to **Fields** (**Add field**), then click **Custom** for **Expression**.

    ![Add field](../assets/images/04-genie-agent/4-4-07-add-field.png)

2. Enter **Expression** first, then enter the remaining values.

    | Field | Value |
    |---|---|
    | **Field name** | `Season` |
    | **Expression** | `CASE WHEN MONTH(source.check_in) IN (6, 7, 8, 12) THEN 'Peak' ELSE 'Off-peak' END` |
    | **Display name** | `Season` |
    | **Comment** | `Peak season classification by check-in month. Peak = check-in in Jun, Jul, Aug (summer) + Dec (year-end), other months = off-peak. Values are exactly 'Peak' or 'Off-peak'; filter with equality (= 'Peak'). For "peak season in year N", filter the year with Check-in Year.` |
    | **Synonyms** | `peak season, off-peak season, high season, low season` |

    ![Enter Season field](../assets/images/04-genie-agent/4-4-08-field-peak-season.png)

### 1.5) Add the `Check-in Year` field

1. Similarly, click **Add field** → **Custom** and enter the values below.

    | Field | Value |
    |---|---|
    | **Field name** | `Check-in Year` |
    | **Expression** | `YEAR(source.check_in)` |
    | **Display name** | `Check-in Year` |
    | **Comment** | `Year of the check-in date (check_in). Used as the year filter for analysis based on check-in timing, such as peak/off-peak season.` |
    | **Synonyms** | `stay year, travel year, year of stay` |

    ![Enter Check-in Year field](../assets/images/04-genie-agent/4-4-09-field-checkin-year.png)

### 1.6) Clarify the `Gross Booking Value` description

Clarify in the Comment that `Gross Booking Value` is not revenue, so Genie doesn't use it for revenue questions.

1. Click `Gross Booking Value` in the **Measures** list.

    ![Select Gross Booking Value](../assets/images/04-genie-agent/4-4-10-select-gbv.png)

2. Add the text below to the end of **Comment**.

    ```text
     Not revenue—use `Revenue` for revenue and `Net Revenue` for net revenue (realized revenue).
    ```

    ![Update Gross Booking Value Comment](../assets/images/04-genie-agent/4-4-11-gbv-comment.png)

### 1.7) Save and verify

1. Click **Save** in the top right. Verify the list now shows **Measures** (8) and **Fields** (10).

    ![Save](../assets/images/04-genie-agent/4-4-12-save.png)

2. In **SQL Editor**, run the query below to verify the new measures and fields work correctly.

    ```sql
    SELECT
      MEASURE(`Gross Booking Value`) AS gross_booking_value,
      MEASURE(`Revenue`)             AS revenue,
      MEASURE(`Net Revenue`)         AS net_revenue,
      MEASURE(`Booking Count`) FILTER (WHERE `Season` = 'Peak' AND `Check-in Year` = 2024) AS peak_2024_bookings
    FROM <your_name>_wanderbricks_marketing.default.mv_bookings;
    ```

3. Verify the results match:

    | gross_booking_value | revenue | net_revenue | peak_2024_bookings |
    |---|---|---|---|
    | about $40.0M | about $14.0M | about $4.1M | 8,001 |

    ![Verify query result](../assets/images/04-genie-agent/4-4-13-verify-query.png)

!!! info "UI edits preserve Tags"
    When you edit a Metric View via **Edit** in the UI, Governed Tags connected in 3.3 are retained. When editing via SQL, use `ALTER VIEW` instead of `CREATE OR REPLACE VIEW` to preserve Tags.

## Task 2 - Create business term Pages

!!! info "Why create Pages?"
    Pages do **not** directly affect Genie Agent's SQL generation. Genie Agent's accuracy is handled by the **Metric View** you updated in Task 1 and the Genie Agent's **Instructions**.

    Pages standardize business terms across the organization. For example, if a user asks "What is net revenue?" in Genie One, Genie One references this Page to provide a definition and display it as a source (citation). You'll see Pages actually being referenced in Step 5.

### 2.1) Create Pages

1. Click **Discover** in the left sidebar.

    ![Discover > Pages](../assets/images/04-genie-agent/4-4-14-discover-pages.png)

2. Click **Create** in the top right → **Create page**.

    ![Create page](../assets/images/04-genie-agent/4-4-15-create-page.png)

3. Enter the content for **Page ① Revenue** below:
    - Click **Click to set page name** at the top to enter the name.
    - For **Domain**, select `<your_name>_wanderbricks_marketing` created in 3.3.
    - For **Synonyms**, click the **+** button to add each one, then press Enter.
    - The body has **Definition** and **Business use** headings pre-filled. Add content under each. Use the table button in the toolbar to insert a table, then delete extra rows and columns.

    ![Enter Page](../assets/images/04-genie-agent/4-4-16-page-form.png)

4. Click **Publish**.

    ![Publish Page](../assets/images/04-genie-agent/4-4-17-page-publish.png)

5. Create **Page ② Net Revenue** and **Page ③ Peak Season** the same way and publish them.

!!! warning "Don't include personal information in Pages"
    Page names, descriptions, synonyms, and body text are stored unencrypted. Don't include personal or sensitive information.

### 2.2) Page content

=== "① Revenue"

    | Field | Value |
    |---|---|
    | **Name** | `Revenue` |
    | **Domain** | `<your_name>_wanderbricks_marketing` |
    | **Owner** | You |
    | **Synonyms** | `total revenue`, `revenue amount`, `gross revenue`, `sales` |
    | **Description** | Revenue at Wanderbricks is the sum of confirmed booking amounts. It's different from Gross Booking Value (GBV) and Net Revenue. |

    **Body**

    ```markdown
    ## Definition
    Revenue = Sum of total_amount for bookings where status is confirmed or completed (USD). Excludes cancelled and pending bookings.

    | Metric | Included statuses | Total 2022-12 ~ 2025-07 |
    |---|---|---|
    | Gross Booking Value (GBV) | All statuses | about $40.0M |
    | Revenue | confirmed, completed | about $14.0M |
    | Net Revenue | completed | about $4.1M |

    ## Business use
    - Use when reporting confirmed demand size by market and segment.
    - When a question contains only "revenue," apply this definition.
    - Related asset: `Revenue` measure in mv_bookings
    ```

=== "② Net Revenue"

    | Field | Value |
    |---|---|
    | **Name** | `Net Revenue` |
    | **Domain** | `<your_name>_wanderbricks_marketing` |
    | **Owner** | You |
    | **Synonyms** | `realized revenue`, `actual revenue`, `net sales` |
    | **Description** | Revenue from completed stays, actually realized. The baseline metric for management reporting and campaign goals. |

    **Body**

    ```markdown
    ## Definition
    Net Revenue = Sum of total_amount for bookings where status is completed (stays are completed) (USD). Excludes confirmed bookings that haven't had a stay yet.

    ## Business use
    - Management reporting and campaign revenue targets are measured in Net Revenue. (e.g. the country-level Net Revenue targets of the Summer Escape 2025 campaign)
    - Related asset: `Net Revenue` measure in mv_bookings
    ```

=== "③ Peak Season"

    | Field | Value |
    |---|---|
    | **Name** | `Peak Season` |
    | **Domain** | `<your_name>_wanderbricks_marketing` |
    | **Owner** | You |
    | **Synonyms** | `high season`, `peak period`, `busy season` |
    | **Description** | Definition of peak travel demand period at Wanderbricks. |

    **Body**

    ```markdown
    ## Definition
    Peak season = when check-in month is June, July, August (summer) or December (year-end). Other months are off-peak.
    The reference is stay check-in timing, not booking date. "2024 peak season" means bookings where check-in year is 2024 and check-in month is 6, 7, 8, or 12.

    ## Business use
    - Use for seasonal promotion budget allocation and to compare bookings and net revenue for peak vs. off-peak.
    - Based on 2024: average peak-season monthly bookings (about 2,000) are about 3x off-peak monthly bookings (about 700).
    - Related assets: `Season` and `Check-in Year` fields in mv_bookings
    ```

## Task 3 - Verify improvements

### 3.1) Rerun Benchmark

1. Click **Benchmark** at the top of the Genie Agent screen, then click **Run all benchmarks**.

    ![Run all benchmarks](../assets/images/04-genie-agent/4-4-18-rerun-benchmarks.png)

2. Verify accuracy is now **100% accurate** (1/1) and the question **Assessment** changed to **Good**. Click the result to verify Genie used `` `Season` = 'Peak' `` and `` `Check-in Year` = 2024 `` to answer 8,001 bookings.

    ![Benchmark result Good](../assets/images/04-genie-agent/4-4-19-benchmark-good.png)

### 3.2) Ask the Monitoring question again

1. Click **Chat** at the top, then click the **New chat** icon in the top right and enter the same question as 4.2.

    !!! prompt "Prompt"
        ```text
        Show me the top 5 countries by revenue in 2024
        ```

2. Verify Genie now uses `` MEASURE(`Revenue`) `` and answers INDIA's revenue as about $818K.

    ![Revenue answer after improvement](../assets/images/04-genie-agent/4-4-20-revenue-after.png)

### 3.3) Before / After

| Question | Before improvement | After improvement |
|---|---|---|
| Show me the top 5 countries by revenue in 2024 | Uses `Gross Booking Value` → INDIA about $2.25M (❌) | Uses `Revenue` → INDIA about $818K (✅) |
| How many peak-season bookings were there in 2024? | No peak season criteria → Benchmark **Bad** (❌) | Uses `Season` and `Check-in Year` → 8,001, Benchmark **Good** (✅) |

!!! tip "Real improvements often require multiple iterations"
    In this lab, you applied the final verified fix all at once. In real work, you often find Genie gives wrong answers for different reasons even after the first fix. For example, it might interpret "2024" by booking date instead of check-in date, or find values like "off-peak" that include "peak." **Rerun Benchmark → analyze root cause → update Metric View and Instructions → rerun** repeatedly to improve accuracy.

!!! success "Congratulations!"
    You've solved the problems found in Monitoring and Benchmark by updating the Metric View, and standardized business terms with Pages. The next page is Optional—you'll connect marketing documents to Genie Agent.
