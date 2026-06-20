SELECT s.*
FROM `bright-anagram-480111-d2.ecommerce_saas_dataset.subscriptions` s
LEFT JOIN `bright-anagram-480111-d2.ecommerce_saas_dataset.users` u
ON s.user_id = u.user_id
WHERE u.user_id IS NULL;

SELECT e.*
FROM `bright-anagram-480111-d2.ecommerce_saas_dataset.clean_events` e
LEFT JOIN `bright-anagram-480111-d2.ecommerce_saas_dataset.users` u
ON e.user_id = u.user_id
WHERE u.user_id IS NULL;
