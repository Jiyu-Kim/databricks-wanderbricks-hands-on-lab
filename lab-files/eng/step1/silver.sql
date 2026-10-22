-- Wanderbricks HOL · Step 1 · Silver: Cleanse & standardize (quality enforced with Expectations)
-- Source: samples.wanderbricks / Target: pipeline's default catalog·schema

-- From 124,509 source rows, removed 124 NULL email rows → 124,385 rows
CREATE OR REFRESH STREAMING TABLE silver_dim_users (
  CONSTRAINT valid_user_id EXPECT (user_id IS NOT NULL) ON VIOLATION DROP ROW,
  CONSTRAINT valid_email   EXPECT (email IS NOT NULL)   ON VIOLATION DROP ROW,
  CONSTRAINT valid_type    EXPECT (user_type IN ('individual','business'))
)
  COMMENT 'Silver user dimension. Removed missing emails, standardized country and user type.'
  TBLPROPERTIES ('quality' = 'silver', 'wb_layer' = 'silver')
AS SELECT
  user_id,
  lower(trim(email))             AS email,
  trim(name)                     AS name,
  upper(trim(country))           AS country,
  lower(trim(user_type))         AS user_type,
  is_business,
  nullif(trim(company_name), '') AS company_name,
  created_at
FROM STREAM(bronze_users);

-- From 72,247 source rows, removed 1 row with total_amount ≤ 0 → 72,246 rows
CREATE OR REFRESH STREAMING TABLE silver_fact_bookings (
  CONSTRAINT valid_booking_id EXPECT (booking_id IS NOT NULL) ON VIOLATION DROP ROW,
  CONSTRAINT valid_amount     EXPECT (total_amount > 0)       ON VIOLATION DROP ROW,
  CONSTRAINT valid_dates      EXPECT (check_out >= check_in)  ON VIOLATION DROP ROW,
  CONSTRAINT valid_status     EXPECT (status IN ('pending','confirmed','cancelled','completed')) ON VIOLATION DROP ROW,
  CONSTRAINT valid_fk         EXPECT (user_id IS NOT NULL AND property_id IS NOT NULL) ON VIOLATION DROP ROW
)
  COMMENT 'Silver bookings fact. Only valid amounts, dates, and statuses pass through. Derived nights column.'
  TBLPROPERTIES ('quality' = 'silver', 'wb_layer' = 'silver')
AS SELECT
  booking_id,
  user_id,
  property_id,
  check_in,
  check_out,
  datediff(check_out, check_in) AS nights,
  guests_count,
  total_amount,
  status,
  created_at,
  updated_at
FROM STREAM(bronze_bookings);

-- From 99,793 source rows, excluded 476 soft-deleted rows → 99,317 rows
CREATE OR REFRESH STREAMING TABLE silver_fact_reviews (
  CONSTRAINT valid_review_id EXPECT (review_id IS NOT NULL)  ON VIOLATION DROP ROW,
  CONSTRAINT not_deleted     EXPECT (is_deleted = false)     ON VIOLATION DROP ROW,
  CONSTRAINT valid_rating    EXPECT (rating BETWEEN 1 AND 5) ON VIOLATION DROP ROW
)
  COMMENT 'Silver reviews fact. Excluded soft-deleted reviews, rating 1–5 only.'
  TBLPROPERTIES ('quality' = 'silver', 'wb_layer' = 'silver')
AS SELECT
  review_id,
  booking_id,
  property_id,
  user_id,
  rating,
  comment,
  is_deleted,          -- Included in projection as it is needed for not_deleted EXPECT evaluation
  created_at,
  updated_at
FROM STREAM(bronze_reviews);
