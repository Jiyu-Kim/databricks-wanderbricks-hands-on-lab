# 1.3) Run the Pipeline and Check Results

On this page, you'll run the pipeline and verify the pipeline graph, data quality results, and the final Gold table.

## Task 1 - Run the pipeline

1. Click **Run pipeline** at the top of the screen.

    ![Run pipeline](../assets/images/01-lakeflow-pipeline/1-3-01-run-pipeline.png)

2. Progress appears in the bottom panel. It takes a few minutes for serverless compute to start and all 7 tables to be created. Wait until the status changes to **Completed**.

    ![Run completed](../assets/images/01-lakeflow-pipeline/1-3-02-run-completed.png)

!!! tip "Dry run"
    Select **Dry run** from the dropdown next to **Run pipeline** to validate code syntax and table dependencies without processing actual data.

## Task 2 - Check the pipeline graph

1. Click the **Pipeline graph** tab in the bottom panel. Verify the dependencies of the 7 tables flowing from Bronze → Silver → Gold.

    ![Pipeline graph](../assets/images/01-lakeflow-pipeline/1-3-03-pipeline-graph.png)

2. Click the `gold_customer_360` node in the graph to preview sample data.

    ![gold_customer_360 preview](../assets/images/01-lakeflow-pipeline/1-3-04-graph-preview.png)

## Task 3 - Check results and data quality by table

1. Click the **Tables** tab in the bottom panel. Verify the row counts processed by each table.

    ![Tables tab](../assets/images/01-lakeflow-pipeline/1-3-05-tables-tab.png)

2. Verify that the Silver table results match below. Some rows were removed per Expectations.

    | Table | Bronze rows | Silver rows | Removed |
    |---|---|---|---|
    | users | 124,509 | 124,385 | 124 |
    | bookings | 72,247 | 72,246 | 1 |
    | reviews | 99,793 | 99,317 | 476 |

3. Click `silver_dim_users` to see violations per Expectation.

    ![Expectations results 1](../assets/images/01-lakeflow-pipeline/1-3-06-01-expectations.png)

    ![Expectations results 2](../assets/images/01-lakeflow-pipeline/1-3-06-02-expectations.png)

    !!! info "Expectations results for `silver_fact_reviews`"
        In `silver_fact_reviews`, both `not_deleted` and `valid_rating` rules show 476 violations. This is because the 476 soft-deleted reviews have invalid rating values and violate both rules simultaneously. The total rows removed is 476.

## Task 4 - View the Gold table in Catalog Explorer

1. Click **Catalog** in the left sidebar, then expand `<your_name>_wanderbricks_marketing` → `default`. Verify that all 7 tables created by the pipeline are present.

    ![7 tables in Catalog Explorer](../assets/images/01-lakeflow-pipeline/1-3-07-catalog-tables.png)

2. Click `gold_customer_360` and verify in the **Overview** tab that column comments and primary key (`user_id`) are registered.

    ![gold_customer_360 Overview](../assets/images/01-lakeflow-pipeline/1-3-08-gold-overview.png)

3. Click the **Sample Data** tab to view data summarized as one row per customer. Total row count is 124,385, same as `silver_dim_users`.

    ![gold_customer_360 Sample Data](../assets/images/01-lakeflow-pipeline/1-3-09-gold-sample-data.png)

!!! success "Congratulations!"
    You've completed Daniel's work. You've cleansed source data to create Silver and Gold tables the analytics team can trust. In the next Step, you'll become data analyst Ana and build a dashboard using `gold_customer_360`.
