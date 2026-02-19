# 📊 E-Commerce Business Intelligence: Investor Strategic Insights

## 🌟 Executive Summary
This project simulates the role of a **Data Analyst** at *Berlian Commerce*, a fashion e-commerce platform. Following a major acquisition, the lead investor required a comprehensive data-driven report to evaluate business health, operational scalability, and customer lifetime value (LTV).

The analysis leverages **Advanced SQL** to transform raw transactional data into actionable executive insights, covering performance metrics from 2021 to 2024.

---

## 🛠️ Tech Stack & Technical Proficiencies
* **Database Engine:** PostgreSQL
* **Core SQL Skills Demonstrated:**
    * **Complex Multi-Table Joins:** Connecting `Orders`, `Users`, `Products`, and `Order_Items`.
    * **Data Aggregation:** Transforming granular timestamps into daily, monthly, and yearly trends.
    * **Conditional Logic (CASE/WHERE):** Isolating 'Complete' transactions from 'Cancelled' or 'Returned' status.
    * **Logistics SLA Analysis:** Calculating time-deltas between order milestones (Created vs. Shipped vs. Delivered).
    * **Financial Modeling:** Calculating Gross Profit and Net Revenue (10% Margin) using calculated fields.

---

## 📈 Key Business Questions & Strategic Insights

### 1. Growth & Seasonality Tracking
* **Transaction Velocity:** Analyzed daily transaction volume since inception to track company scaling.
* **Peak Performance (2021-2023):** Identified the Top 5 months with the highest order volume to assist in inventory planning for future seasonal peaks.

### 2. High-Value Customer Profiling (LTV)
* **Top 30 Platinum Customers (2023):** Identified the highest-spending users based on total expenditure and item count (excluding returns/cancellations).
* **Insight:** Provided a targeted list for the marketing team’s VIP loyalty program.

### 3. Operational Efficiency & Logistics SLA
Conducted a deep dive into **H1 2024** logistics data for 'Complete' orders:
* **Lead Time:** Average duration from order creation to shipping.
* **Shipping Duration:** Average transit time from warehouse to customer.
> *This metric ensures the company meets its Service Level Agreements (SLA) as it scales.*

### 4. Financial Health & Brand Dominance
* **Net Revenue Analysis:** Calculated yearly net income derived from the 10% profit margin of gross sales.
* **Brand Authority:** Identified the Top-performing brand in the Women's category during the December 2023 peak.

---

## 📂 Project Structure
* `/queries`: Contains `.sql` files for each business case.
* `/data_dictionary`: Explanation of the 4-table relational schema.
* `/results`: Visual screenshots of the query outputs.

---

## 🚀 Featured Technical Implementation
*Example: Annual Profitability & Order Volume Query*

```sql
SELECT EXTRACT (YEAR from o.created_at) AS tahun,
  SUM ((p.retail_price - p.cost) * o.num_of_item) AS total_profit_kotor,
  SUM ((p.retail_price - p.cost)* 0.10) AS total_pendapatan_bersih,
  COUNT (DISTINCT o.order_id) AS total_pemesanan,
  COUNT (oi.id) AS total_item_terjual
FROM orders o
JOIN order_items oi
  ON o.order_id = oi.order_id
JOIN products p
  ON p.id = oi.product_id
WHERE o.status = 'Complete'
GROUP BY tahun
ORDER BY tahun ASC;
