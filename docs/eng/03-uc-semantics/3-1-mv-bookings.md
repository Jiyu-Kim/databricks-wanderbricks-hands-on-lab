# 3.1) Metric View: Bookings

On this page, you'll create `mv_bookings`, a Metric View that defines KPIs for booking data, and query it with SQL.

!!! tip "Why use Silver tables instead of Gold?"
    The `gold_customer_360` table is already summarized to **one row per customer**. With this table, you cannot answer questions like "booking count by month" or "cancellation rate by country" because you need booking-level granularity. Metric Views are designed to use the finest-grained source data (one booking = one row) and aggregate dynamically based on your query criteria. That's why we use `silver_fact_bookings` as the source.

## Task 1 - Create a Metric View

1. Click **Catalog** in the left sidebar, then navigate to `<your_name>_wanderbricks_marketing` → `default` schema.

    ![default schema](../assets/images/03-uc-semantics/3-1-01-default-schema.png)

2. Click **Create** in the top right, then click **Metric view**.

    ![Create > Metric view](../assets/images/03-uc-semantics/3-1-02-create-metric-view.png)

3. Enter `mv_bookings` in the **Name** field.

    ![Enter Metric View name](../assets/images/03-uc-semantics/3-1-03-metric-view-name.png)

4. If the editor opens in UI mode, click the `<>` toggle in the top right to switch to YAML editor. Delete all content in the YAML editor and paste the YAML below. Replace `<your_name>_wanderbricks_marketing` (2 places) with your catalog name.

    ```yaml title="mv_bookings"
    --8<-- "lab-files/eng/step3/mv_bookings.yaml"
    ```

    ![Paste YAML](../assets/images/03-uc-semantics/3-1-04-yaml-editor.png)

5. Click **Save**. After the Metric View is created, verify on the **Overview** tab that **Measures** (6) and **Fields** (8) are registered. Note: Metric View dimensions appear as **Fields** in the UI.

    ![mv_bookings Overview](../assets/images/03-uc-semantics/3-1-05-overview.png)

??? tip "Create Metric View with SQL"
    You can also create the same Metric View by running this query in SQL Editor:

    ```sql
    CREATE OR REPLACE VIEW <your_name>_wanderbricks_marketing.default.mv_bookings
    WITH METRICS
    LANGUAGE YAML
    AS $$
    --8<-- "lab-files/eng/step3/mv_bookings.yaml"
    $$;
    ```

## Task 2 - Understand the YAML

| Key | In This Metric View | Description |
|---|---|---|
| `source` | `silver_fact_bookings` | A fact table where one row = one booking. |
| `joins` | `dim_user` → `silver_dim_users` | Brings in customer country and type information. This is a many-to-one join: many bookings to one customer. |
| `dimensions` | Booking Date, Booking Month, Check-in Month, Booking Status, Customer Country, Customer Type, Length of Stay, Guests | Criteria by which you slice the data. |
| `measures` | Booking Count, Gross Booking Value, Average Booking Value, Cancellation Rate, Booking Customers, Average Length of Stay | KPIs to aggregate. Calculation logic is defined in one place. |
| `comment` | On every dimension and measure | Field meaning. Genie uses this when interpreting questions. |
| `synonyms` | E.g., Cancellation Rate → cancel rate, cancellation rate | Helps find the same field even when users phrase questions differently. |
| `format` | Amounts in USD, rates in % | Display formatting for results. |

!!! info "Gross Booking Value includes all booking statuses"
    `Gross Booking Value` includes pending, confirmed, cancelled, and completed bookings. This is the total transaction value (GBV). This definition is critical and revisited in Step 4.

## Task 3 - Query with SQL

Metric View measures are queried using the `MEASURE()` function. Regardless of which dimensions you `GROUP BY`, the measure calculation logic applies as defined in the Metric View.

1. Click **SQL Editor** in the left sidebar and run this query:

    ```sql
    SELECT
      MEASURE(`Booking Count`)         AS bookings,
      MEASURE(`Gross Booking Value`)   AS gross_booking_value,
      MEASURE(`Cancellation Rate`)     AS cancellation_rate
    FROM <your_name>_wanderbricks_marketing.default.mv_bookings;
    ```

2. Verify the results: 72,246 bookings, about $40.0M gross booking value, and about 21.2% cancellation rate.

    ![Total KPI results](../assets/images/03-uc-semantics/3-1-06-query-total.png)

3. Now slice the same measures by customer type:

    ```sql
    SELECT
      `Customer Type`,
      MEASURE(`Booking Count`)  AS bookings,
      MEASURE(`Cancellation Rate`) AS cancellation_rate
    FROM <your_name>_wanderbricks_marketing.default.mv_bookings
    GROUP BY ALL;
    ```

    ![Results by customer type](../assets/images/03-uc-semantics/3-1-07-query-by-segment.png)

!!! warning "Use `ALTER VIEW` when modifying a Metric View"
    After linking a Governed Tag to the Metric View in 3.3), do not use `CREATE OR REPLACE VIEW` to modify it, as this will remove the Tag and break the Domain connection. Instead, use the UI **Edit** button or `ALTER VIEW ... AS $$ ... $$` to modify.

!!! success "Congratulations!"
    You've created `mv_bookings`, a Metric View that defines booking KPIs. Next, you'll create `mv_reviews` to define review KPIs.
