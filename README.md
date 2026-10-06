# 🏨 Hotel Data Analytics

An end-to-end **Hotel Data Analytics project** focused on analyzing hotel bookings, revenue, guests, rooms, payments, and reviews using **SQL, Python, Excel, and Power BI**.

The project combines data analysis, database querying, visualization, data validation, and business insights to understand hotel performance and support data-driven decisions.

---

## 📌 Project Overview

This project analyzes hotel booking data to answer important business questions related to:

* Revenue and booking performance
* Monthly revenue trends
* Booking channels
* Cancellation rates
* Room type performance
* Guest behavior
* Payment methods
* Review ratings
* Guest countries
* High-value guests
* Data quality and validation
* Correlation between numerical variables

The project follows a complete analytics workflow from **database design and SQL analysis to Python exploration and Power BI visualization**.

---

## 🎯 Project Objectives

The main objectives of this project are:

* Analyze total revenue and booking performance.
* Identify monthly revenue trends.
* Find the highest-performing room types.
* Compare booking channels.
* Analyze cancellation rates.
* Identify top guests by total spending.
* Analyze guest countries.
* Examine payment methods and review ratings.
* Validate data quality using SQL.
* Analyze correlations between numerical variables.
* Build an interactive Power BI dashboard.
* Generate useful business insights and recommendations.

---

## 🛠️ Tools & Technologies

| Tool           | Purpose                                                    |
| -------------- | ---------------------------------------------------------- |
| **SQL Server** | Database creation, querying, analysis, and data validation |
| **Python**     | Data analysis and visualization                            |
| **Pandas**     | Data manipulation and analysis                             |
| **Matplotlib** | Data visualization                                         |
| **Seaborn**    | Statistical visualization and correlation heatmap          |
| **Excel**      | Data analysis and Pivot Tables                             |
| **Power BI**   | Interactive dashboard and business intelligence            |
| **GitHub**     | Project version control and documentation                  |

---

# 🔄 Project Workflow

The project was completed through the following workflow:

```text
Raw Data
   ↓
Database Design
   ↓
SQL Server
   ↓
Data Quality Checks
   ↓
Excel Analysis
   ↓
Python Analysis
   ↓
Power BI Dashboard
   ↓
Business Insights
   ↓
Recommendations
```

---

# 🗄️ Database Design

The project database contains **5 main tables**:

* `guests`
* `rooms`
* `bookings`
* `payments`
* `reviews`

### Main Structure

* `bookings` is the main fact table.
* `guests` and `rooms` act as dimension tables.
* `payments` and `reviews` are linked to bookings.

### Relationships

The database contains **4 main relationships**:

```text
Guests
   │
   └──────< Bookings >────── Rooms
                  │
                  ├──────< Payments
                  │
                  └──────< Reviews
```

### Database Size

| Table    | Records |
| -------- | ------: |
| Guests   |   5,000 |
| Bookings |  20,000 |
| Rooms    |     100 |
| Payments |  25,000 |
| Reviews  |  15,000 |

---

# 🧮 SQL Server Analysis

SQL Server was used for both **business analysis** and **data validation**.

## Analytical Queries

The SQL analysis includes:

1. Total booking value, total bookings, and average booking value
2. Monthly revenue trend
3. Top 5 room types by revenue
4. Revenue, bookings, and average booking value by booking channel
5. Cancellation rate by booking channel
6. Top 10 guests by total spending
7. Revenue and average booking value by room type
8. Top 10 countries by number of guests
9. High-value guests using a CTE
10. Monthly revenue growth using `LAG()`

## Data Quality Checks

The project also includes **11 SQL data quality checks**, including:

* Duplicate guest IDs
* NULL values
* Invalid booking dates
* Invalid number of nights
* Invalid booking dates
* Invalid review ratings
* Room capacity validation
* Orphan guest records
* Orphan room records
* Orphan payment records
* Orphan review records

---

# 🐍 Python Analysis

Python was used for exploratory data analysis and visualization.

The analysis was performed using:

* **Pandas**
* **Matplotlib**
* **Seaborn**
* **Google Colab**

## Python Analysis Areas

### Revenue Analysis

* Total booking value
* Average booking value
* Booking value by year
* Monthly booking value
* Highest booking-value month

### Booking Analysis

* Total bookings
* Monthly bookings
* Book

