/* ============================================================
Project: Banking Data Analysis
Tool: Snowflake SQL
Author: Jessica Stewart

Business Objective:
Evaluate loan portfolio performance and identify high-value
and rejected loan segments for risk review.
============================================================ */

-- Top 10 Mortgage & Auto loans above $20K

SELECT
    loan_id,
    loan_amount,
    loan_type,
    loan_status
FROM loans
WHERE loan_type IN ('Mortgage', 'Auto')
AND loan_amount > 20000
ORDER BY loan_amount DESC
LIMIT 10;

-- Rejected loans under $15K

SELECT
    loan_id,
    loan_amount,
    loan_type,
    rejection_date,
    loan_status
FROM loans
WHERE loan_status = 'Rejected'
AND loan_amount < 15000
ORDER BY loan_amount DESC
LIMIT 10;

-- Auto loans rejected in 2022 with interest rate between 5% and 7.5%

SELECT
    loan_id,
    loan_amount,
    loan_type,
    interest_rate,
    loan_status
FROM loans
WHERE loan_type = 'Auto'
AND loan_status = 'Rejected'
AND interest_rate BETWEEN 5 AND 7.5
ORDER BY rejection_date DESC;

-- Key Insight:
-- Larger loan amounts and mid-range interest rates may correlate
-- with higher rejection trends and require deeper risk evaluation.
