# 1.4) (Optional) Genie Code and Visual Data Prep

This page is optional. After building the pipeline with SQL in 1.1–1.3, you'll request the same pipeline from **Genie Code** in natural language and explore **Visual Data Prep**, a code-free data transformation feature.

| Method | Build | Best for |
|---|---|---|
| Write SQL directly (1.1–1.3) | Lakeflow pipeline | Data engineers who need fine-grained control of logic |
| Genie Code (Tasks 1–3) | Same Lakeflow pipeline | Rapid prototyping and code review/editing |
| Visual Data Prep (Tasks 4–6) | Canvas-based data prep flow | Analysts who prefer UI manipulation over SQL |

!!! warning "Use a different schema"
    You'll create tables with the same names (`bronze_users`, `gold_customer_360`, etc.) as in 1.1–1.3, so if you use the same catalog and schema, they will conflict. For this lab, use a new schema (e.g., `genie_code`) instead of `default`. Create the schema in Catalog first before starting.

## Task 1 - Create a new pipeline and open Genie Code

1. Click **New** → **ETL pipeline** in the top left of the sidebar. Follow the same method as [Task 1 in 1.1)](1-1-bronze.md#task-1), setting the pipeline name (e.g., `<your_name>_wanderbricks_genie_code`) and default catalog·schema (`<your_name>_wanderbricks_marketing` / `genie_code`).

2. Click **Create with Genie Code** in the empty file in the editor. A Genie Code panel opens on the right. You can also click the Genie Code icon in the top right.

    ![Create with Genie Code](../assets/images/eng/01-lakeflow-pipeline/1-4-01-genie-code-button.png)

## Task 2 - Enter a prompt

1. If the Genie Code input box has pre-filled text, clear it. Then paste the prompt below and send it.

    !!! prompt "Prompt"
        ```text
        Create a SQL medallion pipeline from the users, bookings, and reviews tables in samples.wanderbricks.
        Split the code into 3 files: bronze.sql / silver.sql / gold.sql.

        ## Bronze (streaming tables)
        - bronze_users, bronze_bookings, bronze_reviews
        - Read each source as-is with STREAM()
        - Add columns: _ingested_at (current_timestamp), _source (source table name)
        - Add a COMMENT and TBLPROPERTIES('quality'='bronze') to each table

        ## Silver (streaming tables, read bronze with STREAM())
        Common
        - Define rules with CONSTRAINT ... EXPECT ... ON VIOLATION DROP ROW
        - Add a NOT NULL check for each PK/FK column
        - Add a COMMENT and TBLPROPERTIES('quality'='silver') to each table
        - Keep the source columns, but drop _ingested_at and _source

        Rules per table
        - silver_dim_users
          - Remove rows with a NULL email
          - lower(trim) email and user_type, trim name, upper(trim) country
          - Allow only individual/business for user_type (record violations without dropping rows)
          - Trim company_name and set it to NULL if it is empty
        - silver_fact_bookings
          - total_amount > 0
          - check_out >= check_in
          - status is one of pending/confirmed/cancelled/completed
          - Add nights = datediff(check_out, check_in)
        - silver_fact_reviews
          - is_deleted = false (keep the column because the rule uses it)
          - rating between 1 and 5

        ## Gold (Materialized View)
        gold_customer_360: one row per customer

        Columns
        - User attributes: user_id, name, country, user_type, is_business
        - lifetime_bookings: number of bookings in any status (distinct booking_id, 0 if no bookings)
        - lifetime_spend: total amount of completed bookings (2 decimals, NULL if no completed bookings)
        - avg_rating_given: average rating (3 decimals, NULL if no reviews)
        - last_booking_at: creation time of the most recent booking

        Conditions
        - Aggregate bookings and reviews by user_id first (CTEs), then start from silver_dim_users and LEFT JOIN the aggregates (prevents fan-out)
        - Declare each column's type and an English COMMENT in the column definitions
        - user_id is NOT NULL + PRIMARY KEY
        - In column comments, briefly note the value range, what NULL means, and whether the column is PII
        - Add a table COMMENT (use: segment, LTV, and churn analysis; the base table for Genie) and TBLPROPERTIES('quality'='gold')
        ```

    ![Pipeline prompt input](../assets/images/eng/01-lakeflow-pipeline/1-4-02-pipeline-prompt.png)

2. Genie Code creates a plan, generates files, and runs the pipeline. This takes 2–4 minutes.

    ![Genie Code generating pipeline](../assets/images/eng/01-lakeflow-pipeline/1-4-03-pipeline-generating.png)

!!! tip "What should I write in the prompt?"
    Aspects like **Expectations rules**, **pre-aggregation to prevent fan-out**, and **column comments and primary key** are hard for Genie Code to infer. Include them explicitly in the prompt so you get results matching 1.1–1.3. For example, leaving out "prevent fan-out" could cause lifetime_spend to inflate when joining bookings and reviews.

## Task 3 - Review results and accept

1. Genie Code lists the 3 generated files in the **assets** section below the panel, and execution results for the 7 tables appear in the **Tables** tab at the bottom. Review the code by clicking file names, then click **Accept all** to apply them.

    ![Genie Code results and Accept all](../assets/images/eng/01-lakeflow-pipeline/1-4-04-pipeline-result.png)

2. Check the **Pipeline graph** tab at the bottom. Verify that 7 table dependencies are created like in 1.3). The numbers on the right of Silver nodes (476, 124, 1) show rows removed per Expectations.

    ![Pipeline graph created by Genie Code](../assets/images/eng/01-lakeflow-pipeline/1-4-05-pipeline-graph.png)

3. Verify results match below. They should equal the SQL results from 1.3).

    | Table | Row count |
    |---|---|
    | `silver_dim_users` | 124,385 |
    | `silver_fact_bookings` | 72,246 |
    | `silver_fact_reviews` | 99,317 |
    | `gold_customer_360` | 124,385 (lifetime spend total about $4.13M) |

!!! info "Results may vary slightly"
    As Genie Code is generative AI, file structure, column order, and comment wording may differ per learner. If row counts or totals differ, use follow-up requests like "Re-check the Expectations for silver_fact_reviews" or edit the code directly. Compare results to adjust if needed.

## Task 4 - Explore Visual Data Prep

**Visual Data Prep** is a code-free data transformation feature in **Lakeflow Designer**. Drag operators onto a canvas, connect them, and see results at each step without writing code.

1. Click **New** → **Visual data prep** in the top left of the sidebar.

    ![New > Visual data prep](../assets/images/eng/01-lakeflow-pipeline/1-4-06-new-visual-data-prep.png)

2. The operator list appears on the left, a canvas in the middle. Input the desired transformation in natural language in the center, or choose **Select a source** to pick a table and start directly.

    ![Visual Data Prep screen](../assets/images/eng/01-lakeflow-pipeline/1-4-07-designer-overview.png)

### Main operators

| Category | Operator | Purpose |
|---|---|---|
| Source and output | **Source**, Enter Data | Load tables·files from Unity Catalog or enter values directly |
| | **Output**, Notifications | Save results as tables, Materialized Views, or files; send notifications |
| AI transformations | **AI Function** | Apply AI functions (sentiment analysis, classification, summarization, translation, etc.) row by row |
| Transformations | **Filter**, Select, Sort, Limit, Unique | Filter rows, select columns, sort, limit counts, deduplicate |
| | **Prepare** | Trim whitespace, change case, replace values, apply formulas, clean columns |
| | **Aggregate**, Pivot | Group and aggregate, transpose rows and columns |
| | **Join**, Combine | Join tables on keys, merge multiple tables (Union, etc.) |
| | **SQL**, Python | Write code for complex logic not expressible in UI |

## Task 5 - (Sample) Build a flow in natural language

Use the Silver tables from Task 3 to build a flow that computes "bookings and spend per customer"—the same work as the Gold table in 1.2).

1. Type the prompt below in the center input box on the canvas. Replace catalog and schema names with your own.

    !!! prompt "Prompt"
        ```text
        Aggregate silver_fact_bookings from <your_name>_wanderbricks_marketing.genie_code by user_id to get booking count (booking_id count) and completed booking total_amount sum as lifetime_spend, then LEFT JOIN silver_dim_users on user_id to show country and user_type together.
        ```

    ![Visual Data Prep prompt](../assets/images/eng/01-lakeflow-pipeline/1-4-08-designer-prompt.png)

2. If Genie Code shows a summary and asks for approval (**Auto-approve needs your confirmation**), review it and click **Allow**. Genie Code may also build the flow without asking.

3. The canvas draws a flow (for example, Source (2) → Filter → Aggregate → Join), with input and output data in the **Preview** below. The operators may differ each time. Click **Accept** (or **Accept all**) to apply.

    ![Visual Data Prep flow](../assets/images/eng/01-lakeflow-pipeline/1-4-10-designer-flow.png)

## Task 6 - Review operator settings

1. Click the **Aggregate** operator on the canvas. Its name differs each time (for example, **User booking stats**), and so may the column names. The right panel shows settings you can adjust: **Group by** (`user_id`) and **Aggregate by** (for example, `booking_count` and `lifetime_spend`). The **Preview** below compares input and output side by side.

    ![Aggregate operator settings](../assets/images/eng/01-lakeflow-pipeline/1-4-11-designer-aggregate.png)

2. To save results as a table, append an **Output** operator after the last step. Click **Run all** at the top to process all data, or use the calendar icon (**Schedule**) to set up a recurring Job.

!!! info "Visual Data Prep vs. Lakeflow Pipeline"
    Visual Data Prep flows are saved as `<name>.designer.ipynb` notebook files, not Lakeflow pipelines. When run, Output operators write to tables, Materialized Views, or files. **Streaming Table incremental processing** and **Expectations** support is unclear from official docs. Use the **Guardrails** operator for quality checks instead. See [Lakeflow Designer docs](https://docs.databricks.com/aws/en/designer/what-is-lakeflow-designer) and [operator list](https://docs.databricks.com/aws/en/designer/built-in-operators) for details.

!!! success "Congratulations!"
    You've built the same pipeline with Genie Code and explored code-free data transformation with Visual Data Prep. When done, delete the pipeline, `genie_code` schema, and Visual Data Prep files you created on this page.
