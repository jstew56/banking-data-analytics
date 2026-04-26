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
    customer_id,
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

-- Top 10 customers with most available credit and <=20% utilization

SELECT
    card_id,
    credit_limit,
    credit_card_balance,
    (credit_limit - credit_card_balance) AS available_credit,
    (credit_card_balance / credit_limit) * 100 AS utilization_rate
FROM credit
WHERE (credit_limit - credit_card_balance) > 5000
AND (credit_card_balance / credit_limit) <= 0.20
ORDER BY available_credit DESC
LIMIT 10;

-- Key Insight:
-- Lower utilization customers represent low risk and high expansion potential.
