CREATE OR REPLACE TABLE `bright-anagram-480111-d2.ecommerce_saas_dataset.events` AS
SELECT
  event_id,
  user_id,
  event_type,

  -- Clean timestamp in one step
  REGEXP_REPLACE(
      REGEXP_REPLACE(
          REGEXP_REPLACE(event_timestamp, r'[^0-9A-Za-z: \-\/]', '-'),  -- remove hidden chars
      r'-+', '-'),                                                      -- normalize hyphens
  r'\s+', ' ') AS event_timestamp,                                      -- normalize spaces

  device
FROM `bright-anagram-480111-d2.ecommerce_saas_dataset.events`
WHERE event_timestamp IS NOT NULL
  AND TRIM(event_timestamp) != '';

SELECT 
  *,
  ROW_NUMBER() OVER (
    PARTITION BY user_id, event_type, event_timestamp, device
    ORDER BY event_id
  ) AS rn
FROM `bright-anagram-480111-d2.ecommerce_saas_dataset.events`;

CREATE OR REPLACE TABLE `bright-anagram-480111-d2.ecommerce_saas_dataset.clean_events` AS
SELECT *
FROM (
  SELECT 
    *,
    ROW_NUMBER() OVER (
      PARTITION BY user_id, event_type, event_timestamp, device
      ORDER BY event_id
    ) AS rn
  FROM `bright-anagram-480111-d2.ecommerce_saas_dataset.events`
)
WHERE rn = 1;
