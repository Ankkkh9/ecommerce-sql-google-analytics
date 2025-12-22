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

### 2️⃣ Traffic Quality Analysis – Bounce Rate (July 2017)

**Business Question**  
Which traffic sources drive the most visits and how engaged are users from each source?

**Metric**
- Bounce Rate = Total Bounces / Total Visits

📂 SQL: [query_02_bounce_rate.sql](sql/query_02_bounce_rate.sql)

**Results**
- **Google** generated the highest traffic volume (**38,400 visits**) with a bounce rate of **51.6%**.
- **Direct traffic** showed stronger engagement with a lower bounce rate (**43.3%**).
- Some sources had very high bounce rates:
  - `l.facebook.com`: **88.2%**
  - `youtube.com`: **66.7%**
- High-quality, low-bounce sources included:
  - `mail.google.com`: **24.8%**
  - `reddit.com`: **28.6%**

**Insights**
- Traffic volume does not equal traffic quality.
- Direct and email traffic represent high-intent users.
- Social traffic requires landing page and targeting optimization.
- Bounce rate is a critical metric for marketing budget allocation.

---

### 3️⃣ Revenue Analysis by Traffic Source (June 2017)

**Business Question**  
How does revenue vary by traffic source across weekly and monthly views?

📂 SQL: [query_03_revenue_time.sql](sql/query_03_revenue_time.sql)

**Results**
- **Direct traffic** generated the highest revenue:
  - Monthly revenue: **97,333**
- **Google** ranked second with **18,757** in monthly revenue.
- Revenue fluctuated significantly on a weekly basis.

**Insights**
- Returning users (direct traffic) have the highest purchase intent.
- SEO and search traffic drive volume but are not the strongest monetization channel.
- Weekly analysis helps identify campaign-driven revenue spikes.

---

### 4️⃣ Purchasers vs Non-Purchasers – Pageview Behavior (Jun–Jul 2017)

**Business Question**  
Do purchasers view more pages than non-purchasers?

📂 SQL: [query_04_pageview_by_user_type.sql](sql/query_04_pageview_by_user_type.sql)

**Results**
- Purchasers showed significantly higher engagement:
  - June: **94.0 vs 316.9 pageviews**
  - July: **124.2 vs 334.1 pageviews**
- Engagement increased for both groups in July.

**Insights**
- Higher engagement strongly correlates with purchase behavior.
- Pageviews can act as an early indicator of purchase intent.
- Product recommendations and internal linking can help increase conversion.

---

### 5️⃣ Purchase Frequency Analysis (July 2017)

**Business Question**  
How many transactions does a purchasing user make on average?

📂 SQL: [query_05_avg_transaction.sql](sql/query_05_avg_transaction.sql)

**Results**
- Average transactions per purchasing user: **4.16**

**Insights**
- Clear evidence of repeat purchase behavior.
- Strong foundation for loyalty programs and remarketing strategies.
- Indicates high potential customer lifetime value (CLV).

---

### 6️⃣ Monetization Efficiency – Average Spend per Session (July 2017)

**Business Question**  
How much revenue does each visit generate from purchasers?

📂 SQL: [query_06_avg_spend.sql](sql/query_06_avg_spend.sql)

**Results**
- Average revenue per visit: **43.86 USD**

**Insights**
- Revenue per visit is a strong KPI for funnel efficiency.
- Increasing conversion rate or AOV directly improves monetization.
- Useful for evaluating campaign ROI beyond traffic metrics.

---

### 7️⃣ Cross-Selling Analysis  
*(YouTube Men's Vintage Henley)*

**Business Question**  
What other products are purchased by customers who bought *YouTube Men's Vintage Henley*?

📂 SQL: [query_07_cross_sell.sql](sql/query_07_cross_sell.sql)

**Results**
- Frequently co-purchased products include:
  - **Google Sunglasses (20 units)**
  - **Google Women’s Vintage Hero Tee (7 units)**
  - **SPF-15 Lip Balm (6 units)**
  - Other fashion and accessory items

**Insights**
- Strong cross-selling patterns within fashion and accessory categories.
- Opportunities for product bundling and “Frequently Bought Together” recommendations.
- Cross-selling can increase AOV without additional traffic spend.

---

### 8️⃣ Conversion Funnel & Cohort Analysis (Jan–Mar 2017)

**Business Question**  
How do users move through the funnel from product view → add to cart → purchase?

📂 SQL: [query_08_funnel_cohort.sql](sql/query_08_funnel_cohort.sql)

**Results**

| Month | Add-to-Cart Rate | Purchase Rate |
|------|------------------|---------------|
| Jan  | 28.47%           | 8.31%         |
| Feb  | 34.25%           | 9.59%         |
| Mar  | 37.29%           | 12.64%        |

- Conversion rates improved consistently over time.

**Insights**
- Funnel performance improved significantly, especially at the purchase stage.
- The main bottleneck occurs after add-to-cart, but shows clear improvement.
- UX, pricing, or promotional changes likely contributed to higher conversion efficiency.

---

## 🔑 Overall Business Takeaways
- Conversion efficiency improved faster than traffic growth.
- High-intent traffic (Direct, Email) drives disproportionate revenue.
- Engagement depth strongly correlates with purchase behavior.
- Funnel optimization and cross-selling provide high-ROI growth opportunities.

---

## 🚀 Next Steps
- Visualize insights in an interactive Power BI dashboard
- Segment users by behavior and value for advanced analysis
- Extend analysis to customer lifetime value (CLV)
