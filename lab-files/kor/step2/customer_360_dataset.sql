-- Wanderbricks HOL · Step 2 · 대시보드 데이터셋 "고객 360"
-- gold_customer_360을 고객 단위 분석용 차원(세그먼트·국가 그룹·예약 빈도·지출 구간·최근성·평점 구간)으로 가공합니다.
-- <your_name>_wanderbricks_marketing 을 본인의 카탈로그 이름으로 바꿔서 사용합니다.

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
  CASE WHEN t.country IS NOT NULL THEN b.country ELSE '기타' END AS country_group,
  CASE WHEN b.is_business THEN '비즈니스 고객' ELSE '개인 고객' END AS customer_segment,
  b.lifetime_bookings,
  coalesce(b.lifetime_spend, 0) AS lifetime_spend,
  b.lifetime_spend AS spender_ltv,
  b.avg_rating_given,
  b.last_booking_at,
  CASE WHEN b.lifetime_bookings > 0 THEN 1 ELSE 0 END AS is_booker,
  CASE WHEN b.lifetime_bookings >= 2 THEN 1 ELSE 0 END AS is_repeat,
  CASE WHEN b.lifetime_bookings = 0 THEN '0회 (미예약)'
       WHEN b.lifetime_bookings = 1 THEN '1회'
       WHEN b.lifetime_bookings = 2 THEN '2회'
       ELSE '3회 이상' END AS booking_freq,
  CASE WHEN b.lifetime_spend IS NULL THEN '1) 지출 없음'
       WHEN b.lifetime_spend < 350  THEN '2) $350 미만'
       WHEN b.lifetime_spend < 800  THEN '3) $350–800'
       WHEN b.lifetime_spend < 1200 THEN '4) $800–1,200'
       ELSE '5) $1,200 이상' END AS spend_tier,
  CASE WHEN b.last_booking_at IS NULL THEN '5) 예약 없음'
       WHEN datediff(b.as_of_ts, b.last_booking_at) <= 30  THEN '1) 30일 이내'
       WHEN datediff(b.as_of_ts, b.last_booking_at) <= 90  THEN '2) 31–90일'
       WHEN datediff(b.as_of_ts, b.last_booking_at) <= 180 THEN '3) 91–180일'
       ELSE '4) 180일 초과' END AS recency_bucket,
  CASE WHEN b.avg_rating_given IS NULL THEN '리뷰 없음'
       WHEN b.avg_rating_given < 2 THEN '1–2점'
       WHEN b.avg_rating_given < 3 THEN '2–3점'
       WHEN b.avg_rating_given < 4 THEN '3–4점'
       ELSE '4–5점' END AS rating_band
FROM base b
LEFT JOIN top_country t ON b.country = t.country
