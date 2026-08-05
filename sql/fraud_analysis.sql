-- Total Transactions
SELECT COUNT(*) AS total_transactions
FROM fraud_transactions;

-- Fraud Transactions
SELECT COUNT(*) AS fraud_transactions
FROM fraud_transactions
WHERE class = 1;

-- Fraud Rate
SELECT
ROUND(
100.0 * SUM(CASE WHEN class = 1 THEN 1 ELSE 0 END)
/ COUNT(*),
2
) AS fraud_rate_pct
FROM fraud_transactions;

-- Average Transaction Amount
SELECT
class,
ROUND(AVG(amount),2) AS avg_amount
FROM fraud_transactions
GROUP BY class;

-- High Value Transactions
SELECT
high_value_flag,
COUNT(*) AS transaction_count
FROM fraud_transactions
GROUP BY high_value_flag;

-- Fraud by Time Bucket
SELECT
FLOOR(time/3600) AS time_bucket,
COUNT(*) AS fraud_count
FROM fraud_transactions
WHERE class = 1
GROUP BY FLOOR(time/3600)
ORDER BY time_bucket;

-- Top 10 Highest Fraud Transactions
SELECT
time,
amount,
high_value_flag
FROM fraud_transactions
WHERE class = 1
ORDER BY amount DESC
LIMIT 10;