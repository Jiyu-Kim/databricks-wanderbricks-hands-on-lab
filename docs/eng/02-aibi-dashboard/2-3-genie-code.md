# 2.3) Build with Genie Code

On this page, you will use **Genie Code** to create dashboard widgets with a single natural-language prompt on the `② Build with Genie Code` tab.

## Task 1 - Open Genie Code

1. Click the `② Build with Genie Code` tab at the top.

    ![② Build with Genie Code tab](../assets/images/eng/02-aibi-dashboard/2-3-01-page-2.png)

2. Click the **Genie Code** icon in the top right. The Genie Code panel opens on the right with an input field at the bottom.

    ![Open Genie Code panel](../assets/images/eng/02-aibi-dashboard/2-3-02-open-genie-code.png)

## Task 2 - Enter a prompt

1. Paste the prompt below into the Genie Code input field and submit.

    !!! prompt "Prompt"
        ```text
        Create a Customer 360 dashboard based on the Customer 360 dataset. The dashboard must include:
        - Three KPI counters in one row at the top: Total customers (count of user_id), Booking conversion rate (average of is_booker, percent format), Total lifetime spend (sum of lifetime_spend, USD currency format)
        - Lifetime spend by customer segment: bar chart of sum(lifetime_spend) by customer_segment
        - Recent bookings by month: line chart of customer count grouped by last_booking_at monthly
        - Customers by country: bar chart of customer count by country_group, sorted descending
        - Booking frequency distribution: pie chart of customer count by booking_freq
        - Top 50 VIP customers table: top 50 by lifetime_spend. Include columns: user_id, name, country, customer_segment, lifetime_bookings, lifetime_spend, avg_rating_given, last_booking_at
        All widget titles should be in English.
        ```

    !!! tip "Why include definitions in the prompt?"
        Metrics like "Booking conversion rate" or "VIP customers" have multiple calculation methods. By specifying **which columns and how to calculate**, you ensure consistent results across users. Without definitions, Genie Code might choose different calculations (e.g., conversion as decimal 0.44 vs. percent, or VIP based on booking count instead of spend).

    ![Enter prompt](../assets/images/eng/02-aibi-dashboard/2-3-03-prompt.png)

2. Genie Code reads the dashboard configuration and data, then creates widgets and places them on the canvas. The step names shown in the panel may vary. This takes about a minute. Wait until a summary appears in the panel.

    ![Genie Code creating widgets](../assets/images/eng/02-aibi-dashboard/2-3-04-generating.png)

## Task 3 - Review results and refine

1. Check the widgets Genie Code created. Verify that all requested items appear:

    | Item | Widget type (example) |
    |---|---|
    | Total customers, Booking conversion rate, Total lifetime spend | 3 Counters (e.g., 124,385 / 43.9% / $4.1M) |
    | Lifetime spend by customer segment | Bar |
    | Recent bookings by month | Line |
    | Customers by country | Bar (descending, `Other` → INDIA → CHINA) |
    | Booking frequency distribution | Pie |
    | Top 50 VIP customers | Table |

    ![Widgets created by Genie Code](../assets/images/eng/02-aibi-dashboard/2-3-05-result.png)

2. Widgets created by Genie Code are automatically applied to the canvas. If any widget has an error (**Unable to render visualization**) or needs adjusting, enter a follow-up request in the same panel. Below is an example that switches the VIP table to the Customer 360 dataset with this follow-up request:

    !!! prompt "Prompt"
        ```text
        The Top 50 VIP Customers table uses a separate dataset. Change it to use the Customer 360 dataset, show only customers with lifetime spend, and delete the dataset that is no longer used.
        ```

    ![Update a widget with a follow-up request](../assets/images/eng/02-aibi-dashboard/2-3-06-accept.png)

!!! tip "Results may vary slightly"
    Since Genie Code is a generative AI, the same prompt can produce slightly different widget types, layouts, and titles for each user. If the result doesn't match expectations, refine with follow-up requests like "Change the booking frequency distribution to a pie chart."

## Task 4 - Publish the dashboard

1. Click **Publish** in the top right.

    ![Publish](../assets/images/eng/02-aibi-dashboard/2-3-07-publish.png)

2. Keep the **Share data permission** option at default and click **Publish**. After the sharing settings window appears, close it and click **View published** at the top to see the published dashboard. The published version shows only the two page tabs without the **Data** tab.

    ![Published dashboard](../assets/images/eng/02-aibi-dashboard/2-3-08-published.png)

!!! success "Congratulations!"
    You have completed the Customer 360 dashboard. However, metrics like "Booking conversion rate" and "VIP customers" are defined only in this dashboard's SQL, so if someone calculates them elsewhere, the numbers might differ. In the next Step, Ana will define business metrics using **Unity Catalog Semantics** so the whole organization sees the same numbers.
