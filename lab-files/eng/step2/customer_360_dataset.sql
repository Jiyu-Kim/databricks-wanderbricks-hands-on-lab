-- Wanderbricks HOL · Step 2 · Dashboard dataset "Customer 360"
-- Transforms gold_customer_360 with analytical dimensions (segment, country group, booking frequency, spend tier, recency, rating band) at the customer level.
-- Replace <your_name>_wanderbricks_marketing with your own catalog name.

WITH base AS (
  SELECT *, max(last_booking_at) OVER () AS as_of_ts FROM <your_name>_wanderbricks_marketing.default.gold_customer_360
),
top_country AS (
  SELECT country FROM <your_name>_wanderbricks_marketing.default.gold_customer_360 GROUP BY country ORDER BY count(*) DESC LIMIT 8
)
SELECT
  b.user_id,
  b.name,
  b.country,
  CASE WHEN t.country IS NOT NULL THEN b.country ELSE 'Other' END AS country_group,
  CASE WHEN b.is_business THEN 'Business' ELSE 'Individual' END AS customer_segment,
  b.lifetime_bookings,
  coalesce(b.lifetime_spend, 0) AS lifetime_spend,
  b.lifetime_spend AS spender_ltv,
  b.avg_rating_given,
  b.last_booking_at,
  CASE WHEN b.lifetime_bookings > 0 THEN 1 ELSE 0 END AS is_booker,
  CASE WHEN b.lifetime_bookings >= 2 THEN 1 ELSE 0 END AS is_repeat,
  CASE WHEN b.lifetime_bookings = 0 THEN '0 (no bookings)'
       WHEN b.lifetime_bookings = 1 THEN '1'
       WHEN b.lifetime_bookings = 2 THEN '2'
       ELSE '3+' END AS booking_freq,
  CASE WHEN b.lifetime_spend IS NULL THEN '1) No spend'
       WHEN b.lifetime_spend < 350  THEN '2) Under $350'
       WHEN b.lifetime_spend < 800  THEN '3) $350–800'
       WHEN b.lifetime_spend < 1200 THEN '4) $800–1,200'
       ELSE '5) $1,200+' END AS spend_tier,
  CASE WHEN b.last_booking_at IS NULL THEN '5) No bookings'
       WHEN datediff(b.as_of_ts, b.last_booking_at) <= 30  THEN '1) Within 30 days'
       WHEN datediff(b.as_of_ts, b.last_booking_at) <= 90  THEN '2) 31–90 days'
       WHEN datediff(b.as_of_ts, b.last_booking_at) <= 180 THEN '3) 91–180 days'
       ELSE '4) Over 180 days' END AS recency_bucket,
  CASE WHEN b.avg_rating_given IS NULL THEN 'No reviews'
       WHEN b.avg_rating_given < 2 THEN '1–2'
       WHEN b.avg_rating_given < 3 THEN '2–3'
       WHEN b.avg_rating_given < 4 THEN '3–4'
       ELSE '4–5' END AS rating_band
FROM base b
LEFT JOIN top_country t ON b.country = t.country
