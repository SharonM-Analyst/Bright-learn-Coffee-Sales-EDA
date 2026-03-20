
# ☕ Bright Coffee Shop Sales Analysis

## 📊 Case Study Overview

This project analyzes historical transactional data from Bright Coffee Shop to support a newly appointed CEO in making data-driven decisions. 
The dataset contains daily transaction records, including product details, pricing, quantity sold, store information, and timestamps.

## Aim

The main goal is to increase revenue and improve product performance by uncovering actionable insights from sales data.

## 🎯 Objectives

The analysis focuses on answering key business questions:

* Which products generate the most revenue
* What time of day the store performs best
* Sales trends across products and time intervals
* How to improve overall sales performance


## ⚙️ Methodology (How the Case Study Was Done)

### 1. 📌 Planning & Data Architecture

* Designed a data workflow diagram
* Identified key metrics such as:
  * Revenue (`unit_price × transaction_qty`)
  * Sales by product and time
  * Customer behaviour
* Defined analysis approach and expected insights


### 2. 🔄 Data Pre-Processing

* Loaded CSV dataset into a structured environment
* Perfomed Dataset Understanding using sql
* Performed data cleaning:

  * Fixed data types (e.g., price formatting)
  * Removed inconsistencies
  * Removed anomalies
* Created new features:

  * Time buckets (hourly intervals) using Case statements


### 3. 🧮 Exploratory Data Analysis

* Used SQL queries to:

  * Aggregate revenue by product and category
  * Analyze sales by time (hour, day, month)
  * Compare store performance
  * Explored trends and patterns in sales data


### 4. 📊 Data Visualization

* Built dashboards and charts to present insights:

  * Revenue by product
  * Peak sales hours
  * Sales trends over time
  * Created clear visuals to support decision-making

## 🔍 Key Insights

### 💰 Revenue Insights

* A small number of products generate the majority of revenue (Pareto principle)
* High-performing products are critical for business growth

### ⏰ Time-Based Insights

* Sales peak during specific hours (morning rush)
* Certain periods show significantly lower sales

### 📈 Sales Trends

* Sales vary across days and months, showing patterns and trends
* Opportunities exist to improve consistency in revenue

### 🏪 Store Performance

* Some locations outperform others
* Indicates potential differences in demand or operations

## 💡 Recommendations

### 📦 Inventory Optimization

* Increase stock for high-demand products
* Reduce inventory for slow-moving items

### 👥 Staffing Strategy

* Allocate more staff during peak hours
* Reduce staffing during slow periods

### 📢 Marketing Improvements

* Introduce promotions during low-sales periods
* Bundle popular and underperforming products

### 🚀 Growth Strategy

* Focus on top-performing products
* Use forecasting to anticipate demand

## 🛠️ Tools Used

### Data Processing & Analysis

* SQL
* Databricks

### Data Visualization

* Microsoft Excel
* Power BI

### Planning & Presentation

* Drawio
* Microsoft PowerPoint
* Canva

## 📌 Summary

This project demonstrates how raw transactional data can be transformed into actionable business insights.

By applying data cleaning, SQL analysis, and visualization techniques, the study identified:

* Key revenue-driving products
* Peak sales periods
* Performance gaps across stores and time

The final recommendations provide a clear path to:
✔ Increase revenue
✔ Improve operational efficiency
✔ Enable data-driven decision-making


## 🔮 Future Improvements

* Build sales forecasting models
* Implement real-time dashboards
* Develop customer segmentation strategies
* Automate reporting pipelines


💡 *This project reflects real-world data analytics workflows and showcases the ability to turn data into strategic business decisions.*
