# ☕ Bright Coffee Shop Sales Analysis


### Overview of the Case Study

This project presents an end-to-end analysis of six months of transactional data from Bright Coffee Shop across three store locations.
The objective is to support a newly appointed CEO by uncovering **data-driven insights** on sales performance, customer behavior, and product effectiveness to drive revenue growth and operational efficiency.


### Project Objectives

The analysis aims to answer key business questions:

* Which products generate the most revenue
* When (time of day/week/month) sales peak
* How customer spending behavior impacts revenue (AOV)
* Which stores and product categories perform best
* Where opportunities exist to improve sales performance


### How the Case Study Was Conducted

#### 1. Data Ingestion & Setup

* Imported raw CSV data into **Databricks (Lakehouse environment)**
* Structured transactional dataset including:

  * Date & time
  * Product details
  * Store information
  * Quantity and pricing


#### 2. Data Cleaning & Quality Checks

* Performed **null value validation**
* Checked and handled **duplicate records**
* Ensured **data consistency and correct data types**
* Removed anomalies and inconsistencies


### **3. Feature Engineering**

Created analytical features to enhance insights:

* **Time-based features:**

  * Day name, Month, Quarter
  * Time buckets (Morning, Afternoon, Evening)
  * Month patterns (Beginning, Mid, End)
  * Seasonal grouping (SA weather)
  * Day Category(Weekend and Weekday)

* **Business metrics:**

  * Revenue (`transaction_qty × unit_price`)
  * Average Order Value (AOV)
  * Spending categories (Low, Medium, High)


#### 4. Exploratory Data Analysis (EDA)

Used SQL to perform:

* To Understand the data set( MIN & MAX unit_price, product categories, 
* Revenue analysis by product, category, and store
* Time-based trend analysis (daily, monthly, seasonal)
* Customer spending behavior analysis (such as AOV segmentation)
* Store performance comparison. 


### 5. Data Visualization & Reporting
  * Microsoft Excel Using Pivot Tables & Charts
    
* Visualized: 

  * Revenue trends
  * Peak sales periods
  * Product performance
  * Customer segments
  * Store Perfomance
  * Monthly, Quarterly, weekly performance per store, product type, product category


#### Key Insights

#### Spending Behavior Insights

* Low-spend customers dominate total revenue, contributing the highest overall sales value
* However, they have a low AOV, indicating a high volume of small transactions
* High-spend segment shows very high AOV but extremely low volume, suggesting: Customers are not purchasing premium-priced products frequently. Possible pricing inconsistencies or duplicate product offerings.
* Medium-spend segment contributes the least, indicating:

  * Weak product positioning
  * Customers prefer either low-cost or premium options


#### Time-Based Insights

* Sales peak during morning hours, indicating strong demand during rush periods
* Evenings show lower performance, presenting opportunities for improvement


#### Sales Trends

* Revenue varies across days and months, showing clear patterns.
* Sales are influenced by seasonality and customer behavior cycles.

#### Store Performance

*  Hell's Kitchen store location outperform others and Lower Manhattan was the least performing store.
* Suggests differences in customer demand, location, or operations


#### Product Performance

* Barista expresso, hot chocolate and brewed Chai Te were top 3 best perfoming products.
* Green Tea, Green Beans and organic chocolate chocolate were the bottom 3, least performing products.
* Some products underperform despite being similarly priced or positioned


#### Tools Used

#### Data Processing & Analysis

* SQL
* Databricks

#### Data Visualization

* Microsoft Excel
* Power BI

#### Planning & Presentation

* Draw.io (Data flow diagrams)
* Microsoft PowerPoint
* Canva




