# 4.2) Monitoring: Collect Business Feedback

On this page, you'll become marketing executive Mina, ask a business question of the Genie Agent, leave feedback when the answer is wrong, then switch back to Aiden to review that feedback in the **Monitor** tab.

## Task 1 - Ask a question as Mina

<div class="wb-persona wb-persona--side wb-persona--switch" markdown>

![Mina](../assets/images/personas/mina.svg)

<p class="wb-persona__name">Mina<span>Marketing Executive</span></p>

*"To set next quarter's country marketing budgets, I need to first see which countries had the most revenue last year."*

</div>

1. Click the **New chat** icon (square with a pencil) in the top right of the Genie Agent screen to start a new conversation.

    ![New chat](../assets/images/04-genie-agent/4-2-01-new-chat.png)

2. Enter and send the question below.

    !!! prompt "Prompt"
        ```text
        Show me the top 5 countries by revenue in 2024
        ```

    ![Enter question](../assets/images/04-genie-agent/4-2-02-ask-revenue.png)

3. Review the result table and generated SQL via **Show code**. Verify that Genie used `` MEASURE(`Gross Booking Value`) `` and answered INDIA's revenue as $2,249,571 (about $2.25M).

    ![Revenue question answer](../assets/images/04-genie-agent/4-2-03-revenue-answer.png)

!!! warning "What went wrong?"
    At Wanderbricks, **revenue** means confirmed (`confirmed`) or completed (`completed`) bookings. But the Metric View has no "revenue" measure, only the closest alternative: `Gross Booking Value`. `Gross Booking Value` includes cancelled (`cancelled`) and pending (`pending`) bookings, so Genie overestimated revenue by about 2.8x.

    | Country | Genie's answer (Gross Booking Value) | Correct revenue |
    |---|---|---|
    | INDIA | about $2.25M | about $0.82M |

## Task 2 - Leave feedback

1. Click the 👎 button next to **Is this useful?** below the answer.

    ![Click 👎](../assets/images/04-genie-agent/4-2-04-thumbs-down.png)

2. Select **Drew wrong conclusions** from the reasons, enter the text below in the **What went wrong?** field, then click **Submit**.

    ```text
    Revenue should only include confirmed (confirmed) and completed (completed) bookings. Including cancelled and pending bookings in the gross booking value calculation makes it much larger than actual revenue.
    ```

    ![Enter feedback comment](../assets/images/04-genie-agent/4-2-05-feedback-comment.png)

## Task 3 - Review feedback as Aiden in the Monitor tab

<div class="wb-persona wb-persona--side wb-persona--switch" markdown>

![Aiden](../assets/images/personas/aiden.svg)

<p class="wb-persona__name">Aiden<span>AI Engineer</span></p>

*"Let me see what questions the business team asked and which answers they weren't satisfied with."*

</div>

1. Click **Monitor** at the top of the Genie Agent screen.

    ![Monitor tab](../assets/images/04-genie-agent/4-2-06-monitor-tab.png)

2. In **Activity digest**, verify **Thumbs down** shows 1. In the list below, find the question **Show me the top 5 countries by revenue in 2024** where **Rating** is **Bad** and **Comment** contains Mina's comment, then click it.

    ![Question with feedback](../assets/images/04-genie-agent/4-2-07-feedback-list.png)

3. In the panel that opens on the right, you can see the user's question, Genie's answer (**Show code** displays the generated SQL), and Mina's comment at the bottom.

    ![Feedback detail](../assets/images/04-genie-agent/4-2-08-feedback-detail.png)

!!! tip "What Monitoring reveals"
    Monitoring shows how real users phrase their questions and which answers don't satisfy them. From this feedback, you discovered a key problem: **the business term "revenue" is not defined in the Metric View**. We'll fix this problem in 4.4.

!!! success "Congratulations!"
    You've discovered one problem with the Genie Agent through user feedback. On the next page, you'll find another problem using Benchmark.
