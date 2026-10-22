# 1.2) Silver & Gold: Cleanse and Customer 360

On this page, you'll define 3 Silver tables that cleanse Bronze data with data quality rules (Expectations) and build a Gold table `gold_customer_360` that summarizes one row per customer.

## Task 1 - Write the Silver file

1. In the file browser, click the **+** icon next to the `transformations` folder, then click **Transformation**.

    ![+ > Transformation](../assets/images/01-lakeflow-pipeline/1-2-01-add-transformation.png)

2. Rename the file to `silver`. Hover over the file name and click **Rename** from the three-dot menu (⋮).

    ![Create silver file](../assets/images/01-lakeflow-pipeline/1-2-02-create-silver-file.png)

3. Paste the code below into `silver.sql`.

    ```sql title="silver.sql"
    --8<-- "lab-files/eng/step1/silver.sql"
    ```

    ![Write silver.sql](../assets/images/01-lakeflow-pipeline/1-2-03-silver-code.png)

### Understanding the code: Expectations

Silver tables define data quality rules with `CONSTRAINT ... EXPECT (...) ON VIOLATION DROP ROW` syntax. Rows that violate a rule are not stored in the table, and violation counts are recorded in the pipeline execution results.

| Table | Main rules | Rows removed |
|---|---|---|
| `silver_dim_users` | `email IS NOT NULL` | 124 out of 124,509 rows with missing email |
| `silver_fact_bookings` | `total_amount > 0`<br>`check_out >= check_in`<br>Valid status | 1 out of 72,247 rows with amount ≤ 0 |
| `silver_fact_reviews` | `is_deleted = false`<br>`rating BETWEEN 1 AND 5` | 476 out of 99,793 rows that are soft-deleted |

!!! info "ON VIOLATION options"
    Omit `ON VIOLATION DROP ROW` to keep violating rows but record violation counts. The `valid_type` rule in `silver_dim_users` uses this approach. Use `ON VIOLATION FAIL UPDATE` to stop pipeline execution if violations occur.

## Task 2 - Write the Gold file

1. Use the same method: click the **+** icon next to the `transformations` folder → **Transformation**, and rename the file to `gold`.

    ![Create gold file](../assets/images/01-lakeflow-pipeline/1-2-04-create-gold-file.png)

2. Paste the code below into `gold.sql`.

    ```sql title="gold.sql"
    --8<-- "lab-files/eng/step1/gold.sql"
    ```

    ![Write gold.sql](../assets/images/01-lakeflow-pipeline/1-2-05-gold-code.png)

3. Verify that your `transformations` folder contains 3 files: `bronze.sql`, `silver.sql`, and `gold.sql`.

    ![Three files in transformations folder](../assets/images/01-lakeflow-pipeline/1-2-06-three-files.png)

### Understanding the code: Customer 360

`gold_customer_360` is a **Materialized View** that summarizes each customer in one row, including lifetime bookings, spend, average rating, and most recent booking date. Step 2's dashboard will use this table.

| Column | Description |
|---|---|
| `lifetime_bookings` | Total bookings in customer lifetime (all statuses included) |
| `lifetime_spend` | Total customer spend in lifetime (sum of completed booking amounts) |
| `avg_rating_given` | Average rating from customer's reviews |
| `last_booking_at` | Most recent booking creation timestamp |

!!! tip "Why aggregate first before joining?"
    Each customer can have many bookings and many reviews. If you join bookings and reviews to the customer table all at once before aggregating, the row count explodes by bookings × reviews (a fan-out). Instead, we aggregate bookings and reviews separately by customer first, then join to the customer table.

!!! info "Column comments and primary key"
    Column comments (`COMMENT`) and primary key (`PRIMARY KEY`) are declared inside the table definition. This preserves metadata across pipeline re-runs, allowing AI features like Genie to understand tables more accurately.

!!! success "Congratulations!"
    You've defined 3 Silver tables and 1 Gold table. On the next page, you'll run the pipeline and verify the results.
