CREATE DATABASE customer_churn_project;
USE customer_churn_project;

CREATE TABLE customers_churn_data(
CustomerID VARCHAR(10),
Customer_Segment VARCHAR(20),
Acquisition_Date DATE,
Age INT,
Gender VARCHAR(20),
Job_Category VARCHAR(50),
Annual_Income INT,
Education_Level VARCHAR(50),
Marital_Status VARCHAR(20),
Household_Size INT,
Product VARCHAR(20),
Quantity INT,
Unit_Price FLOAT,
Discount_Applied FLOAT,
Payment_Method VARCHAR(30),
Revenue INT,
Customer_Lifetime_Value INT,
Profit_Margin FLOAT,
Loyalty_Score FLOAT,
Loyalty_Tier VARCHAR(20),
Customer_Satisfaction FLOAT,
Purchase_Frequency INT,
Days_Since_Last_Purchase INT,
Newsletter_Subscribed INT,
Support_Tickets INT,
Email_Open_Rate FLOAT,
Social_Media_Engagement FLOAT,
Purchase_Date DATE,
Purchase_Hour INT,
Season VARCHAR(20),
Is_Weekend INT,
Days_to_Next_Purchase INT,
Churned INT,
Churn_Risk_Score FLOAT,
Return_Rate FLOAT,
Payment_Delay_Days INT,
Customer_Acquisition_Cost INT,
Marketing_Channel VARCHAR(30),
First_Purchase_Channel VARCHAR(30),
Net_Revenue FLOAT,
Revenue_per_Unit FLOAT,
CLV_to_CAC_Ratio FLOAT,
Engagement_Score FLOAT,
Profitability_Score FLOAT,
Age_Group VARCHAR(10),
Revenue_Tier VARCHAR(20),
Seasonal_Factor FLOAT,
Purchase_Month INT,
Purchase_Quarter INT,
Purchase_Year INT,
Days_Since_Acquisition INT,
Acquisition_Month VARCHAR(10),
Cohort_Index INT
);

SET GLOBAL local_infile=1;
SHOW VARIABLES LIKE 'local_infile';

LOAD DATA LOCAL INFILE 'C:/PROJECT_PYTHON/clean_customer_data(1).csv'
INTO TABLE customers_churn_data
FIELDS TERMINATED BY ','
ENCLOSED BY ""
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM customers_churn_data;

SELECT COUNT(DISTINCT CustomerID) AS total_customers
FROM customers_churn_data;

SELECT SUM(Net_Revenue) AS total_revenue
FROM customers_churn_data;

SELECT 
ROUND(
SUM(CASE WHEN Churned = TRUE THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
2
) AS churn_rate_percentage
FROM customers_churn_data;

SELECT 
Customer_Segment,
COUNT(CustomerID) AS total_customers,
SUM(Net_Revenue) AS total_revenue
FROM customers_churn_data
GROUP BY Customer_Segment
ORDER BY total_revenue DESC;

SELECT 
CustomerID,
SUM(Net_Revenue) AS total_revenue
FROM customers_churn_data
GROUP BY CustomerID
ORDER BY total_revenue DESC
LIMIT 10;

SELECT 
Marketing_Channel,
SUM(Net_Revenue) AS revenue_generated,
COUNT(CustomerID) AS customers_acquired
FROM customers_churn_data
GROUP BY Marketing_Channel
ORDER BY revenue_generated DESC;

SELECT 
Product,
SUM(Quantity) AS total_units_sold,
SUM(Net_Revenue) AS revenue
FROM customers_churn_data
GROUP BY Product
ORDER BY revenue DESC;

SELECT 
Customer_Segment,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churned = TRUE THEN 1 ELSE 0 END) AS churned_customers
FROM customers_churn_data
GROUP BY Customer_Segment;

SELECT AVG(Customer_Lifetime_Value) AS avg_clv
FROM customers_churn_data;

SELECT Payment_Method,
SUM(Net_Revenue) AS revenue
FROM customers_churn_data
GROUP BY Payment_Method
ORDER BY revenue DESC;

SELECT Age_Group,
SUM(Net_Revenue) AS revenue
FROM customers_churn_data
GROUP BY Age_Group
ORDER BY revenue DESC;

SELECT Season,
SUM(Net_Revenue) AS revenue
FROM customers_churn_data
GROUP BY Season
ORDER BY revenue DESC;

SELECT Customer_Satisfaction,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churned = TRUE THEN 1 ELSE 0 END) AS churned_customers
FROM customers_churn_data
GROUP BY Customer_Satisfaction
ORDER BY Customer_Satisfaction;

SELECT Purchase_Year,
Purchase_Month,
SUM(Net_Revenue) AS revenue
FROM customers_churn_data
GROUP BY Purchase_Year, Purchase_Month
ORDER BY Purchase_Year, Purchase_Month;

SELECT Customer_Segment,
AVG(Profitability_Score) AS avg_profitability
FROM customers_churn_data
GROUP BY Customer_Segment
ORDER BY avg_profitability DESC;

