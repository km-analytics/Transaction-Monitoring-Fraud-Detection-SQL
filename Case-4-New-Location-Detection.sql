-- Case 4: New Location Detection

-- Scenario:
-- Transaction initiated from a new geographic location

-- Logic:
-- Entity  : Customer_ID
-- Time    : Current vs past history
-- Measure : LocationID
-- Rule    : Current location NOT seen in past

SELECT a.customerID, a.locationID, a.transactionDT
FROM aml_training_transactions a
WHERE a.transactionDT >= DATEADD(day, -1, GETDATE())
AND NOT EXISTS (
    SELECT 1
    FROM aml_training_transactions b
    WHERE b.customerID = a.customerID
      AND b.locationID = a.locationID
      AND b.transactionDT < a.transactionDT
);

-- Explanation:
-- Transaction originates from a new location not seen in user's history
-- Indicates geo-location mismatch and possible unauthorized access

-- Risk Level: 3 (High)
-- Action: Alert and immediate verification
