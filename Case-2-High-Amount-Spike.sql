Case 2: High Amount Spike

Scenario:
User has spent a high total amount within the last 24 hours

Logic:
Entity  : Customer_ID
Time    : Last 24 hours
Measure : SUM(amount)
Rule    : SUM(amount) > 50000

SQL:
SELECT customerID, SUM(amount) AS total_spend_24hr
FROM aml_training_transactions
WHERE transactionDT >= DATEADD(hour, -24, GETDATE())
GROUP BY customerID
HAVING SUM(amount) > 50000;

Explanation:
User has performed transactions resulting in a high total spend within a short time window
This indicates abnormal financial behavior compared to typical usage
No additional strong fraud indicators (device/location change) present

Risk Level: 2 (Moderate)
Action: Monitor and review for further suspicious activity
