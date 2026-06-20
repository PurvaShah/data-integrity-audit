CREATE OR REPLACE TABLE `bright-anagram-480111-d2.ecommerce_saas_dataset.clean_users` AS
SELECT
  user_id,
  signup_date,
  UPPER(country) AS country_clean
FROM `bright-anagram-480111-d2.ecommerce_saas_dataset.users`
WHERE country IS NOT NULL
  AND TRIM(country) != '';
