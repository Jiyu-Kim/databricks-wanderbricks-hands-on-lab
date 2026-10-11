-- Wanderbricks HOL · Step 1 · Gold: 고객 360 (Materialized View)
-- 소스: samples.wanderbricks / 대상: 파이프라인의 기본 카탈로그·스키마

-- (주의) bookings·reviews를 동시에 조인한 뒤 집계하면 팬아웃이 생기므로,
--        사실 테이블별로 먼저 집계(CTE)한 뒤 사용자 차원에 조인합니다.

CREATE OR REFRESH MATERIALIZED VIEW gold_customer_360 (
  user_id           BIGINT NOT NULL COMMENT '사용자 고유 ID (PK). 고객 1명이 1행(grain).',
  name              STRING    COMMENT '사용자 이름 (PII).',
  country           STRING    COMMENT '사용자 국가. 대문자 전체 국가명 (예: UNITED STATES, SOUTH KOREA, INDIA).',
  user_type         STRING    COMMENT '사용자 유형. 값: individual(개인 고객) / business(비즈니스 고객). is_business와 1:1 대응.',
  is_business       BOOLEAN   COMMENT '비즈니스(법인) 고객 여부(true/false).',
  lifetime_bookings BIGINT    COMMENT '생애 누적 예약 수(모든 상태 포함, 중복 없는 booking_id 기준).',
  lifetime_spend    DOUBLE    COMMENT '생애 누적 지출액(통화 단위). status=completed 예약의 total_amount 합계. 예약이 없으면 NULL.',
  avg_rating_given  DOUBLE    COMMENT '사용자가 남긴 리뷰의 평균 평점(1~5). soft-delete 리뷰 제외. 리뷰가 없으면 NULL.',
  last_booking_at   TIMESTAMP COMMENT '가장 최근 예약 생성 시각. 이탈 위험(최근 예약 없음) 판단 기준.',
  CONSTRAINT pk_gold_customer_360 PRIMARY KEY (user_id)
)
  COMMENT 'Gold 고객 360. 사용자(User) 1명당 1행으로 생애 예약수·지출·평균 평점·최근 예약일을 요약. 고객 세그먼트·LTV·이탈 위험 분석과 Genie 질의의 기준 테이블.'
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
