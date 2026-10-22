# 4.3) Benchmark: Evaluate Accuracy

On this page, you'll register a question and ground-truth SQL in Benchmark, run an evaluation, and check if the Genie Agent gives the correct answer.

!!! info "What is Benchmark?"
    Benchmark is a feature where you pre-register "this SQL's result is the correct answer for this question," then compare it with Genie Agent's answer to evaluate accuracy. Each time you update the Genie Agent, you can rerun Benchmark to objectively verify whether the changes actually improved accuracy.

## Task 1 - Add a Benchmark question

1. Click **Benchmark** at the top of the Genie Agent screen.

    ![Benchmark tab](../assets/images/04-genie-agent/4-3-01-benchmarks-tab.png)

2. Verify the **Mode** at the top defaults to **Agent**, then click **Add benchmark**.

    ![Add benchmark](../assets/images/04-genie-agent/4-3-02-add-benchmark.png)

3. Enter the question below in **Question**.

    ```text
    How many peak-season bookings were there in 2024?
    ```

4. In the **Ground truth SQL answer (optional)** field, enter the SQL below. Replace `<your_name>` with your name. At Wanderbricks, **peak season** is when check-in month is June, July, August (summer) or December (year-end).

    ```sql
    SELECT MEASURE(`Booking Count`) AS peak_season_bookings
    FROM <your_name>_wanderbricks_marketing.default.mv_bookings
    WHERE YEAR(`Check-in Month`) = 2024
      AND MONTH(`Check-in Month`) IN (6, 7, 8, 12);
    ```

5. Click **Run** to verify the ground-truth SQL result `8001` appears in **Preview**, then click **Add benchmark**.

    ![Benchmark question and ground-truth SQL](../assets/images/04-genie-agent/4-3-03-benchmark-form.png)

## Task 2 - Run the evaluation

1. Click **Run all benchmarks**.

    ![Run all benchmarks](../assets/images/04-genie-agent/4-3-04-run-benchmarks.png)

2. When evaluation completes, verify the accuracy is **0% accurate** (0/1).

    ![Benchmark result Bad](../assets/images/04-genie-agent/4-3-05-benchmark-bad.png)

3. Click the question in the left list. You can see **Assessment** is **Bad**, **Score reason** shows **Filter Issue**, and **Failure analysis** shows how Genie's SQL differs from the ground-truth SQL.

    ![Compare Genie SQL vs. ground-truth SQL](../assets/images/04-genie-agent/4-3-06-benchmark-detail.png)

!!! warning "What went wrong?"
    The Metric View has no way to determine "peak season." So Genie either assumes different months arbitrarily (e.g. including November) or aggregates by booking date instead of check-in date, producing results different from the correct answer (8,001). The underlying problem is that **the business term "peak season" is not defined in the Metric View**.

!!! success "Congratulations!"
    You've found two problems using Monitoring and Benchmark. On the next page, you'll solve both problems.
