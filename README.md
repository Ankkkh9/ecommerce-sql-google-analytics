# E-commerce Analytics Project using SQL

## 📌 Project Overview
This project analyzes e-commerce user behavior and performance using SQL on Google Analytics data.  
The objective is to answer key business questions related to traffic quality, user engagement, revenue performance, and conversion funnel efficiency.

**Dataset**
- Google BigQuery Public Dataset: `google_analytics_sample`
- Time period: January – July 2017

**Tools**
- Google BigQuery (Standard SQL)

---

## 🎯 Business Objectives
- Understand overall e-commerce performance trends
- Evaluate traffic quality across acquisition channels
- Compare behavior between purchasers and non-purchasers
- Identify revenue-driving traffic sources
- Analyze conversion funnel performance and drop-offs
- Discover cross-selling opportunities

---

## 📊 Business Questions, Results & Insights

---

### 1️⃣ E-commerce Performance Overview (Jan–Mar 2017)

**Business Question**  
How do visits, pageviews, and transactions change over time?

**KPIs**
- Total Visits
- Total Pageviews
- Total Transactions

📂 SQL: [query_01_overview.sql](sql/query_01_overview.sql)

**Results**
- Visits slightly decreased from **64,694 (Jan)** to **62,192 (Feb)**, then increased sharply to **69,931 (Mar)**.
- Pageviews showed a strong upward trend, peaking at **259,522** in March.
- Transactions increased from **713** in January to **993** in March (**+39%**).

**Insights**
- Conversion performance improved faster than traffic growth.
- Increasing transactions despite fluctuating visits suggests improved traffic quality or on-site experience.
- March represents a strong growth period suitable for scaling campaigns or inventory.

---

### 2️⃣ Traffic Quality Analysis –
