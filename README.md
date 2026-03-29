# Transaction Monitoring & Fraud Detection (SQL)

This project demonstrates SQL-based fraud detection techniques used in transaction monitoring systems.

## Objective
To identify suspicious transaction patterns using SQL queries based on real-world fraud scenarios.

---

## Cases Covered

### 1. Velocity Detection
Detects high frequency transactions in a short time window.

### 2. High Amount Spike
Identifies unusually high spending within a defined time period.

### 3. New Device Detection
Detects transactions from previously unseen devices.

### 4. New Location Detection
Identifies geo-location mismatch or unusual access patterns.

### 5. Account Takeover (ATO) Pattern
Detects failed login attempts followed by successful login.

### 6. New Beneficiary Risk
Identifies fund transfers to newly added beneficiaries.

---

## Key Techniques Used

- SQL (GROUP BY, HAVING, CASE WHEN)
- Time-based filtering (DATEADD)
- Subqueries (NOT EXISTS)
- Pattern-based anomaly detection

---

## Use Case

These scenarios simulate real-world transaction monitoring and fraud detection use cases in banking and financial systems.

---
