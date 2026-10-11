-- Wanderbricks HOL · Step 1 · Silver: 정제·표준화 (Expectations로 품질 강제)
-- 소스: samples.wanderbricks / 대상: 파이프라인의 기본 카탈로그·스키마

-- 원천 124,509건 중 email NULL 124건 제거 → 124,385건
CREATE OR REFRESH STREAMING TABLE silver_dim_users (
  CONSTRAINT valid_user_id EXPECT (user_id IS NOT NULL) ON VIOLATION DROP ROW,
  CONSTRAINT valid_email   EXPECT (email IS NOT NULL)   ON VIOLATION DROP ROW,
  CONSTRAINT valid_type    EXPECT (user_type IN ('individual','business'))
)
  COMMENT 'Silver 사용자 차원. email 결측 제거, 국가·유형 표준화.'
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

-- 72,247건 중 total_amount<=0 1건 제거 → 72,246건
CREATE OR REFRESH STREAMING TABLE silver_fact_bookings (
  CONSTRAINT valid_booking_id EXPECT (booking_id IS NOT NULL) ON VIOLATION DROP ROW,
  CONSTRAINT valid_amount     EXPECT (total_amount > 0)       ON VIOLATION DROP ROW,
  CONSTRAINT valid_dates      EXPECT (check_out >= check_in)  ON VIOLATION DROP ROW,
  CONSTRAINT valid_status     EXPECT (status IN ('pending','confirmed','cancelled','completed')) ON VIOLATION DROP ROW,
  CONSTRAINT valid_fk         EXPECT (user_id IS NOT NULL AND property_id IS NOT NULL) ON VIOLATION DROP ROW
)
  COMMENT 'Silver 예약 사실. 유효 금액/날짜/상태만 통과. nights 파생.'
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

-- 99,793건 중 soft-delete 476건 제외 → 99,317건
CREATE OR REFRESH STREAMING TABLE silver_fact_reviews (
  CONSTRAINT valid_review_id EXPECT (review_id IS NOT NULL)  ON VIOLATION DROP ROW,
  CONSTRAINT not_deleted     EXPECT (is_deleted = false)     ON VIOLATION DROP ROW,
  CONSTRAINT valid_rating    EXPECT (rating BETWEEN 1 AND 5) ON VIOLATION DROP ROW
)
  COMMENT 'Silver 리뷰 사실. soft-delete 제외, rating 1~5.'
  TBLPROPERTIES ('quality' = 'silver', 'wb_layer' = 'silver')
AS SELECT
  review_id,
  booking_id,
  property_id,
  user_id,
  rating,
  comment,
  is_deleted,          -- EXPECT(not_deleted) 평가에 필요하므로 투영에 포함
  created_at,
  updated_at
FROM STREAM(bronze_reviews);
