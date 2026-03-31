# ☕ Bright Coffee Shop Sales Analysis


## Overview of the Case Study

This project presents an end-to-end analysis of six months of transactional data from Bright Coffee Shop across three store locations.
The objective is to support a newly appointed CEO by uncovering **data-driven insights** on sales performance, customer behavior, and product effectiveness to drive revenue growth and operational efficiency.


## Project Objectives

The analysis aims to answer key business questions:

* Which products generate the most revenue
* When (time of day/week/month) sales peak
* How customer spending behavior impacts revenue (AOV)
* Which stores and product categories perform best
* Where opportunities exist to improve sales performance

---

## ⚙️ **How the Case Study Was Conducted**

### **1. Data Ingestion & Setup**

* Imported raw CSV data into **Databricks (Lakehouse environment)**
* Structured transactional dataset including:

  * Date & time
  * Product details
  * Store information
  * Quantity and pricing

---

### **2. Data Cleaning & Quality Checks**

* Performed **null value validation**
* Checked and handled **duplicate records**
* Ensured **data consistency and correct data types**
* Removed anomalies and inconsistencies

---

### **3. Feature Engineering**

Created analytical features to enhance insights:

* **Time-based features:**

  * Day name, Month, Quarter
  * Time buckets (Morning, Afternoon, Evening)
  * Month patterns (Beginning, Mid, End)
  * Seasonal grouping (SA weather)

* **Business metrics:**

  * Revenue (`transaction_qty × unit_price`)
  * Average Order Value (AOV)
  * Spending categories (Low, Medium, High)

---

### **4. Exploratory Data Analysis (EDA)**

Used SQL to perform:

* Revenue analysis by product, category, and store
* Time-based trend analysis (daily, monthly, seasonal)
* Customer spending behavior analysis (AOV segmentation)
* Store performance comparison

---

### **5. Data Visualization & Reporting**

* Built dashboards using:

  * **Power BI**
  * **Microsoft Excel**
* Visualized:

  * Revenue trends
  * Peak sales periods
  * Product performance
  * Customer segments

---

## 🔍 **Key Insights**

### 💰 **Spending Behavior Insights**

* **Low-spend customers dominate total revenue**, contributing the highest overall sales value

* However, they have a **low AOV**, indicating a high volume of small transactions

* **High-spend segment shows very high AOV but extremely low volume**, suggesting:

  * Customers are not purchasing premium-priced products frequently
  * Possible **pricing inconsistencies or duplicate product offerings**

* **Medium-spend segment contributes the least**, indicating:

  * Weak product positioning
  * Customers prefer either low-cost or premium options

---

### ⏰ **Time-Based Insights**

* Sales peak during **morning hours**, indicating strong demand during rush periods
* Evenings show **lower performance**, presenting opportunities for improvement

---

### 📈 **Sales Trends**

* Revenue varies across **days and months**, showing clear patterns
* Sales are influenced by **seasonality and customer behavior cycles**

---

### 🏪 **Store Performance**

* Certain store locations outperform others
* Suggests differences in **customer demand, location, or operations**


### ☕ **Product Performance**

* A small number of products generate the majority of revenue (**Pareto principle**)
* Some products underperform despite being similarly priced or positioned


## Recommendations

### Increase Average Order Value (AOV)

* Introduce **bundles and upselling strategies**
* Example: Coffee + pastry combo deals


### Optimize Pricing & Product Positioning
* Standardize pricing for similar products
* Clearly differentiate **premium vs standard products**


### Improve Medium & Low-Performing Segments

* Repackage or promote underperforming products
* Use discounts and bundles to increase demand


### Optimize Operations

* Increase staffing during **morning peak hours**
* Introduce promotions during **low-demand periods (evenings)**


### Inventory Optimization

* Increase stock for high-demand products
* Reduce inventory for slow-moving items


## Tools Used

### Data Processing & Analysis

* SQL
* Databricks

### Data Visualization

* Microsoft Excel
* Power BI

### Planning & Presentation

* Draw.io (Data flow diagrams)
* Microsoft PowerPoint
* Canva




