CREATE OR REPLACE TABLE `bright-anagram-480111-d2.ecommerce_saas_dataset.clean_events` AS
SELECT
  event_id,
  user_id,
  event_type,
  TIMESTAMP(event_timestamp) as event_time_utc,
  device
FROM `bright-anagram-480111-d2.ecommerce_saas_dataset.clean_events`;

