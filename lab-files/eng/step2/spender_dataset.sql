-- Wanderbricks HOL · Step 2 · Dashboard dataset "Spending Customers"
-- Includes only customers with completed bookings (lifetime_spend > 0). Used for the LTV distribution histogram.
-- Replace <your_name>_wanderbricks_marketing with your own catalog name.

SELECT
  user_id,
  CASE WHEN is_business THEN 'Business' ELSE 'Individual' END AS customer_segment,
  lifetime_spend AS spender_ltv
FROM <your_name>_wanderbricks_marketing.default.gold_customer_360
WHERE lifetime_spend IS NOT NULL
