# Madrid Airbnb Market Analysis using SQL & Python

## Project Overview

This project explores the Madrid Airbnb market using **PostgreSQL**, **SQL**, and **Python**. The objective was to answer business-oriented questions through SQL analysis and communicate the findings through clear and informative visualizations.

The project follows an end-to-end data analytics workflow commonly used in industry, from data cleaning and database management to business analysis and data storytelling.

---

## Dataset

The dataset used in this project was obtained from **Inside Airbnb**.

**Source:** https://insideairbnb.com/get-the-data/

The original dataset was cleaned using Python, and the analysis was performed on the cleaned dataset:

- `listings_cleaned.csv`

The dataset contains approximately **25,000 Airbnb listings in Madrid**, including information on:

- Listing details
- Host information
- Room types
- Prices
- Reviews
- Availability
- Geographic location

---

## Project Workflow

```text
Raw Dataset
        ↓
Python Data Cleaning
        ↓
listings_cleaned.csv
        ↓
PostgreSQL Database
        ↓
SQL Business Analysis
        ↓
Python Visualizations
        ↓
Business Insights
```

---

## Tools & Technologies

| Tool | Purpose |
|------|---------|
| PostgreSQL | Database Management |
| SQL | Business Analysis |
| Python | Data Analysis |
| Pandas | Data Manipulation |
| SQLAlchemy | Database Connection |
| Matplotlib | Data Visualization |
| Jupyter Notebook | Analysis Workflow |

---

## Project Structure

```text
madrid-airbnb-market-analysis/

├── data/
│   └── listings_cleaned.csv
│
├── notebooks/
│   ├── 01_data_cleaning.ipynb
│   └── 02_visualizations.ipynb
│
├── sql/
│   ├── setup.sql
│   └── analysis.sql
│
├── visuals/
│   ├── listings_by_room_type.png
│   ├── top10_neighbourhoods.png
│   ├── average_price_room_type.png
│   ├── most_expensive_neighbourhoods.png
│   ├── least_expensive_neighbourhoods.png
│   ├── top_hosts.png
│   ├── highest_average_price_hosts.png
│   ├── average_reviews_room_type.png
│   └── availability_room_type.png
│
└── README.md
```

---

## Business Questions

This project answers twenty business questions using SQL, including:

- How many Airbnb listings are available in Madrid?
- Which room type is the most common?
- Which neighbourhoods have the highest number of listings?
- Which neighbourhoods have the highest and lowest average prices?
- Which hosts manage the largest number of listings?
- Which hosts charge the highest average nightly price?
- Which room type receives the most reviews?
- Which room type has the highest annual availability?

---

## Key Findings

- Entire homes/apartments dominate Madrid's Airbnb market, representing the largest share of available listings.
- Airbnb listings are concentrated in a relatively small number of central neighbourhoods, particularly Embajadores and Universidad.
- Nightly prices vary substantially across neighbourhoods, highlighting significant geographic differences in the short-term rental market.
- Several hosts manage hundreds of listings, suggesting the presence of professional or commercial operators alongside individual hosts.
- Accommodation type strongly influences pricing, review activity, and annual availability.

---

## Skills Demonstrated

- SQL Querying
- PostgreSQL Database Management
- Python Programming
- Data Cleaning
- Exploratory Data Analysis (EDA)
- Data Visualization
- Business Analytics
- Data Storytelling

---

## Future Improvements

Potential extensions of this project include:

- Building an interactive Tableau or Power BI dashboard
- Developing a machine learning model to predict Airbnb prices
- Performing geospatial analysis using listing coordinates
- Investigating pricing outliers in greater detail
- Analyzing seasonal booking trends

---

## Author

**Taku Takahashi**

- GitHub: *(https://github.com/Taku30)*
- LinkedIn: *(https://www.linkedin.com/in/taku-takahashi/)*
