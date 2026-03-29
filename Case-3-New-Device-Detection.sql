-- Case 3: New Device Detection

-- Scenario:
-- Transaction initiated from a device not seen before for the customer

-- Logic:
-- Entity  : Customer_ID
-- Time    : Current vs past history
-- Measure : DeviceID
-- Rule    : Current device NOT seen in past

SELECT a.customerID, a.deviceID, a.transactionDT
FROM aml_training_transactions a
WHERE a.transactionDT >= DATEADD(day, -1, GETDATE())
AND NOT EXISTS (
    SELECT 1
    FROM aml_training_transactions b
    WHERE b.customerID = a.customerID
      AND b.deviceID = a.deviceID
      AND b.transactionDT < a.transactionDT
);

-- Explanation:
-- Transaction is initiated from a new device not previously associated with the user
-- Indicates possible unauthorized access or account compromise
-- Strong behavioral anomaly

-- Risk Level: 3 (High)
-- Action: Alert and immediate verification
