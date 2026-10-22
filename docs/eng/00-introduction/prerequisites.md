# Prerequisites

This page confirms the required permissions and preview features, creates a catalog for the lab, and verifies sample data.

!!! warning "Working in a shared workspace"
    - If multiple people are working in the same workspace, add your **name** to the asset names you create in this lab to distinguish them from others' assets.
    - Do not modify or delete catalogs, dashboards, Genie Agents, or other assets created by others.

## Task 1 - Confirm required permissions

Confirm you have the following four permissions. If you don't, request them from your workspace admin.

| Permission | Used in | How to confirm |
|---|---|---|
| Create catalog | Prerequisites Task 3 | [1.1) Catalog creation permission](#11-catalog) |
| SQL Warehouse usage | Steps 2–5 | [1.2) SQL Warehouse usage permission](#12-sql-warehouse) |
| Governed Tag creation | Step 3 (Create Domain) | [1.3) Governed Tag creation permission](#13-governed-tag) |
| Domain creation | Step 3 (Create Domain) | [1.4) Domain creation permission](#14-domain) |

### 1.1) Catalog creation permission { #11-catalog }

1. Click **Catalog** in the left sidebar.

    ![Catalog menu](../assets/images/00-introduction/prereq-01-catalog-menu.png)

2. Click the **+** button at the top of the **Catalog** page. If **Create a catalog** appears, you can create catalogs.

    ![Create a catalog menu](../assets/images/00-introduction/prereq-02-create-catalog-menu.png)

### 1.2) SQL Warehouse usage permission { #12-sql-warehouse }

1. Click **SQL Warehouses** in the left sidebar. Verify that an available SQL Warehouse (e.g., **Serverless Starter Warehouse**) appears in the list.

    ![SQL Warehouses list](../assets/images/00-introduction/prereq-03-warehouse-list.png)

2. Click the SQL Warehouse you want to use, then click **Permissions** in the top-right corner. Confirm that you or your group has **Can use** or higher permission.

    ![SQL Warehouse Permissions](../assets/images/00-introduction/prereq-04-warehouse-permissions.png)

### 1.3) Governed Tag creation permission { #13-governed-tag }

When you create a Domain in Step 3, a Governed Tag with the same name is created automatically. You need permission to create Governed Tags.

1. Click **Catalog** in the left sidebar, then click the **Govern** button (shield icon) at the top and select **Governed Tags**.

    ![Govern > Governed Tags menu](../assets/images/00-introduction/prereq-05-govern-menu.png)

2. Click the **Account Permissions** tab. Confirm that you or your group has **CREATE** permission.

    ![Governed Tags > Account Permissions](../assets/images/00-introduction/prereq-06-governed-tags-permissions.png)

!!! info "Workspace admins have default permissions"
    Workspace admins have Governed Tag creation permission by default.

### 1.4) Domain creation permission { #14-domain }

1. Click **Discover** in the left sidebar, then click **Create** in the top-right corner. If **Create domain** appears, you can create domains.

    ![Discover > Create domain button](../assets/images/00-introduction/prereq-07-create-domain-button.png)

!!! info "Permission required to create a domain"
    To create a Domain, you need `MANAGE DISCOVERY` permission. Account admins and workspace admins have this permission by default.

## Task 2 - Confirm preview features

This lab uses some features in preview. Confirm the following two features are enabled. If not, request them from your workspace admin.

| Preview feature | Used in | How to confirm |
|---|---|---|
| Analyze Files in Volumes with Genie Agents | Step 4.5 (Volumes) | [2.1) Analyze Files in Volumes with Genie Agents](#21-genie-volumes) |
| Genie Ontology snippets | Step 5 (Genie One) | [2.2) Genie Ontology snippets](#22-ontology-snippets) |

!!! info "Only admins can see Previews"
    Only workspace admins can see the **Previews** page. If you're not an admin, ask your workspace admin to check whether these two features are enabled. It may take a few minutes for changes to take effect.

### 2.1) Analyze Files in Volumes with Genie Agents { #21-genie-volumes }

1. Click your user icon in the top-right corner, then click **Previews**.

    ![User menu > Previews](../assets/images/00-introduction/prereq-08-previews-menu.png)

2. Search for `Analyze Files in Volumes with Genie Agents` and verify the toggle is **On**. If it's **Off**, click to enable it.

    ![Previews > Analyze Files in Volumes with Genie Agents](../assets/images/00-introduction/prereq-10-preview-genie-volumes.png)

    !!! warning "Lakebase is required"
        For a Genie Agent to read documents in a Volume, your workspace must have **Lakebase** available. If there is no **Lakebase** tab in the **Compute** section of the left sidebar, you won't be able to complete 4.5 even if you enable the preview. Since 4.5 is Optional, you can skip it without affecting other Steps.

### 2.2) Genie Ontology snippets { #22-ontology-snippets }

1. Click your user icon in the top-right corner, then click **Previews**.

    ![User menu > Previews](../assets/images/00-introduction/prereq-08-previews-menu.png)

2. Search for `Genie Ontology snippets` and verify the toggle is **On**. If it's **Off**, click to enable it.

    ![Previews > Genie Ontology snippets](../assets/images/00-introduction/prereq-11-preview-ontology-snippets.png)

## Task 3 - Create a catalog

Create a catalog that will be used throughout the lab. All pipeline tables, Metric Views, and Volumes will be created in the `default` schema of this catalog.

1. Click **Catalog** in the left sidebar, then click the **+** button at the top and select **Create a catalog**.

    ![Create a catalog menu](../assets/images/00-introduction/prereq-02-create-catalog-menu.png)

2. Enter `<your_name>_wanderbricks_marketing` in **Catalog name**. For example, if your name is Jiyu, enter `jiyu_wanderbricks_marketing`. Select **Standard** for **Type**, keep **Storage location** at its default, and click **Create**.

    ![Create a new catalog dialog](../assets/images/00-introduction/prereq-13-create-catalog-dialog.png)

    !!! tip "Naming rule"
        Use only lowercase English letters, numbers, and underscores (`_`) in `<your_name>`. The SQL queries and screenshots in this guide use `jiyu` as an example, so replace it with your name when you follow along.

3. When the **Catalog created!** message appears, click **View catalog**.

    ![Catalog created message](../assets/images/00-introduction/prereq-14-catalog-created.png)

4. Verify that the `default` schema is automatically created under the catalog. This lab uses the `default` schema; you do not need to create a separate one.

    ![Catalog and default schema](../assets/images/00-introduction/prereq-15-catalog-default-schema.png)

## Task 4 - Verify sample data

This lab uses the sample data `samples.wanderbricks` that is provided by default in all workspaces. You will use the `users`, `bookings`, and `reviews` tables.

1. Click **Catalog** in the left sidebar and expand **samples** → **wanderbricks**. Verify that the `users`, `bookings`, and `reviews` tables exist.

    ![samples.wanderbricks table list](../assets/images/00-introduction/prereq-16-samples-wanderbricks.png)

2. Click **SQL Editor** in the left sidebar.

    ![SQL Editor menu](../assets/images/00-introduction/prereq-17-sql-editor-menu.png)

3. Click the **Connect** icon in the top-right corner, then click **More…**. In the **Attach to an existing compute resource** window, select a SQL Warehouse (e.g., **Serverless Starter Warehouse**) and click **Start and attach**.

    ![SQL Editor Warehouse selection](../assets/images/00-introduction/prereq-18-sql-editor-warehouse.png)

4. Paste the following query and click **Run all**.

    ```sql
    SELECT 'users' AS table_name, count(*) AS row_count FROM samples.wanderbricks.users
    UNION ALL
    SELECT 'bookings', count(*) FROM samples.wanderbricks.bookings
    UNION ALL
    SELECT 'reviews', count(*) FROM samples.wanderbricks.reviews;
    ```

5. Verify that the results match the table below:

    | table_name | row_count |
    |---|---|
    | users | 124,509 |
    | bookings | 72,247 |
    | reviews | 99,793 |

    ![Sample data count query result](../assets/images/00-introduction/prereq-19-sample-count-result.png)

!!! success "Congratulations!"
    Lab setup is complete. On the next page, you'll meet Wanderbricks and its four personas.
