# 3.3) Create and Link a Domain

On this page, you'll create a Domain and connect the two Metric Views you just built to it. Assets linked to a Domain become discoverable in the **Discover** page, organized by business area.

<div class="wb-arch">
  <div class="wb-arch__col">
    <p class="wb-arch__label">Task 1 · Create a Domain</p>
    <div class="wb-arch__node"><strong>Domain</strong><span>wanderbricks_<wbr>marketing</span></div>
    <div class="wb-arch__node"><strong>Governed Tag</strong><span>wanderbricks_<wbr>marketing · created together</span></div>
  </div>
  <div class="wb-arch__flow" aria-hidden="true"></div>
  <div class="wb-arch__col">
    <p class="wb-arch__label">Task 2 · Link Tags</p>
    <div class="wb-arch__node"><strong>mv_bookings</strong><span>link Governed Tag</span></div>
    <div class="wb-arch__node"><strong>mv_reviews</strong><span>link Governed Tag</span></div>
  </div>
  <div class="wb-arch__flow" aria-hidden="true"></div>
  <div class="wb-arch__col wb-arch__col--center">
    <p class="wb-arch__label">Task 3 · Show in Domain</p>
    <div class="wb-arch__node"><strong>Domain</strong><span>2 Metric Views displayed</span></div>
  </div>
</div>

## Task 1 - Create a Domain

A Domain is based on a Governed Tag. When you create a Domain, a Governed Tag with the same name is created automatically.

1. Click **Discover** in the left sidebar, then click **Create** → **Create domain** in the top right.

    ![Discover > Create domain](../assets/images/03-uc-semantics/3-3-04-create-domain.png)

2. Leave **Source** as **New tag**, and enter `<your_name>_wanderbricks_marketing` (e.g., `jiyu_wanderbricks_marketing`) in the input field on the right. Fill in the other fields as shown below, then click **Create**.

    | Field | Value |
    |---|---|
    | **Subtitle** | `Customer, Booking, and Review Marketing Metrics` |
    | **Description** | `A domain that collects the booking and review KPIs and business terms used by the Wanderbricks marketing team.` |
    | **Business Contacts** (optional) | Yourself |

    ![Enter Domain information](../assets/images/03-uc-semantics/3-3-06-domain-form.png)

3. The Domain is created in **Draft** status. Click **Publish** in the top right to make it visible to other users.

    ![Publish Domain](../assets/images/03-uc-semantics/3-3-07-publish-domain.png)

## Task 2 - Link Tags to Metric Views

1. In **Catalog**, navigate to `<your_name>_wanderbricks_marketing` → `default` → `mv_bookings`.

    ![Open mv_bookings](../assets/images/03-uc-semantics/3-3-08-open-mv-bookings.png)

2. Scroll down to the **About this metric view** section, and click **Add tags** under **Tags**.

    ![Add tags](../assets/images/03-uc-semantics/3-3-09-add-tags.png)

3. Type in **Key** to find and select `<your_name>_wanderbricks_marketing`, leave **Value** empty, and click **Save**.

    ![Select tag and save](../assets/images/03-uc-semantics/3-3-10-select-tag-save.png)

4. Repeat the same process to link the tag to `mv_reviews`.

    ![Link tag to mv_reviews](../assets/images/03-uc-semantics/3-3-11-tag-mv-reviews.png)

??? tip "Link Tags with SQL"
    You can also link tags by running these queries in SQL Editor:

    ```sql
    ALTER VIEW <your_name>_wanderbricks_marketing.default.mv_bookings
      SET TAGS ('<your_name>_wanderbricks_marketing' = '');
    ALTER VIEW <your_name>_wanderbricks_marketing.default.mv_reviews
      SET TAGS ('<your_name>_wanderbricks_marketing' = '');
    ```

## Task 3 - Verify in the Domain

1. Click **Discover** in the left sidebar, then click **Domain** in the filter bar at the top. Search for your name and select `<your_name>_wanderbricks_marketing`.

    ![Select Domain](../assets/images/03-uc-semantics/3-3-12-open-domain.png)

2. Verify that `mv_bookings` and `mv_reviews` appear on the Domain page.

    ![Metric Views linked to Domain](../assets/images/03-uc-semantics/3-3-13-domain-assets.png)

!!! info "Tags may take a few minutes to appear"
    It may take a few minutes for linked assets to show up on the Domain page. If you don't see them immediately, refresh after a moment.

!!! success "Congratulations!"
    You've completed Ana's work. You've defined business KPIs as Metric Views and organized marketing analytics assets into a Domain. Next, in Step 4, you'll become AI Engineer Aiden and build a Genie Agent using these Metric Views for Marketing Executive Mina.
