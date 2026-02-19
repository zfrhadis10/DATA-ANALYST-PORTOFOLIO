# 🛒 Grocery Retail Analytics: Strategic Sales Monitoring Dashboard

## 🌟 Executive Summary
This project demonstrates an end-to-end data transformation workflow—moving from raw, unstructured grocery retail data to an **Executive-Level Sales Dashboard**. By acting as a business owner, I developed a suite of analytical tools in Microsoft Excel to identify growth opportunities, optimize discount strategies, and monitor operational efficiency.

---

## 🛠️ Technical Proficiencies & Workflow
This project follows a rigorous 4-day analytical lifecycle:

### Day 1 & 2: Data Engineering & Feature Building
* **Formula Architecture:** Developed complex logical structures using `SUMIFS`, `AVERAGEIFS`, and nested `IF` statements to calculate Grand Totals (Sales + Shipping).
* **Feature Engineering:** Created a custom **Disc Category** engine to bucketize "Discount Amount" into performance tiers (from *Very Low* to *All Out*).
* **Advanced Logic:** Implemented `MONTH()` and `DAY()` functions to identify and isolate **Double Date** promotional events (e.g., 11.11, 12.12).

### Day 3: Multi-Dimensional Aggregation
* **Pivot Table Mastery:** Summarized thousands of records into specific business views:
    * Shipping Fee averages by City.
    * Platform performance indexed by Order Status.
    * Customer Satisfaction correlation by Gender and Discount tier.

### Day 4: Data Visualization & UI/UX Dashboard
* **Dynamic Interactivity:** Built a fully responsive dashboard utilizing **Slicers** for real-time filtering (City & Gender).
* **Key Metrics (Scorecards):** Tracked $231M+ in Total Revenue, Total Orders (2,000), and Customer Satisfaction (Avg 2.98).
* **Business Storytelling:** Designed visual charts to answer complex questions regarding monthly trends and the impact of ratings on revenue.

---

## 📈 Strategic Business Insights
The dashboard was engineered to answer 6 critical business questions:
1. **Promotional Impact:** Analyzing revenue distribution between "Double Date" vs. "Normal Days."
2. **Platform Efficiency:** Identifying which platforms (Toko Biru, Toko Hijau, etc.) yield the highest shipping costs vs. preferred payment methods.
3. **Inventory Prioritization:** Mapping the **Top 10 Products by Revenue** (Susu Bubuk, Daging Ayam, etc.) to optimize supply chain focus.
4. **Time-Series Growth:** Visualizing the **Monthly Sales Trend** to identify seasonal peaks and troughs.
5. **Discount Elasticity:** Measuring how different "Discount Categories" directly influence the average units sold per order.
6. **Value Correlation:** Analyzing if higher **Customer Ratings** statistically lead to higher **Average Revenue** per transaction.

---
