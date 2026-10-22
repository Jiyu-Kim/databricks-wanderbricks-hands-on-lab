-- Wanderbricks HOL · Step 1 · Bronze: Ingest source data as-is (schema preservation + audit columns)
-- Source: samples.wanderbricks / Target: pipeline's default catalog·schema

CREATE OR REFRESH STREAMING TABLE bronze_users
  COMMENT 'Raw source users ingestion. Original data preserved before cleansing.'
  TBLPROPERTIES ('quality' = 'bronze', 'wb_layer' = 'bronze')
AS SELECT *, current_timestamp() AS _ingested_at, 'samples.wanderbricks.users' AS _source
FROM STREAM(samples.wanderbricks.users);

CREATE OR REFRESH STREAMING TABLE bronze_bookings
  COMMENT 'Raw source bookings ingestion.'
  TBLPROPERTIES ('quality' = 'bronze', 'wb_layer' = 'bronze')
AS SELECT *, current_timestamp() AS _ingested_at, 'samples.wanderbricks.bookings' AS _source
FROM STREAM(samples.wanderbricks.bookings);

CREATE OR REFRESH STREAMING TABLE bronze_reviews
  COMMENT 'Raw source reviews ingestion. Includes is_deleted (soft-delete) flag.'
  TBLPROPERTIES ('quality' = 'bronze', 'wb_layer' = 'bronze')
AS SELECT *, current_timestamp() AS _ingested_at, 'samples.wanderbricks.reviews' AS _source
FROM STREAM(samples.wanderbricks.reviews);
