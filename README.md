# E-commerce Business Analytics Project (SQL)

## 📌 Project Overview
This project analyzes **e-commerce performance and user behavior** using SQL on the **Google Analytics public dataset**.  
The goal is to uncover **traffic quality, engagement patterns, revenue drivers, repeat purchase behavior, and conversion funnel efficiency** to support data-driven business decisions.

**Dataset**
- Google Analytics Sample Dataset (BigQuery Public)
- Time period: **January – July 2017**

**Tools**
- Google BigQuery (Standard SQL)

---

## 🎯 Business Objectives
- Evaluate overall e-commerce performance and conversion efficiency  
- Identify high-intent traffic sources and revenue drivers  
- Compare engagement between purchasers and non-purchasers  
- Analyze repeat purchase behavior and monetization efficiency  
- Identify funnel bottlenecks and cross-selling opportunities  

---

## 📊 Business Questions & Key Insights

---

### 1️⃣ Overall E-commerce Performance

**📂 SQL Code**
-- Query 01: Calculate total visits, pageviews, and transactions
-- Time period: January – March 2017

-- Step 1: Generate month in YYYYMM format
WITH raw_1_3 AS (
    SELECT
        *,
        FORMAT_DATE('%Y%m', PARSE_DATE('%Y%m%d', date)) AS month
    FROM `bigquery-public-data.google_analytics_sample.ga_sessions_2017*`
    WHERE _table_suffix BETWEEN '0101' AND '0331'
)

-- Step 2: Aggregate visits, pageviews, and transactions by month
SELECT
    month,
    SUM(totals.visits) AS visits,
    SUM(totals.pageviews) AS pageviews,
    SUM(totals.transactions) AS transactions
FROM raw_1_3
GROUP BY month
ORDER BY month;

**Results**


**Insight**
- Transactions grew faster than visits, indicating **improving conversion efficiency**.
- March shows a strong performance uplift, suggesting a suitable period for scaling campaigns or inventory.

---

### 2️⃣ Traffic Quality by Source

📂 SQL: `query_02_bounce_rate.sql`

**Insight**
- **High-intent channels (Direct, Email)** show lower bounce rates and stronger engagement.
- High-volume social traffic exhibits weak engagement, highlighting optimization opportunities.
- Traffic quality is more important than raw traffic volume.

---

### 3️⃣ Revenue Drivers by Traffic Source

📂 SQL: `query_03_revenue_time.sql`

**Insight**
- **Direct traffic generates the highest revenue**, reflecting strong returning-user intent.
- Search traffic drives volume but monetizes less efficiently.
- Weekly analysis reveals campaign-driven revenue spikes.

---

### 4️⃣ Engagement Behavior: Purchasers vs Non-Purchasers

📂 SQL: `query_04_pageview_by_user_type.sql`

**Insight**
- Purchasers consistently demonstrate **much deeper engagement** than non-purchasers.
- Pageview depth is a strong leading indicator of purchase intent.
- Improving content discovery and internal linking can support conversion growth.

---

### 5️⃣ Purchase Frequency Analysis

📂 SQL: `query_05_avg_transaction.sql`

**Insight**
- Purchasing users complete multiple transactions on average.
- Indicates strong repeat purchase behavior and **high customer lifetime value (CLV) potential**.

---

### 6️⃣ Monetization Efficiency per Session

📂 SQL: `query_06_avg_spend.sql`

**Insight**
- Revenue per visit is a critical KPI for evaluating funnel efficiency.
- Improvements in conversion rate or average order value directly impact revenue performance.

---

### 7️⃣ Cross-Selling Opportunities

📂 SQL: `query_07_cross_sell.sql`

**Insight**
- Customers who purchase core apparel items frequently buy related accessories.
- Clear opportunities exist for **bundling and recommendation strategies** to increase AOV.

---

### 8️⃣ Conversion Funnel Performance

📂 SQL: `query_08_funnel_cohort.sql`

**Insight**
- Funnel efficiency improved steadily over time.
- The largest drop-off occurs after add-to-cart, but shows consistent improvement.
- UX, pricing, or promotional changes likely contributed to higher conversion rates.

---

## 🔑 Key Takeaways
- Conversion efficiency improved faster than traffic growth.
- **High-intent traffic sources** drive disproportionate revenue.
- Engagement depth strongly correlates with purchase behavior.
- Repeat purchases and cross-selling present high-ROI growth opportunities.
- Funnel optimization offers meaningful upside without increasing traffic spend.

---

## 🚀 Next Steps
- Build an interactive Power BI dashboard for performance monitoring  
- Segment users by value and behavior for deeper analysis  
- Extend analysis to customer lifetime value (CLV) and retention modeling  
