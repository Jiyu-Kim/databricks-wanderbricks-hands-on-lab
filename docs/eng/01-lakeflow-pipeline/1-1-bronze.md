# 1.1) Bronze: Ingest Source Data

On this page, you'll create the pipeline and define Bronze tables that ingest the 3 source tables (`users`, `bookings`, `reviews`) as-is.

## Task 1 - Create the pipeline { #task-1 }

1. Click **New** in the top left of the sidebar, then click **ETL pipeline**.

    ![New > ETL pipeline](../assets/images/01-lakeflow-pipeline/1-1-01-new-etl-pipeline.png)

2. The Lakeflow Pipelines Editor opens. Click the pipeline name at the top of the screen and enter `<your_name>_wanderbricks_customer_360`. For example, if your name is Jiyu, enter `jiyu_wanderbricks_customer_360`.

    ![Pipeline name input](../assets/images/01-lakeflow-pipeline/1-1-02-pipeline-name.png)

3. Click the default catalog and schema next to the pipeline name. Select the catalog `<your_name>_wanderbricks_marketing` (e.g., `jiyu_wanderbricks_marketing`) and schema `default`. All tables created by the pipeline will be stored in this location.

    ![Select default catalog and schema](../assets/images/01-lakeflow-pipeline/1-1-03-default-catalog-schema.png)

4. Select **SQL** as the source code language.

    ![Select SQL language](../assets/images/01-lakeflow-pipeline/1-1-04-language-sql.png)

!!! info "Compute settings"
    The pipeline uses **Serverless compute** and **Unity Catalog** by default. For this lab, use the default settings as-is.

## Task 2 - Write the Bronze file

1. In the file browser, rename `my_transformation.sql` to `bronze.sql`. Hover over the file name and click **Rename** from the three-dot menu (⋮).

    ![Rename file](../assets/images/01-lakeflow-pipeline/1-1-06-rename-file.png)

2. Clear all content in `bronze.sql` and paste the code below.

    ```sql title="bronze.sql"
    --8<-- "lab-files/eng/step1/bronze.sql"
    ```

    ![Write bronze.sql](../assets/images/01-lakeflow-pipeline/1-1-07-bronze-code.png)

3. Do not run the pipeline yet. Wait until you've written the Silver and Gold files, then run everything together in [1.3)](1-3-run.md).

## Understanding the code

| Syntax | Description |
|---|---|
| `CREATE OR REFRESH STREAMING TABLE` | Defines a Streaming Table. Each time the pipeline runs, only newly arrived data is processed incrementally. |
| `FROM STREAM(samples.wanderbricks.users)` | Reads the source table as a streaming source. |
| `_ingested_at`, `_source` | Audit columns that record when and where data was ingested. |
| `TBLPROPERTIES ('quality' = 'bronze')` | Identifies which layer the table belongs to. |

!!! tip "Role of the Bronze layer"
    The Bronze layer preserves source data **unchanged**. If cleansing logic changes later, you can reprocess from Bronze without re-ingesting the raw data.

!!! success "Congratulations!"
    You've created the pipeline and defined 3 Bronze tables. On the next page, you'll define the Silver and Gold tables.
