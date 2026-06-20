CREATE OR REPLACE TABLE `bright-anagram-480111-d2.ecommerce_saas_dataset.production_user_activity` AS
SELECT 
  e.event_id,
  e.user_id,
  u.country_clean AS country,
  e.event_ts_utc,
  e.event_type,
  e.device
FROM `bright-anagram-480111-d2.ecommerce_saas_dataset.clean_events` e
JOIN `bright-anagram-480111-d2.ecommerce_saas_dataset.clean_users` u
ON e.user_id = u.user_id
WHERE u.user_id is not null AND e.event_ts_utc IS NOT NULL
  AND u.country_clean IS NOT NULL
  AND TRIM(u.country_clean) != '';
