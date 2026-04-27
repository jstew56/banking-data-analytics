/* ============================================================
Project: Banking Data Analysis
Tool: Snowflake SQL
Author: Jessica Stewart

Business Objective:
Analyze credit card utilization to identify risk exposure
and customers with high available credit.
============================================================ */

-- Calculate utilization rate for all customers

SELECT
    cus_id,
    credit_limit,
    credit_card_balance,
    (credit_card_balance / credit_limit) * 100 AS utilization_rate
FROM credit;

-- Identify customers with utilization <= 35%

SELECT
    customer_id,
    credit_limit,
    credit_card_balance,
    (credit_card_balance / credit_limit) * 100 AS utilization_rate
FROM credit
WHERE (credit_card_balance / credit_limit) <= 0.35;

-- Top 10 customers with Available Credit greater than $5,000 and <=20% utilization

SELECT
CardID,
Credit_Limit,
Credit_Card_Balance,
(Credit_Limit - Credit_Card_Balance) AS Available_Credit,
(Credit_Card_Balance / Credit_Limit) * 100 AS Utilization_Percent
FROM CREDIT
WHERE (Credit_Card_Balance / Credit_Limit) * 100 <= 20
AND (Credit_Limit - Credit_Card_Balance) > 5000
ORDER BY Available_Credit DESC
LIMIT 10


-- Key Insight:
-- Lower utilization customers represent low risk and high expansion potential.
