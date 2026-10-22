-- Wanderbricks HOL · Step 2 · Dashboard dataset "Country Summary"
-- One row per country. Includes only countries with 500+ customers. Used for the bubble chart.
-- Replace <your_name>_wanderbricks_marketing with your own catalog name.

SELECT
  country,
  count(*) AS customers,
  round(avg(CASE WHEN lifetime_bookings > 0 THEN 1.0 ELSE 0.0 END), 4) AS booker_rate,
  round(sum(coalesce(lifetime_spend, 0)), 2) AS total_spend,
  round(avg(lifetime_spend), 2) AS avg_ltv
FROM <your_name>_wanderbricks_marketing.default.gold_customer_360
GROUP BY country
HAVING count(*) >= 500
