# Wrap-up

<div class="wb-meta" markdown>

- :material-clock-outline: About 10 min

</div>

## Key Achievements

You have become four personas and built an end-to-end data & AI platform for Wanderbricks, from raw source data through to an AI that marketing executives can ask questions directly.

| Step | Persona | Built |
|---|---|---|
| 1 | Daniel · Data Engineer | Lakeflow pipeline, 7 Bronze, Silver, and Gold tables |
| 2 | Ana · Data Analyst | Customer 360 AI/BI dashboard |
| 3 | Ana · Data Analyst | 2 Metric Views (`mv_bookings`, `mv_reviews`), Domain |
| 4 | Aiden · AI Engineer | Genie Agent, Benchmark, 3 Pages (Revenue, Net Revenue, Peak Season), Volume |
| 5 | Mina · Marketing Executive | Ask business questions in Genie One |

## Learning highlights

- **Declarative pipelines:** Implemented data collection, quality validation, and incremental processing with just a few lines of SQL.
- **Define KPI once:** Once you define a KPI in Metric View, the dashboard, SQL, and Genie all use the same number.
- **Standardize terminology:** Domain and Pages ensure the business team uses business terms with consistent meaning across the organization.
- **Measurable AI quality:** Monitoring and Benchmark help you find why the AI is wrong, and measure the improvement with numbers.
- **Structured + unstructured:** Volumes enable analyzing documents alongside data.

## Next steps

| Topic | Documentation |
|---|---|
| Lakeflow Spark Declarative Pipelines | [docs.databricks.com/aws/en/ldp](https://docs.databricks.com/aws/en/ldp/) |
| AI/BI Dashboard | [docs.databricks.com/aws/en/dashboards](https://docs.databricks.com/aws/en/dashboards/) |
| Unity Catalog Semantics (Metric View, Domain, Page) | [docs.databricks.com/aws/en/uc-semantics](https://docs.databricks.com/aws/en/uc-semantics/) |
| Genie Agent | [docs.databricks.com/aws/en/genie](https://docs.databricks.com/aws/en/genie/) |
| Genie Agent Volumes | [docs.databricks.com/aws/en/genie-agents/volumes](https://docs.databricks.com/aws/en/genie-agents/volumes) |

## Clean up resources

After completing the lab, delete your assets in the order shown below. The deletion order is designed to delete dependent assets before the assets they depend on.

!!! warning "Delete only your own assets"
    In a shared workspace, delete only the assets with `<your_name>` in their names.

1. **Genie Agent:** Open `<your_name> - Wanderbricks Marketing Assistant` in **Genie Agents**, click the kebab menu (⋮) in the top-right corner, and select **Move to trash**.

    ![Delete Genie Agent](../assets/images/99-wrap-up/99-01-delete-genie-agent.png)

2. **Dashboard:** Open `<your_name> - Wanderbricks Customer 360` in **Dashboards**, click the kebab menu (⋮) in the top-right corner, select **File actions** → **Move to trash**.

    ![Delete dashboard](../assets/images/99-wrap-up/99-02-delete-dashboard.png)

3. **Page:** Go to **Discover** → **Pages** and open each of `Revenue`, `Net Revenue`, and `Peak Season` Pages, then click the kebab menu (⋮) → **Delete**.

    ![Delete Page](../assets/images/99-wrap-up/99-03-delete-page.png)

4. **Domain:** Open the `<your_name>_wanderbricks_marketing` Domain in **Discover**, click **Edit** → **Remove domain**.

    ![Delete Domain](../assets/images/99-wrap-up/99-04-delete-domain.png)

5. **Governed Tag:** Search for `<your_name>_wanderbricks_marketing` in **Catalog** → **Govern** → **Governed Tags**, open it, and click **Delete** in the top-right corner.

    ![Delete Governed Tag](../assets/images/99-wrap-up/99-05-delete-governed-tag.png)

6. **Pipeline:** Click the kebab menu (⋮) next to `<your_name>_wanderbricks_customer_360` in **Jobs & Pipelines** and select **Delete**.

    ![Delete pipeline](../assets/images/99-wrap-up/99-06-delete-pipeline.png)

7. **Catalog:** Open `<your_name>_wanderbricks_marketing` in **Catalog**, click the kebab menu (⋮) to the right of the catalog name, and select **Delete**. All tables, Metric Views, and Volumes in the catalog will be deleted together.

    ![Delete catalog](../assets/images/99-wrap-up/99-07-delete-catalog.png)

??? tip "Delete catalog with SQL"
    You can also delete the catalog and all assets inside it by running the following query in SQL Editor. Confirm the catalog name carefully—deletion cannot be undone.

    ```sql
    DROP CATALOG <your_name>_wanderbricks_marketing CASCADE;
    ```

## Feedback

If you have feedback or suggestions for improvement about this lab, please leave it on [GitHub Issues](https://github.com/Jiyu-Kim/databricks-wanderbricks-hands-on-lab/issues).

Thank you for your hard work!
