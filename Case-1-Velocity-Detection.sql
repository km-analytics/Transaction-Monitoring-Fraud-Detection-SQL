-- Case 1: Velocity Detection

-- Scenario:
-- User performs multiple transactions within a short time window

-- Logic:
-- Entity  : Customer_ID
-- Time    : Last 10 minutes
-- Measure : COUNT(transaction)
-- Rule    : COUNT >= 6

SELECT customerID, COUNT(*) AS txn_count_10min
FROM aml_training_transactions
WHERE transactionDT >= DATEADD(minute, -10, GETDATE())
GROUP BY customerID
HAVING COUNT(*) >= 6;

-- Explanation:
-- User performed multiple transactions in a short time window
-- Indicates velocity burst which may suggest abnormal activity
-- No additional strong fraud indicators present

-- Risk Level: 2 (Moderate)
-- Action: Monitor and review
