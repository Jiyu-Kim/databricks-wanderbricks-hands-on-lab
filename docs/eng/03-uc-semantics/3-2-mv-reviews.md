# 3.2) Metric View: Reviews

On this page, you'll create `mv_reviews`, a Metric View that defines KPIs for review data.

!!! tip "Why not combine bookings and reviews into one Metric View?"
    One booking can have multiple reviews. In reality, 99,317 reviews are linked to 54,302 bookings. If you join reviews to the booking Metric View, booking rows will multiply (fanout), inflating booking counts and amounts. That's why we create separate Metric Views for each fact table.

## Task 1 - Create a Metric View

1. In **Catalog**, navigate to `<your_name>_wanderbricks_marketing` → `default` schema, then click **Create** → **Metric view** in the top right.

    ![Create > Metric view](../assets/images/03-uc-semantics/3-2-01-create-metric-view.png)

2. Enter `mv_reviews` in the **Name** field.

    ![Enter Metric View name](../assets/images/03-uc-semantics/3-2-02-metric-view-name.png)

3. If the editor opens in UI mode, click the `<>` toggle in the top right to switch to YAML editor. Delete all content and paste the YAML below. Replace `<your_name>_wanderbricks_marketing` (2 places) with your catalog name.

    ```yaml title="mv_reviews"
    --8<-- "lab-files/eng/step3/mv_reviews.yaml"
    ```

    ![Paste YAML](../assets/images/03-uc-semantics/3-2-03-yaml-editor.png)

4. Click **Save**. Verify on the **Overview** tab that **Measures** (4) and **Fields** (5) are registered.

    ![mv_reviews Overview](../assets/images/03-uc-semantics/3-2-04-overview.png)

## Task 2 - Query with SQL

1. In **SQL Editor**, run this query:

    ```sql
    SELECT
      MEASURE(`Review Count`)      AS reviews,
      MEASURE(`Average Rating`)    AS avg_rating,
      MEASURE(`Low Rating Share`)  AS low_rating_share
    FROM <your_name>_wanderbricks_marketing.default.mv_reviews;
    ```

2. Verify the results: 99,317 reviews, average rating about 3.01, and low rating share about 26.1%.

    ![Review KPI results](../assets/images/03-uc-semantics/3-2-05-query-total.png)

!!! info "Some reviews have blank customer type"
    If you group by `Customer Type`, you'll find 138 reviews with blank values. These were left by customers excluded from Silver during Step 1 (due to missing email). This example shows how data quality rules in one table affect downstream tables.

!!! success "Congratulations!"
    You've created both Metric Views. Next, you'll create a Domain and link these Metric Views to it.
