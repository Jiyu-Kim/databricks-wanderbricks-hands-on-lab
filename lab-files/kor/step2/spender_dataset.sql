-- Wanderbricks HOL · Step 2 · 대시보드 데이터셋 "지출 고객"
-- 숙박 완료 예약이 있는 고객(생애 지출 > 0)만 남깁니다. LTV 분포 히스토그램에 사용합니다.
-- <your_name>_wanderbricks_marketing 을 본인의 카탈로그 이름으로 바꿔서 사용합니다.

SELECT
  user_id,
  CASE WHEN is_business THEN '비즈니스 고객' ELSE '개인 고객' END AS customer_segment,
  lifetime_spend AS spender_ltv
FROM <your_name>_wanderbricks_marketing.default.gold_customer_360
WHERE lifetime_spend IS NOT NULL
