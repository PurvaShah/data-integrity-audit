# PROJECT OVERVIEW 
This project simulates a real‑world data engineering scenario where a SaaS company experiences silent data corruption in its event logs.
The goal is to audit, clean, and validate the data using SQL, ensuring accurate downstream analytics for MRR, churn, and product usage.

## The project uses:

BigQuery SQL

Three raw tables: users, subscriptions, events

Five SQL scripts to clean and validate the data

What Each SQL File Does
## 1️⃣ 01_duplicate_detection.sql
Identifies duplicate event rows using ROW_NUMBER()

Removes duplicates using QUALIFY rn = 1

Creates clean.events_deduped

Key concepts: window functions, deduplication, QUALIFY

## 2️⃣ 02_timezone_standardization.sql
Handles only two timezones: UTC and PST

Parses UTC timestamps directly

Converts PST timestamps using America/Los_Angeles

Produces a clean event_ts_utc column

Key concepts: PARSE_TIMESTAMP, timezone conversion, CASE logic

## 3️⃣ 03_country_cleaning.sql
Standardizes country codes to uppercase

Excludes rows where country is NULL

Creates clean.users_cleaned

Key concepts: data standardization, NULL handling

## 4️⃣ 04_orphan_detection.sql
Detects orphaned events and subscriptions

Uses left joins to find invalid foreign keys

Excludes orphaned rows from the final dataset

Key concepts: referential integrity, left join validation

## 5️⃣ 05_final_table.sql
Joins cleaned events + cleaned users

Excludes NULL timestamps and NULL country rows

Produces the final production table:

Code
production.user_activity

Key concepts: data modeling, clean table creation
