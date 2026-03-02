-- Database: PostgreSQL
-- Author: Snex-Tech Programmer
-- Date: 2026-03-02
/* =====================================================
   CUSTOMER CHURN ANALYSIS
   Project: Customer Churn Prediction & Retention Strategy
   Description: SQL queries used for descriptive and
   financial churn analysis.
   ===================================================== */


/* -----------------------------------------------------
   1️⃣ Overall Churn Rate
----------------------------------------------------- */

SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customers;


/* -----------------------------------------------------
   2️⃣ Churn Rate by Contract Type
----------------------------------------------------- */

SELECT
    contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customers
GROUP BY contract
ORDER BY churn_rate_percentage DESC;


/* -----------------------------------------------------
   3️⃣ Monthly Revenue Lost Due to Churn
----------------------------------------------------- */

SELECT
    ROUND(SUM(monthly_charges), 2) AS monthly_revenue_lost
FROM customers
WHERE churn = 'Yes';


/* -----------------------------------------------------
   4️⃣ Estimated Customer Lifetime Value (CLTV) Lost
   (Assuming avg tenure represents lifetime duration)
----------------------------------------------------- */

SELECT
    ROUND(SUM(monthly_charges * tenure_months), 2) AS estimated_cltv_lost
FROM customers
WHERE churn = 'Yes';


/* -----------------------------------------------------
   5️⃣ Churn by Payment Method
----------------------------------------------------- */

SELECT
    payment_method,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customers
GROUP BY payment_method
ORDER BY churn_rate_percentage DESC;


/* -----------------------------------------------------
   6️⃣ Churn by Internet Service Type
----------------------------------------------------- */

SELECT
    internet_service,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customers
GROUP BY internet_service
ORDER BY churn_rate_percentage DESC;