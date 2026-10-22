# 2.2) Build Core Widgets

On this page, you will manually create four **segment and distribution** widgets on the `① Build It Yourself` tab that show customers from multiple angles.

| # | Widget | Type | Shows |
|---|---|---|---|
| 1 | RFM Heatmap — Recency × Frequency | Heatmap | Whether recently and frequently booking customers have higher spend |
| 2 | LTV Distribution (Spending Customers) | Histogram | The distribution of lifetime spend amounts |
| 3 | Country Booking Frequency Breakdown | Bar (stacked, horizontal) | How repeat customer ratio differs by country |
| 4 | Country Size vs. Customer Value | Scatter (bubble) | Whether countries with many customers also have high per-customer value |

## Task 1 - Add datasets for segment and distribution widgets

Histograms and bubble charts require data at a different row granularity than the `Customer 360` dataset. Create two more datasets.

| Dataset | Row unit | Row count | Used by widget |
|---|---|---|---|
| `Spending Customers` | One customer with completed bookings | 7,195 | LTV Distribution (Histogram) |
| `Country Summary` | One country (500+ customers) | 47 | Country Size vs. Customer Value (Scatter) |

1. Use the same method as [Task 2 in 2.1)](2-1-dataset.md#task-2): click **Data** tab → **Add SQL dataset**, paste the query below, run it, and rename the dataset to `Spending Customers`.

    ```sql title="Spending Customers dataset"
    --8<-- "lab-files/eng/step2/spender_dataset.sql"
    ```

2. Create another dataset using the query below and rename it to `Country Summary`.

    ```sql title="Country Summary dataset"
    --8<-- "lab-files/eng/step2/country_dataset.sql"
    ```

3. Click the `① Build It Yourself` tab at the top to switch to the first tab.

    ![① Build It Yourself tab](../assets/images/02-aibi-dashboard/2-2-01-page-1.png)

!!! info "Why create a separate `Spending Customers` dataset?"
    94% of customers (117,190 people) have no completed bookings and thus no lifetime spend. If you use `Customer 360` for the histogram, these customers are counted separately in a `nulls` bucket, making it hard to see the distribution of customers who actually spent money. That's why we create a dataset with only spending customers.

## Task 2 - RFM Heatmap

Use **Recency** and **Frequency** as two axes to divide customers, and color cells by **average lifetime spend (Monetary)**.

1. Click **Add a visualization** (chart icon) in the toolbar at the bottom, then click an empty area on the canvas to place the widget. A new widget appears with an input box (**Ask Genie Code to edit this chart...**), but on this tab you'll configure directly in the right panel.

    ![Place segment widget](../assets/images/02-aibi-dashboard/2-2-18-add-segment-widget.png)

2. Open the **Visualization** dropdown and scroll down to select **Heatmap**.

    ![Select Heatmap](../assets/images/02-aibi-dashboard/2-2-19-heatmap-type.png)

3. Click the **+** button next to **X axis**. Since there are multiple datasets, the field list is grouped by dataset. Expand **Customer 360** and select `recency_bucket`.

    ![Expand dataset and select field](../assets/images/02-aibi-dashboard/2-2-20-heatmap-dataset.png)

4. Select `booking_freq` for **Y axis** and `lifetime_spend` for **Color**.

    ![Configure Heatmap fields](../assets/images/02-aibi-dashboard/2-2-21-heatmap-fields.png)

5. Click `SUM(lifetime_spend)` under **Color** and select **AVG** under **Transform**. Now cells show **average spend by segment** instead of total.

    ![Change Color aggregation to AVG](../assets/images/02-aibi-dashboard/2-2-22-heatmap-avg.png)

6. Enable **Labels** at the bottom of the panel to show values in cells. Check **Title** at the top to add a title input. Enter the title `RFM Heatmap — Recency × Frequency`.

    ![Heatmap complete](../assets/images/02-aibi-dashboard/2-2-23-heatmap-result.png)

7. Verify that average spend grows substantially as booking frequency increases (moving down rows). For example, `1` row shows about $48–61, while `3+` row shows about $171–193.

!!! tip "How to read the heatmap"
    The numbers like `1)` and `2)` before `recency_bucket` and `booking_freq` values ensure axes are sorted chronologically. In this data, **booking frequency** is much more strongly linked to spend than recency. This suggests a re-booking campaign targeting 2+ booking customers would be effective.

## Task 3 - LTV Distribution

1. Click **Add a visualization** and place another widget to the right of the heatmap. Select **Histogram** from **Visualization**.

2. Click the **+** button next to **X axis**. This time, expand **Spending Customers** and select `spender_ltv`.

    ![Select field from Spending Customers dataset](../assets/images/02-aibi-dashboard/2-2-24-histogram-dataset.png)

3. Select **COUNT(\*)** for **Y axis**.

4. Click `BIN(spender_ltv)` on the X axis and change **Bin size** to `100`. Lifetime spend will be divided into $100 brackets.

    ![Bin size 100](../assets/images/02-aibi-dashboard/2-2-25-histogram-bin.png)

5. Check **Title** and enter the title `LTV Distribution (Spending Customers)`.

    ![LTV Distribution widget](../assets/images/02-aibi-dashboard/2-2-26-histogram-result.png)

6. Verify that most lifetime spend is evenly distributed below $1,000, with only a few customers above $1,000.

## Task 4 - Country Booking Frequency Breakdown

1. Click **Add a visualization** and place another widget below the heatmap. Keep **Visualization** as the default **Bar**.

2. Select `country_group` from **Customer 360** for **X axis**, **COUNT(\*)** for **Y axis**, and `booking_freq` for **Color**. Booking frequency values will stack within each bar.

    ![Configure stacked bar fields](../assets/images/02-aibi-dashboard/2-2-27-stacked-fields.png)

3. Click the **⇅** (swap axes) icon between **X axis** and **Y axis** to switch to horizontal bars. Country names will be easier to read vertically.

    ![Swap axes](../assets/images/02-aibi-dashboard/2-2-28-stacked-swap.png)

4. Check **Title** and enter the title `Country Booking Frequency Breakdown`.

    ![Country Booking Frequency Breakdown widget](../assets/images/02-aibi-dashboard/2-2-29-stacked-result.png)

## Task 5 - Country Size vs. Customer Value

1. Click **Add a visualization** and place another widget to the right of the stacked bar. Select **Scatter** from **Visualization**.

    ![Select Scatter](../assets/images/02-aibi-dashboard/2-2-30-bubble-type.png)

2. Click the **+** button next to **X axis**. Expand **Country Summary** and select `customers`. Select `avg_ltv` for **Y axis**. Each point represents one country in this dataset.

3. Select `total_spend` for **Size** and `country` for **Color**. Now you have a bubble chart where bubble size represents country-level total spend.

    ![Configure bubble chart fields](../assets/images/02-aibi-dashboard/2-2-31-bubble-fields.png)

4. Check **Title** and enter the title `Country Size vs. Customer Value`.

5. Verify that large countries (like India and China on the right with large bubbles) have per-customer average LTV similar to other countries at about $570–580.

!!! tip "Legend too long?"
    With 47 country values, `country` creates a long legend. You can widen the widget, or if color distinction is not needed, remove `country` from **Color** (hovering over the widget shows country names).

## Task 6 - Review the segment and distribution section

1. Arrange the four widgets in a 2×2 layout.

    ![Completed segment and distribution](../assets/images/02-aibi-dashboard/2-2-32-segment-result.png)

!!! success "Congratulations!"
    You have manually created four segment and distribution widgets. On the next page, you will use Genie Code to create dashboard widgets with a single prompt.
