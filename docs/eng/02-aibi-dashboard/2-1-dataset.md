# 2.1) Create the Dataset and Tabs

On this page, you will create the dashboard, the `Customer 360` dataset, and two tabs for widgets to use.

## Task 1 - Create a dashboard

1. Click **New** in the left sidebar, then click **Dashboard**.

    ![New > Dashboard](../assets/images/02-aibi-dashboard/2-1-01-new-dashboard.png)

2. Click the dashboard name at the top (**New Dashboard ...**) and enter `<your_name> - Wanderbricks Customer 360`. For example, if your name is Jiyu, enter `jiyu - Wanderbricks Customer 360`.

    ![Enter dashboard name](../assets/images/02-aibi-dashboard/2-1-02-dashboard-name.png)

## Task 2 - Create a dataset { #task-2 }

Dashboard widgets are based on **datasets**. You will create a dataset that transforms `gold_customer_360` with analytical dimensions like customer segment, country group, booking frequency, spend tier, recency, and rating band.

1. Click the **Data** tab at the top.

    ![Data tab](../assets/images/02-aibi-dashboard/2-1-03-data-tab.png)

2. Click **Add SQL dataset**.

    ![Create from SQL](../assets/images/02-aibi-dashboard/2-1-04-create-from-sql.png)

3. Paste the query below into the SQL editor. Replace `jiyu_wanderbricks_marketing` with your own catalog name.

    ```sql title="Customer 360 dataset"
    --8<-- "lab-files/eng/step2/customer_360_dataset.sql"
    ```

4. Click **Run** to execute the query. Verify that the result has 124,385 rows.

    ![Dataset query execution result](../assets/images/02-aibi-dashboard/2-1-05-dataset-run.png)

5. Click the dataset name (**Untitled dataset**) in the left dataset list and rename it to `Customer 360`.

    ![Rename dataset](../assets/images/02-aibi-dashboard/2-1-06-dataset-rename.png)

### Understanding the dataset

This dataset adds analytical columns to each customer in `gold_customer_360`.

| Column | Meaning | Values |
|---|---|---|
| `customer_segment` | Customer type | Individual / Business |
| `country_group` | Country group | Top 8 countries by customer count + Other |
| `is_booker` | Booking experience | 1 if 1+ bookings |
| `is_repeat` | Repeat booking | 1 if 2+ bookings |
| `booking_freq` | Booking frequency | 0 (no bookings) / 1 / 2 / 3+ |
| `spend_tier` | Lifetime spend bracket | No spend / Under $350 / ... / $1,200+ |
| `recency_bucket` | Days since most recent booking | Within 30 days / 31–90 days / 91–180 days / Over 180 days / No bookings |
| `rating_band` | Average rating bracket | 1–2 / 2–3 / 3–4 / 4–5 / No reviews |

!!! info "Reference date for recency"
    Sample data exists through July 30, 2025. So `recency_bucket` calculates days elapsed from the most recent booking in the data (`as_of_ts`), not today's date.

## Task 3 - Create two tabs

Create two tabs on the dashboard. On the first tab, you will manually create widgets. On the second tab, you will create widgets with Genie Code.

1. Click the **Canvas** tab at the top to return to the canvas.

    ![Canvas tab](../assets/images/02-aibi-dashboard/2-1-07-canvas-tab.png)

2. Double-click the default page name (**Untitled page**) at the bottom and rename it to `① Build It Yourself`.

    ![Rename first tab](../assets/images/02-aibi-dashboard/2-1-08-rename-page-1.png)

3. Click **+** next to the page tab to add a new page and rename it to `② Build with Genie Code`.

    ![Add second tab](../assets/images/02-aibi-dashboard/2-1-09-add-page-2.png)

!!! success "Congratulations!"
    You have created the dashboard, the `Customer 360` dataset, and two tabs. On the next page, you will manually create core widgets on the first tab.
