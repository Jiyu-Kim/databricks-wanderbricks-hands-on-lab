-- Wanderbricks HOL · Step 1 · Gold: Customer 360 (Materialized View)
-- Source: samples.wanderbricks / Target: pipeline's default catalog·schema

-- (Note) Joining bookings and reviews simultaneously before aggregation causes a fan-out.
--        Instead, we aggregate each fact table by user first, then join to the user dimension.

CREATE OR REFRESH MATERIALIZED VIEW gold_customer_360 (
  user_id           BIGINT NOT NULL COMMENT 'Unique user ID (PK). One row per customer.',
  name              STRING    COMMENT 'User name (PII).',
  country           STRING    COMMENT 'User country. Uppercase full country name (e.g., UNITED STATES, SOUTH KOREA, INDIA).',
  user_type         STRING    COMMENT 'User type. Values: individual (individual customer) / business (business customer). One-to-one mapping with is_business.',
  is_business       BOOLEAN   COMMENT 'Whether customer is business (corporate, true/false).',
  lifetime_bookings BIGINT    COMMENT 'Total number of bookings in customer lifetime (all statuses included, distinct booking_id).',
  lifetime_spend    DOUBLE    COMMENT 'Total customer spend in customer lifetime (currency unit). Sum of total_amount for completed bookings. NULL if no bookings.',
  avg_rating_given  DOUBLE    COMMENT 'Average rating of reviews left by customer (1–5 scale). Excludes soft-deleted reviews. NULL if no reviews.',
  last_booking_at   TIMESTAMP COMMENT 'Most recent booking creation timestamp. Used to assess churn risk (no recent bookings).',
  CONSTRAINT pk_gold_customer_360 PRIMARY KEY (user_id)
)
  COMMENT 'Gold customer 360. One row per user summarizing lifetime bookings, spend, average rating, and most recent booking date. Baseline table for customer segmentation, LTV analysis, churn-risk assessment, and Genie queries.'
  TBLPROPERTIES ('quality' = 'gold', 'wb_layer' = 'gold')
AS
WITH bk AS (
  SELECT user_id,
         count(DISTINCT booking_id) AS lifetime_bookings,
         sum(CASE WHEN status = 'completed' THEN total_amount END) AS lifetime_spend,
         max(created_at) AS last_booking_at
  FROM silver_fact_bookings
  GROUP BY user_id
),
rv AS (
  SELECT user_id, avg(rating) AS avg_rating_given
  FROM silver_fact_reviews
  GROUP BY user_id
)
SELECT
  u.user_id,
  u.name,
  u.country,
  u.user_type,
  u.is_business,
  coalesce(bk.lifetime_bookings, 0) AS lifetime_bookings,
  round(bk.lifetime_spend, 2)       AS lifetime_spend,
  round(rv.avg_rating_given, 3)     AS avg_rating_given,
  bk.last_booking_at
FROM silver_dim_users u
LEFT JOIN bk ON u.user_id = bk.user_id
LEFT JOIN rv ON u.user_id = rv.user_id;
