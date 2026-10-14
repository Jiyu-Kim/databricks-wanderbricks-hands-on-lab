-- Wanderbricks HOL · Step 2 · 대시보드 데이터셋 "국가별 고객 요약"
-- 국가 1개 = 1행. 고객 500명 이상인 국가만 남깁니다. 버블 차트에 사용합니다.
-- <your_name>_wanderbricks_marketing 을 본인의 카탈로그 이름으로 바꿔서 사용합니다.

SELECT
  country,
  count(*) AS customers,
  round(avg(CASE WHEN lifetime_bookings > 0 THEN 1.0 ELSE 0.0 END), 4) AS booker_rate,
  round(sum(coalesce(lifetime_spend, 0)), 2) AS total_spend,
  round(avg(lifetime_spend), 2) AS avg_ltv
FROM <your_name>_wanderbricks_marketing.default.gold_customer_360
GROUP BY country
HAVING count(*) >= 500
