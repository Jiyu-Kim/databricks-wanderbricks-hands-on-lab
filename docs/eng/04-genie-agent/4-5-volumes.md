# 4.5) (Optional) Analyze Documents with Volumes

On this page, you'll upload marketing team internal documents (PDFs) to a Unity Catalog Volume and connect them to Genie Agent to answer questions that require both documents and data.

| Question | From documents | From Metric View |
|---|---|---|
| How did target countries perform vs. campaign goals? | Campaign period, target countries, country goals | Country bookings and net revenue |
| Is the cancellation rate after the policy change within expected range? | Policy effective date, expected impact, review criteria | Monthly cancellation rate |

!!! warning "Prerequisites"
    This page requires **Analyze Files in Volumes with Genie Agents** Preview to be enabled and **Lakebase** available in your workspace. Check in [Prerequisites](../00-introduction/prerequisites.md#21-genie-volumes).

## Task 1 - Download lab files

Download the 2 PDFs below.

| File | Content |
|---|---|
| [:material-file-pdf-box: 2025_Summer_Escape_Campaign_Brief.pdf](../assets/files/2025_Summer_Escape_Campaign_Brief.pdf) | 2025 summer peak-season campaign period, 5 target countries, country-level booking and net revenue goals, channel budgets |
| [:material-file-pdf-box: Refund_Cancellation_Policy_Update_2025-07.pdf](../assets/files/Refund_Cancellation_Policy_Update_2025-07.pdf) | Free cancellation policy update effective July 1, 2025, expected impact, review criteria |

## Task 2 - Create a Volume and upload files

1. Click **Catalog**, navigate to `<your_name>_wanderbricks_marketing` → `default` schema, click the top right **Create** → **Volume**.

    ![Create > Volume](../assets/images/04-genie-agent/4-5-01-create-volume.png)

2. Enter `marketing_docs` for **Volume name**, select **Managed volume** for **Volume type**, then click **Create**.

    ![Enter Volume details](../assets/images/04-genie-agent/4-5-02-volume-form.png)

3. Click **Upload to this volume** in the top right of the created Volume screen and upload the 2 PDFs from Task 1.

    ![Upload files](../assets/images/04-genie-agent/4-5-03-upload-files.png)

4. Verify the 2 PDFs are now in the Volume.

    ![Uploaded files](../assets/images/04-genie-agent/4-5-04-uploaded-files.png)

## Task 3 - Connect the Volume to Genie Agent

1. Click **Configure** in the top right of the Genie Agent screen, then click **Add** on the **Sources** tab.

    ![Configure > Sources > Add](../assets/images/04-genie-agent/4-5-05-add-source.png)

2. Select **Volume** from the menu. Type `marketing_docs` in the search field, select `marketing_docs` from your catalog (`<your_name>_wanderbricks_marketing.default`), then click **Confirm**.

    !!! info "If Volume doesn't appear in the menu"
        If the menu only shows **Table**, **Metric View**, **SQL function**, then **Analyze Files in Volumes with Genie Agents** Preview hasn't been enabled. Ask your workspace administrator to enable it. If you select a Volume and click **Confirm** but it doesn't appear in the Sources list, your workspace can't use Lakebase.

    ![Select Volume](../assets/images/04-genie-agent/4-5-06-select-volume.png)

3. The `marketing_docs` Volume appears in **Sources** with **Indexing…** status. Click the pencil icon to the right of `marketing_docs` to see **Content Search Status** showing **Indexing in progress**. Genie is indexing documents so it can read them, which takes a few minutes.

    ![Indexing Volume](../assets/images/04-genie-agent/4-5-06b-indexing.png)

    !!! warning "Wait for indexing to complete before asking questions"
        If you ask questions before indexing finishes, Genie might not find document content. Verify the status in the **Sources** list changes from **Indexing…** to **Indexed** before moving to Task 4.

    ![Volume indexing complete](../assets/images/04-genie-agent/4-5-06c-indexed.png)

4. Click the pencil icon next to **Description** on the same screen and enter the text below, then click **Save**. Genie uses this description to decide which questions should reference documents.

    ```text
    Wanderbricks marketing internal documents. 2025 Summer Escape campaign brief (period, target countries, country-level booking and net revenue goals, channel budgets) and July 2025 refund/cancellation policy update notice (effective date, changes, expected impact, review criteria).
    ```

    ![Enter Volume Description](../assets/images/04-genie-agent/4-5-07-volume-description.png)

## Task 4 - Ask questions in Agent mode

!!! warning "Only Agent mode reads documents"
    In **Chat** mode, Genie doesn't read Volume documents and will say "no goal information." To analyze both documents and data together, you must ask in **Agent** mode.

1. Close the **Configure** panel, click the **New chat** icon in the top right, then verify **Agent** is selected in the mode toggle below the input box.

    ![Select Agent mode](../assets/images/04-genie-agent/4-5-08-agent-mode.png)

2. Enter the question below.

    !!! prompt "Prompt"
        ```text
        How did the campaign period bookings and net revenue for Summer Escape 2025 campaign target countries compare to goals?
        ```

3. Verify Genie finds the campaign period (2025-06-01 ~ 2025-07-31) and country goals in the campaign brief, queries the Metric View for actual results, and compares them. The answer shows documents as sources below.

    | Country | Goals (bookings / net revenue) | Actual (bookings / net revenue) | Result |
    |---|---|---|---|
    | UNITED STATES | 800 / $55K | 870 / $61.2K | Met |
    | GERMANY | 200 / $18K | 235 / $20.8K | Met |
    | JAPAN | 400 / $28K | 326 / $16.6K | Missed |
    | UNITED KINGDOM | 200 / $12K | 158 / $7.8K | Missed |
    | SOUTH KOREA | 150 / $9K | 115 / $5.5K | Missed |

    ![Campaign question answer](../assets/images/04-genie-agent/4-5-09-campaign-answer.png)

4. In a new conversation, ask in Agent mode:

    !!! prompt "Prompt"
        ```text
        Is the cancellation rate after the July refund policy change within the expected range in the policy document?
        ```

5. Verify Genie finds the expected impact (+3%p or less) and review criteria (+5%p or more) in the policy notice, queries the cancellation rate trend, and finds it rose from about 20.4% in June to about 28.8% in July—**+8.4%p**—which exceeds the review threshold.

    ![Policy question answer](../assets/images/04-genie-agent/4-5-10-policy-answer.png)

!!! success "Congratulations!"
    You've completed Aiden's work. You've built a complete Genie Agent that analyzes both structured data (Metric View) and unstructured documents (PDFs). In the next Step, you'll become Mina and ask questions in Genie One.
