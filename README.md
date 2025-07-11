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

- **Slowest Deliveries:** The states of Amazonas (AM), Alagoas (AL), Pará (PA), Maranhão (MA), and Sergipe (SE) average 26.4, 24.5, 23.7, 21.5, and 21.5 days to deliver respectively—highlighting clear regional logistics challenges.

- **Top Revenue Categories:**  
  - **beleza_saude** leads with 9,670 units sold and R$1.26 M in revenue  
  - **relogios_presentes** follows with 5,991 units and R$1.21 M  
  - **cama_mesa_banho** ranks third (1,115 units; R$1.04 M)  
  - **esporte_lazer** close behind (8,641 units; R$0.99 M)

- **High-Value Customers:**  
  - The top spender spent R$13,664 in a single order  
  - The second-highest spent R$7,572 across two orders  
  - Rounding out the top five, spenders between R$6.9 K and R$7.3 K

- **Top Sellers by Revenue:**  
  - The leading seller generated R$249,641 over 1,132 orders  
  - The next four each earned between R$182 K and R$240 K  
  - Order counts ranged from 336 to 1,806

- **Customer States & Speed:**  
  - São Paulo (SP) placed 40,495 orders with an average delivery of 8.7 days  
  - Rio de Janeiro (RJ) 12,353 orders at 15.2 days  
  - Minas Gerais (MG) 11,355 orders at 11.9 days  
  - Rio Grande do Sul (RS) 5,344 orders at 15.2 days  
  - Paraná (PR) 4,923 orders at 11.9 days

- **Most Popular Categories by Volume:**  
  - **cama_mesa_banho** (9,417 orders)  
  - **beleza_saude** (8,836 orders)  
  - **esporte_lazer** (7,720 orders)  
  - **informatica_acessorios** (6,689)  
  - **movies_decoracao** (6,449)  
  - **utilidades_domesticas** (5,884)

- **Payment Preferences:**  
  - **Credit card** dominates with 76,795 orders (73.9%)  
  - **Boleto** at 19,784 (19.0%)  
  - **Voucher** 5,775 (5.6%)  
  - **Debit card** 1,529 (1.5%)
