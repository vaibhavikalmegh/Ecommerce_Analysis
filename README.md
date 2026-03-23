# E-Commerce Sales Analytics Dashboard

An end-to-end data analytics project that analyzes e-commerce sales data to generate business insights and build a predictive model for return analysis. The project integrates SQL, Python, and Power BI to deliver both analytical and machine learning solutions.

---

## Dashboard Preview

### Sales Overview
<p align="center">
  <img src="docs/Dashboard1.png" width="900"/>
</p>

<p align="center">
  <img src="docs/Dashboard2.png" width="900"/>
</p>

### Product Analysis
<p align="center">
  <img src="docs/Dashboard3.png" width="900"/>
</p>

---

## Problem Statement

The objective of this project is to analyze e-commerce sales data to uncover key insights related to revenue, customer behavior, product performance, and returns. The goal is to support data-driven decision-making for improving profitability and operational efficiency.

Additionally, a machine learning model is developed to predict the likelihood of order returns, enabling proactive business strategies.

---

## Dataset Description

The dataset contains transactional sales data with the following attributes:

* Customer_ID
* Gender
* Region
* Age
* Product_Name
* Category
* Unit_Price
* Quantity
* Total_Price
* Shipping_Fee
* Shipping_Status
* Order_Date

### Additional Features Engineered

* Order Year
* Order Month
* Order Month Number
* Order Value Segment (Low / Medium / High)
* Returned (Target variable for machine learning)

---

## Tools and Technologies Used

**Excel**

* Data cleaning and preprocessing
* Initial exploration

**SQL (MySQL)**

* Data transformation
* KPI calculations
* Aggregations and analysis

**Python**

* Pandas, NumPy for data handling
* Seaborn, Matplotlib for visualization
* Scikit-learn for machine learning

**Power BI**

* Interactive dashboard creation
* Business insights visualization

---

## Exploratory Data Analysis (Python)

* Converted Order Date into datetime format
* Removed 'In Transit' records to focus on completed outcomes
* Created binary target variable:

  * Returned = 1 (Returned)
  * Returned = 0 (Delivered)

### Key Observations

* Certain product categories show higher return rates
* Returns vary significantly across regions
* Higher-priced products show more variability in returns
* Dataset shows class imbalance in return behavior

---

## Predictive Modeling (Return Prediction)

### Objective

Predict whether an order will be returned or not.

### Model Used

Logistic Regression

### Reason for Choosing Logistic Regression

* Suitable for binary classification problems
* Interpretable model using coefficients
* Efficient baseline model

### Steps Performed

* Selected features: Quantity, Total Price, Age, Shipping Fee
* Applied one-hot encoding on Category and Region
* Standardized features using StandardScaler
* Split data into training and testing sets (80/20)

### Model Evaluation

* Accuracy Score
* Confusion Matrix
* Classification Report
* ROC Curve and AUC Score

### Outcome

* Identified key factors influencing returns
* Model helps detect high-risk orders
* Can support strategies to reduce return rates

---

## Dashboard Overview

The Power BI dashboard includes:

* KPI cards (Revenue, Orders, Customers, AOV, Return Rate)
* Monthly revenue trend
* Revenue by region
* Revenue by product
* Category-wise distribution
* Customer segmentation
* Drill-through analysis
* Profitability analysis

---

## Key Insights

### Revenue Analysis

* Laptop category contributes approximately 52% of total revenue
* High dependency on a single category

### Regional Analysis

* West region generates the highest revenue
* North region has the highest average order value
* South region shows lower spending patterns

### Customer Analysis

* Majority of customers fall in the low-value segment
* A small group of high-value customers contributes significantly

### Return Analysis

* Return rate is approximately 30.8%
* Products like Monitor and Laptop have higher returns
* Returns are concentrated in specific regions

### Seasonality

* Peak sales observed in January and November
* Lower sales observed in February and March

---

## Business Recommendations

### Reduce Return Rate

* Investigate high-return products
* Improve product descriptions and quality
* Use predictive model to identify high-risk orders

### Diversify Revenue

* Reduce reliance on laptop category
* Promote other product categories

### Customer Strategy

* Target high-value customers with loyalty programs
* Implement personalized marketing

### Regional Strategy

* Focus on improving performance in low-performing regions
* Introduce region-specific campaigns

### Seasonal Strategy

* Increase promotions during low-demand months
* Maximize sales during peak periods

---

## Setup Instructions

### 1. Clone the Repository

```bash
git clone <your-repo-link>
cd project-1-ecommerce-dashboard
```

### 2. Install Dependencies

```bash
pip install -r requirements.txt
```

### 3. Run SQL Analysis

Execute queries from:

* data_cleaning.sql
* kpi_calculations.sql
* analysis_queries.sql

### 4. Run Python Analysis

```bash
cd python_scripts
python model_training.py
```

### 5. Open Dashboard

Open the Power BI file from the dashboards folder.

---

## Project Structure

```
project-1-ecommerce-dashboard/
├── README.md
├── data/
├── sql_queries/
├── notebooks/
├── dashboards/
├── python_scripts/
├── docs/
└── requirements.txt
```

---

## Challenges Faced

* Handling class imbalance in return prediction
* Cleaning inconsistent column names
* Encoding categorical variables
* Removing incomplete order states

---

## Conclusion

This project demonstrates a complete data analytics workflow, combining SQL, Python, and Power BI to generate actionable insights and build a predictive model for return optimization.
