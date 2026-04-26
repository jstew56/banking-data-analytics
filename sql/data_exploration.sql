/* ============================================================
Project: Banking Data Analysis
Tool: Snowflake SQL
Author: Jessica Stewart

Business Question:
What is the average credit card balance owed by customers?
============================================================ */

SELECT
    AVG(credit_card_balance) AS avg_balance_owed
FROM credit;
