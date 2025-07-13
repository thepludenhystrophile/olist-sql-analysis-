# Olist E-Commerce SQL Analysis

This project explores the Olist e-commerce dataset using SQL. It includes data modeling, business analysis, and insight generation through structured queries.  
The goal is to uncover patterns in customer behavior, seller performance, product sales, and delivery logistics.

---

## Dataset Information

Olist is a Brazilian online marketplace.  
The dataset contains detailed information on orders, customers, products, sellers, payments, and delivery logistics.

- **Source:** [Olist Brazilian E-commerce on Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- **Size:** 100k+ orders, 9 datasets
- **Time Span:** Orders placed between 2016 and 2018
- 
### Files Imported

| Table                   | Rows     | Key Columns                    |
|------------------------|----------|--------------------------------|
| customers              | 99,441   | customer_id, customer_unique_id |
| orders                 | 99,441   | order_id, customer_id         |
| order_items            | 112,650  | order_id, product_id, seller_id |
| products               | 3,129    | product_id, product_category_name |
| sellers                | 3,099    | seller_id                     |
| payments               | 103,886  | order_id, payment_type        |
| product_category_name  | 71       | product_category_name         |
| geolocation            | 1,000,163| geolocation_zip_code_prefix   |

---

## Project Objectives

- Database Setup & Modeling: Create MySQL tables and load CSV data.  
- Data Cleaning & Integration: Resolve duplicates, handle missing/invalid values, and join tables.
- Exploratory Analysis: Use SQL to explore sales, delivery performance, and customer behavior.  
- Business Insights: Answer key questions that drive marketing, logistics, and product decisions.  

## Business Questions

1. What is the average delivery time per customer state?  
2. Which product categories generate the most revenue?  
3. Who are the top 5 customers by total spend?  
4. Which sellers bring in the most revenue?  
5. Which states have the highest order volume and how fast are deliveries there?  
6. What product categories are most frequently purchased?  
7. What payment methods do customers prefer?

---

## SQL Queries

All analysis queries are stored in `sql/olist_analysis.sql`.  
Each query includes a brief comment describing its purpose and the business insight it delivers.

---

## Key Insights

### Slowest Deliveries in Northern States
Customers in Roraima (RR), Amapá (AP), and Amazonas (AM) experience the longest delivery times, averaging between 26 to 29 days. These delays suggest persistent logistical challenges in Brazil’s northern regions, likely due to distance from urban hubs and limited infrastructure.

### Top Revenue Categories
The **beleza_saude** category generated the highest revenue with 9,670 units sold and R$1.26M in total sales. Other leading categories include:
- **relogios_presentes**: 5,991 units, R$1.21M  
- **cama_mesa_banho**: 1,115 units, R$1.04M  
- **esporte_lazer**: 8,641 units, R$0.99M

Despite fewer units sold, categories like cama_mesa_banho and relogios_presentes earned high revenue through premium pricing.

### High-Value Customers
The top customer made a single purchase worth R$13,664. The next four spent between R$6.9K and R$7.5K across one or two orders each. These customers represent an opportunity for personalized offers or loyalty programs.

### Top Sellers by Revenue
The highest-grossing seller earned R$249.6K from 1,132 orders. The next four sellers generated between R$182K and R$240K, with order counts ranging from 336 to 1,806. This shows that both volume and pricing strategy contribute to seller performance.

### Customer States with High Orders and Fast Delivery
- **São Paulo (SP)**: 40,495 orders with an average delivery of 8.7 days
- **Rio de Janeiro (RJ)**: 12,353 orders, 15.2 days  
- **Minas Gerais (MG)**: 11,355 orders, 11.9 days  
- **Rio Grande do Sul (RS)**: 5,344 orders, 15.2 days  
- **Paraná (PR)**: 4,923 orders, 11.9 days  

São Paulo stands out for its combination of high order volume and fast delivery, reflecting strong supply chain efficiency.

###  Most Ordered Product Categories
1. **cama_mesa_banho** - 11,115 orders 
2. **beleza_saude** – 9,670  orders
3. **esporte_lazer** – 8,641 orders
4. **movies_decoracao** – 8,334 orders
5. **informatica_acessorios** – 7,827 orders
6. **utilidades_domesticas** – 6,964 orders 
7. **relogios_presentes** – 5,991 orders

These numbers suggest that consumers prioritize home essentials, personal care, and entertainment-related products.

### Customer Payment Preferences
- **Credit card**: 76,795 orders (73.9%)  
- **Boleto**: 19,784 (19.0%)  
- **Voucher**: 5,775 (5.6%)  
- **Debit card**: 1,529 (1.5%)  

This indicates that most customers rely on credit-based payments, which can inform future marketing, promotions, or installment strategies.

## Conclusion

This SQL analysis of the Olist dataset reveals clear patterns in customer behavior, product performance, and logistical dynamics across Brazil:

- Delivery inefficiencies are most pronounced in northern states like Roraima and Amapá, indicating the need for improved infrastructure or regional fulfillment strategies.
- High-value categories and customers drive a significant portion of revenue, showing opportunities for personalized marketing and retention efforts.
- São Paulo leads in both order volume and delivery efficiency, making it a benchmark for supply chain performance in other states.
- Consumer preferences lean heavily toward credit card payments and essential or lifestyle-related products.
