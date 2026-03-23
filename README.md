🔷 E-Commerce Sales Analytics Dashboard
End-to-End Data Analytics Project (SQL + Python + Power BI + Machine Learning)

🔷 Dashboard Preview
![Dashboard](Dashboard1.png)
![Dashboard](Dashboard2.png)
![Dashboard](Dashboard3.png)

🔷 Problem Statement
The objective of this project is to analyze e-commerce sales data to uncover key business insights related to revenue, customer behavior, product performance, and returns. The goal is to support data-driven decision-making for improving profitability and operational efficiency.
Additionally, a predictive model is developed to identify the likelihood of order returns, enabling proactive business strategies.

🔷 Dataset Description
The dataset contains transactional sales data with the following key attributes:
Customer_ID
Gender
Region
Age
Product_Name
Category
Unit_Price
Quantity
Total_Price
Shipping_Fee
Shipping_Status
Order_Date

🔷Additional Features Engineered:
Order Year
Order Month
Order Month Number
Order Value Segment (Low / Medium / High)
Returned (Target Variable for Machine Learning)

🔷 Tools & Technologies Used
Excel → Data cleaning, preprocessing, and initial exploration
SQL (MySQL) → Data analysis, aggregations, KPI calculations
Python (Pandas, NumPy, Seaborn, Matplotlib, Scikit-learn) → Exploratory Data Analysis & Predictive Modeling
Power BI → Interactive dashboard and data visualization

🔷 Exploratory Data Analysis (Python)
Converted Order Date into datetime format for time-based analysis
Removed 'In Transit' records to focus on final delivery outcomes
Created binary target variable:
Returned = 1 → Returned
Returned = 0 → Delivered

📊 Key EDA Insights:
Category vs Returns
-->Certain categories show significantly higher return behavior

Region vs Returns
-->Returns are unevenly distributed across regions

Price vs Returns
-->Higher-priced products tend to have higher return variability

Class Distribution
-->Imbalance observed between returned and non-returned orders

🔷 Predictive Modeling (Return Prediction)
Objective:
Predict whether an order will be returned or not
Model Used: Logistic Regression

Why Logistic Regression?
Suitable for binary classification (Returned vs Not Returned)
Easy to interpret using coefficients
Fast and efficient baseline model

Steps:
Feature selection:
Quantity
Total Price
Age
Shipping Fee
Categorical encoding:
Category
Region (One-Hot Encoding)
Data standardization using StandardScaler
Train-test split (80/20)

🔷Model Evaluation:
Accuracy Score
Confusion Matrix
Classification Report (Precision, Recall, F1-score)
ROC Curve & AUC Score

🔷Feature Importance:
Identified key drivers influencing returns using model coefficients

🔷Outcome: 
Model helps identify high-risk orders
Enables businesses to take preventive actions to reduce returns

🔷 Dashboard Overview
The Power BI dashboard includes:
KPI Cards: Revenue, Orders, Customers, AOV, Return Rate
Revenue Trend (Monthly)
Revenue by Region
Revenue by Product
Category-wise Revenue Distribution
Customer Segmentation
Drill-through Product Analysis
Tooltip-based Insights
Profitability Analysis Page

🔷 Key Insights
📌Revenue Concentration
Laptop category contributes ~52% of total revenue
High dependency on a single product category

📌 Regional Performance
West region generates highest revenue
North region has highest Average Order Value (AOV)
South region shows lower spending behavior

📌 Customer Behavior
Majority of customers fall in Low Value segment
Small group of high-value customers contributes significantly

📌 Return Analysis
Return rate is high (~30.8%)
Products like Monitor and Laptop have higher return counts
Returns are concentrated in specific regions

📌 Seasonality
Peak sales observed in January and November
Lower sales in February and March

🔷 Business Recommendations
📌Reduce Return Rate
Investigate high-return products
Improve product quality and descriptions
Use predictive model to flag high-risk orders

📌Diversify Revenue Streams
Reduce dependency on Laptop category
Promote accessories and other categories

📌Target High-Value Customers
Introduce loyalty programs
Personalized marketing campaigns

📌Improve Low-Performing Regions
Focus marketing efforts in South region
Introduce region-specific offers

📌Leverage Seasonal Trends
Increase promotions during low months
Maximize sales during peak periods

🚀 How to Run the Project
Clone the repository
Install dependencies:
pip install -r requirements.txt
Run SQL scripts from:
data_cleaning.sql
kpi_calculations.sql
analysis_queries.sql
Open notebooks/eda_analysis.ipynb for EDA & ML
Run python_scripts/model_training.py for model training
Open .pbix file in Power BI to view dashboard

📁 Project Structure
project-1-ecommerce-dashboard/
├── README.md
├── data/
├── sql_queries/
├── notebooks/
├── dashboards/
├── python_scripts/
├── docs/
└── requirements.txt

⚠️ Challenges Faced
Handling class imbalance in return prediction
Cleaning inconsistent column names and formats
Encoding categorical variables for modeling
Removing incomplete order states (In Transit)

🏁 Conclusion
This project demonstrates an end-to-end data analytics workflow, combining SQL, Python, and Power BI to generate actionable business insights and build a predictive model for return optimization.
