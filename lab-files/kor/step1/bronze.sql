-- Wanderbricks HOL · Step 1 · Bronze: 원천 데이터를 그대로 수집 (스키마 보존 + 감사 컬럼)
-- 소스: samples.wanderbricks / 대상: 파이프라인의 기본 카탈로그·스키마

CREATE OR REFRESH STREAMING TABLE bronze_users
  COMMENT '원천 users 수집(raw). 정제 전 원본 보존.'
  TBLPROPERTIES ('quality' = 'bronze', 'wb_layer' = 'bronze')
AS SELECT *, current_timestamp() AS _ingested_at, 'samples.wanderbricks.users' AS _source
FROM STREAM(samples.wanderbricks.users);

CREATE OR REFRESH STREAMING TABLE bronze_bookings
  COMMENT '원천 bookings 수집(raw).'
  TBLPROPERTIES ('quality' = 'bronze', 'wb_layer' = 'bronze')
AS SELECT *, current_timestamp() AS _ingested_at, 'samples.wanderbricks.bookings' AS _source
FROM STREAM(samples.wanderbricks.bookings);

CREATE OR REFRESH STREAMING TABLE bronze_reviews
  COMMENT '원천 reviews 수집(raw). is_deleted(soft-delete) 플래그 포함.'
  TBLPROPERTIES ('quality' = 'bronze', 'wb_layer' = 'bronze')
AS SELECT *, current_timestamp() AS _ingested_at, 'samples.wanderbricks.reviews' AS _source
FROM STREAM(samples.wanderbricks.reviews);
