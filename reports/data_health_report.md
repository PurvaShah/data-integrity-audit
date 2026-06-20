# Data Health Report — SaaS Event Log Integrity Audit
Overview
This report summarizes the data quality issues identified in the raw SaaS event logs and user tables, and the improvements achieved after applying the SQL‑based data integrity audit.

The goal was to ensure accurate downstream analytics for MRR, churn, and product usage.

## 1. Data Issues Identified (Before Cleaning)

1.1 Duplicate Events

Count: 1

Duplicate event rows inflated usage metrics and could lead to double‑counting logins or purchases.

1.2 Orphaned Records

Orphaned events: 1

Orphaned subscriptions: 1

These records referenced user_id values that did not exist in the users table.

1.3 Timestamp Issues

NULL timestamps: 1

Mixed timezones: UTC + PST

Inconsistent formatting: Some timestamps required normalization.

1.4 Country Field Issues

NULL country values: 1

Prevented accurate geographic segmentation.

## 2. Cleaning Actions Performed

2.1 Duplicate Removal

Used ROW_NUMBER() + QUALIFY to retain only the first occurrence.

2.2 Timestamp Normalization

Two‑case logic applied:

UTC → parsed directly

PST → converted using America/Los_Angeles timezone

NULL timestamps were excluded from the cleaned dataset.

2.3 Orphan Detection

Left joins identified invalid foreign keys.

These rows were excluded from the final production table.

2.4 Country Standardization

Converted all country codes to uppercase

Excluded rows where country was NULL

# Before Cleaning
| Issue | Count |
| --- | --- |
| Duplicate events | 1 |
| Orphaned events | 1 |
| Orphaned subscriptions | 1 |
| Null timestamps | 1 |
| Inconsistent country codes | 2 |

# After Cleaning
| Issue | Count |
| --- | --- |
| Duplicate events | 0 |
| Orphaned events | 0 |
| Orphaned subscriptions | 0 |
| Null timestamps | 0 |
| Country codes standardized | 100% |

Business Impact :

Eliminated double‑counting of user activity

Ensured accurate MRR attribution

Improved data reliability for finance and product teams

Created a clean production table ready for analytics
