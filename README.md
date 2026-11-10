
# Uber Trip Analytics
### Analyzing Urban Mobility, Demand Patterns & Operational Performance

An end-to-end **Data Analytics project** using Python, MySQL, and Power BI to analyze Uber trip data and identify demand patterns, popular locations, revenue trends, vehicle usage, and payment preferences.

## Project Overview

Ride-hailing platforms generate large amounts of trip data. Analyzing this data helps understand when trips happen, where demand is concentrated, which routes are frequently travelled, and how fares vary.

This project transforms raw trip records into meaningful business insights using Python, SQL, and Power BI.

## Business Objectives

- Analyze trip demand by day and hour.
- Identify the most popular pickup and drop-off locations.
- Discover frequently travelled routes.
- Compare vehicle types based on trip volume and revenue.
- Analyze payment methods and fare revenue.
- Examine surge fees and the relationship between trip distance and fare.
- Build an interactive Power BI dashboard.

## Tools & Technologies

| Tool | Purpose |
|---|---|
| Python | Data cleaning and preprocessing |
| Pandas | Data manipulation and integration |
| Google Colab | Python development |
| MySQL | SQL analysis and querying |
| Power BI | Dashboard development and visualization |

## Dataset Description

The project uses two datasets:

**1. Uber Trip Details**
- Trip ID
- Pickup Time
- Drop Off Time
- Passenger Count
- Trip Distance
- Pickup and Drop-off Location IDs
- Fare Amount
- Surge Fee
- Vehicle
- Payment Type

**2. Location Table**
- Location ID
- Location Name
- City

The location table was joined with the trip dataset using pickup and drop-off location IDs to obtain readable location names and city details.

The cleaned dataset contains approximately **102,616 trip records**. 

## Project Workflow

1. Data inspection using Python.
2. Data cleaning and validation using Pandas.
3. Trip duration calculation.
4. Location data cleaning and integration.
5. Exporting the cleaned dataset.
6. Importing data into MySQL.
7. SQL-based business analysis.
8. KPI creation and dashboard development in Power BI.
9. Insights and business recommendations.

## SQL Analysis

The project investigates 16 business questions:

1. Which day of the week has the highest trip demand?
2. Which pickup hour has the highest number of trips?
3. Which day generates the highest fare revenue?
4. What are the top 10 pickup locations?
5. What are the top 10 drop-off locations?
6. Which routes are most frequently travelled?
7. Which pickup locations generate the highest fare revenue?
8. Which vehicle type has the highest number of trips?
9. Which vehicle type generates the highest revenue?
10. Which vehicle type has the highest average fare?
11. Which vehicle type has the longest average trip duration?
12. Which payment method is most commonly used?
13. Which pickup hour has the highest average surge fee?
14. How does trip distance relate to average fare?
15. Which pickup locations experience the highest demand during peak hours?
16. Which payment method generates the highest fare revenue?

## Power BI Dashboard

### Key Performance Indicators (KPIs)

- Total Trips
- Total Revenue
- Average Fare
- Total Distance
- Average Trip Distance
- Average Trip Duration
- Total Surge Fees
- Average Passengers

### Dashboard Visualizations

- Trips by Day of Week
- Trips by Hour
- Revenue by Day of Week
- Top 10 Pickup Locations
- Top 10 Drop-off Locations
- Most Frequently Travelled Routes
- Trip Distribution by Vehicle Type
- Payment Method Distribution

### Interactive Filters

- Trip Date
- Vehicle
- Payment Type
- Pickup City

## Dashboard Screenshots

### Overall Dashboard
![Uber Trip Analytics Dashboard](screenshots/uber-dashboard.png)




## Business Recommendations

- Use demand patterns to improve driver allocation during busy periods.
- Identify high-demand locations to review vehicle availability.
- Monitor frequently travelled routes for operational planning.
- Compare vehicle performance to support fleet planning.
- Understand payment preferences to improve payment services.
- Monitor surge-fee patterns alongside trip demand.

## Project Structure

```text
Uber-Trip-Analytics/
│
├── notebooks/
│   └── uber_trip_analysis.ipynb
│
├── sql/
│   └── uber_trip_analysis.sql
│
├── powerbi/
│   └── Uber_Trip_Analytics.pbix
│
├── screenshots/
│   ├── uber-dashboard.png
│   ├── demand-analysis.png
│   ├── location-routes.png
│   └── vehicle-payment.png
│
├── report/
│   └── Uber_Trip_Analytics_Business_Analysis_Report.docx
│
└── README.md
```

## Conclusion

This project demonstrates an end-to-end Data Analytics workflow using Python, MySQL, and Power BI. It transforms raw trip records into meaningful insights about urban mobility, demand patterns, fare trends, location activity, vehicle usage, and payment behaviour.

---

**Domain:** Data Analytics  
**Technologies:** Python | Pandas | MySQL | Power BI  
**Project:** Uber Trip Analytics
