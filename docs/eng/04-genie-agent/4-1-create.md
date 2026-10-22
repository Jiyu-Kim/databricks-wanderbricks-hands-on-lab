# 4.1) Create a Genie Agent

On this page, you'll build a Genie Agent using the 2 Metric Views created in Step 3 as data sources and ask your first question.

## Task 1 - Create a Genie Agent

1. Click **Genie Agents** in the left sidebar, then click **New** in the top right.

    ![Genie Agents > New](../assets/images/04-genie-agent/4-1-01-new-genie-agent.png)

2. In the **Connect your data** window, click the **Metric views** filter, select `mv_bookings` and `mv_reviews` from `<your_name>_wanderbricks_marketing.default`, then click **Create**.

    ![Select 2 Metric Views](../assets/images/04-genie-agent/4-1-02-select-sources.png)

    !!! tip "Why only Metric Views?"
        If you connect tables, Genie recalculates measures like "revenue" or "cancellation rate" each time. If you connect Metric Views, Genie uses the calculation logic defined in Step 3, so everyone gets the same numbers for the same question.

## Task 2 - Set basic information

1. Click **Configure** in the top right, then click the **About** tab.

    ![Configure > About](../assets/images/04-genie-agent/4-1-03-settings-tab.png)

2. Click the pencil icon next to **About this agent**. In the **Edit agent details** window, enter the values below and click **Save**.

    | Field | Value |
    |---|---|
    | **Name** | `<your_name> - Wanderbricks Marketing Assistant` (example: `jiyu - Wanderbricks Marketing Assistant`) |
    | **Default warehouse** | Your SQL Warehouse (example: **Serverless Starter Warehouse**) |

    ![Edit agent details](../assets/images/04-genie-agent/4-1-04-settings-form.png)

3. If **Genie Suggested Description** appears, close it with the **X** in the top right. Click the pencil icon next to **Description**, enter `A Genie Agent that the Wanderbricks marketing team uses to analyze booking and review metrics in natural language.` in the **Edit description** window, then click **Save**.

    ![Enter Description](../assets/images/04-genie-agent/4-1-04b-description.png)

## Task 3 - Add Instructions and sample questions

1. Click the **Instructions** tab, paste the following into the **General Instructions** field, then click **Save**. The gray placeholder text in the field is just a guide and doesn't need to be deleted.

    ```text title="Instructions"
    - Data is available through July 30, 2025. "Recent" should be interpreted as of July 30, 2025, not today.
    - Country names are in full uppercase. (e.g. UNITED STATES, SOUTH KOREA, JAPAN)
    - Currency is USD.
    ```

    ![Enter Instructions](../assets/images/04-genie-agent/4-1-05-instructions.png)

2. Go back to the **About** tab and click the pencil icon next to **Common questions**. In the **Edit common questions** window, enter the question below, click **Add**, then click **Save**. Common questions appear as recommended questions when users start a new conversation.

    ```text
    Show me the top 10 countries by booking count
    ```

    ![Add sample question](../assets/images/04-genie-agent/4-1-06-sample-question.png)

## Task 4 - Ask your first question

1. Close the **Configure** panel and verify **Chat** is selected at the top. Click the recommended question **Show me the top 10 countries by booking count** below the input box.

    ![Click recommended question](../assets/images/04-genie-agent/4-1-07-click-sample.png)

    !!! info "Agent mode vs. Chat mode"
        Use the **Agent** / **Chat** toggle below the input box to choose the response style. The default **Agent** mode reasons in multiple steps for deeper analysis. This lab uses the default **Agent** mode.

2. Genie generates and runs SQL, showing results in a table and explanation. Verify that INDIA (about 13,400 bookings) and CHINA (about 13,100 bookings) are ranked 1st and 2nd.

    ![First question answer](../assets/images/04-genie-agent/4-1-08-first-answer.png)

3. Click **Show code** above the result chart to verify that Genie used `` MEASURE(`Booking Count`) `` to query the Metric View.

    ![Generated SQL](../assets/images/04-genie-agent/4-1-09-show-code.png)

!!! success "Congratulations!"
    You've built a Genie Agent and received an answer to your first question. On the next page, you'll become Mina and ask real business questions.
