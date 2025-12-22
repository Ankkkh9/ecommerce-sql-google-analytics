# ecommerce-sql-google-analytics
E-commerce analytics project using SQL to analyze Google Analytics data, focusing on user behavior, traffic quality, revenue, and conversion funnel.
# E-commerce Analytics Project (SQL)

## 📌 Project Overview
This project focuses on analyzing e-commerce user behavior and performance using SQL on Google Analytics data.  
The goal is to answer key business questions related to traffic quality, user engagement, revenue, and conversion funnel.

Dataset:
- Google BigQuery Public Dataset: `google_analytics_sample`
- Time period: Jan – Jul 2017

Tools:
- Google BigQuery (Standard SQL)

---

## 🎯 Business Objectives
- Understand overall e-commerce performance
- Identify high-quality traffic sources
- Compare behavior between purchasers and non-purchasers
- Analyze revenue drivers and cross-selling opportunities
- Evaluate conversion funnel performance

---

## 📊 Business Questions & Analysis

### 1️⃣ E-commerce Performance Overview (Jan–Mar 2017)
**Question:**  
How do visits, pageviews, and transactions change over time?

**KPIs:**
- Total Visits
- Total Pageviews
- Total Transactions

📂 SQL: `query_01_overview.sql`

---

### 2️⃣ Traffic Quality Analysis – Bounce Rate (July 2017)
**Question:**  
Which traffic sources drive the most visits and how engaged are users from each source?

**Metric:**
- Bounce Rate = Total Bounces / Total Visits

📂 SQL: `query_02_bounce_rate.sql`

---

### 3️⃣ Revenue Analysis by Traffic Source (June 2017)
**Question:**  
How does revenue vary by traffic source across weeks and months?

📂 SQL: `query_03_revenue_time.sql`

---

### 4️⃣ User Behavior Analysis – Purchasers vs Non-Purchasers (Jun–Jul 2017)
**Question:**  
Do purchasers view more pages than non-purchasers?

**Metric:**
- Average Pageviews per User

📂 SQL: `query_04_pageview_by_user_type.sql`

---

### 5️⃣ Purchase Frequency Analysis (July 2017)
**Question:**  
How many transactions does a purchasing user make on average?

📂 SQL: `query_05_avg_transaction.sql`

---

### 6️⃣ Monetization Efficiency – Average Spend per Session (July 2017)
**Question:**  
How much revenue does each visit generate from purchasers?

📂 SQL: `query_06_avg_spend.sql`

---

### 7️⃣ Cross-Selling Analysis
**Question:**  
What other products are purchased by customers who bought  
**"YouTube Men's Vintage Henley"**?

📂 SQL: `query_07_cross_sell.sql`

---

### 8️⃣ Conversion Funnel & Cohort Analysis (Jan–Mar 2017)
**Question:**  
How do users move through the funnel from product view → add to cart → purchase?

**Metrics:**
- Add-to-Cart Rate
- Purchase Rate

📂 SQL: `query_08_funnel_cohort.sql`

---

## 🔍 Key Insights (Example)
- Traffic sources with high visit volume do not always generate high revenue
- Purchasers show significantly higher engagement than non-purchasers
- Major drop-off occurs between add-to-cart and purchase stages
- Cross-selling opportunities exist among fashion-related products

---

## ✅ Skills Demonstrated
- E-commerce metrics & funnel analysis
- Advanced SQL (CTEs, UNNEST, aggregations)
- Cohort and behavioral analysis
- Business-driven data storytelling

---

## 📊 Next Step
Insights from this analysis will be visualized in an interactive Power BI dashboard.
