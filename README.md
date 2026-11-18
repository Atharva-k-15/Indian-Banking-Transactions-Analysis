# Indian Banking Transactions Analysis

## 1. Project Overview

This project focuses on analysing Indian banking transaction data to understand banking performance, explore customer transaction behaviour, evaluate transaction trends and examine potential risk indicators.

The project follows an end-to-end data analytics workflow using Python, MySQL, Microsoft Excel and Power BI. It combines exploratory data analysis, SQL-based business analysis and interactive dashboard development to transform transaction-level data into meaningful business insights.

The analysis covers transaction volume and value, customer activity, transaction types, banking channels, geographical performance, transaction outcomes and transactions marked with potential fraud indicators.

**Key Areas of Analysis:**

- Banking Performance & Customer Analytics
- Transaction Trends and Patterns
- Transaction Type and Channel Analysis
- State-wise Transaction Performance
- Transaction Status Analysis
- Fraud, Risk & Transaction Monitoring

## 2. Business Problem Statement

Banking institutions generate large volumes of transaction data through multiple banking channels and transaction types. Analysing this information can help improve visibility into transaction performance, understand customer activity and identify patterns that may require further investigation.

This project addresses the challenge of transforming raw banking transaction records into meaningful insights by examining transaction behaviour, banking channels, geographical patterns, transaction outcomes and records marked with potential fraud indicators.

The analysis aims to support data-driven discussions around banking performance, customer activity and transaction monitoring.

## 3. Project Objectives

The project has the following objectives:

**A. Banking Performance & Customer Analytics**

- Measure overall transaction volume and total transaction value.
- Calculate average transaction value and identify unique customers.
- Evaluate successful transactions and overall success rate.
- Analyse monthly transaction trends.
- Identify frequently used transaction types.
- Compare transaction activity across banking channels.
- Examine transaction distribution across Indian states.
- Explore customer and account-related transaction patterns.

**B. Fraud, Risk & Transaction Monitoring**

- Identify transactions marked with a fraud indicator.
- Calculate flagged transaction volume and flagged transaction rate.
- Analyse flagged transactions across transaction types and banking channels.
- Examine flagged transaction patterns across geographical regions and time periods.
- Investigate transaction status distributions among flagged records.
- Identify unusual patterns that may warrant further investigation.

## 4. Dataset Information

The project uses the **Indian Banking Transactions** dataset, containing transaction-level information related to banking activities, customers, accounts, banking channels and potential fraud indicators.

| Attribute           | Details                           |
| ------------------- | --------------------------------- |
| Dataset Name        | Indian Banking Transactions       |
| Total Records       | 550,000                           |
| Total Columns       | 20                                |
| File Format         | CSV                               |
| Unit of Observation | Individual Transaction            |
| Date Coverage       | 01 January 2019 – 01 January 2024 |
| Database            | indian_banking_db                 |
| SQL Table           | banking_transactions              |

**Key Dataset Features**

1. **Transaction Information:** Transaction ID, transaction date, transaction time, transaction amount, transaction direction, transaction type and transaction status.
2. **Customer & Account Information:** Customer ID, account type, account balance, credit score, loan availability, loan type, EMI amount and KYC status.
3. **Banking & Geographical Information:** Banking channel, merchant category and state.
4. **Fraud Indicator Information:** Fraud flag and transaction hour.

**Data Quality Assessment**

The dataset was inspected using Python and SQL to examine missing values, duplicate records, transaction IDs, invalid amounts and inconsistencies between related columns.

Detailed data-quality observations are documented in the Python notebook.

## 5. Tools & Technologies

| Tool / Technology | Purpose                                   |
| ----------------- | ----------------------------------------- |
| Python            | Data analysis and preparation             |
| Pandas            | Data manipulation and analysis            |
| NumPy             | Numerical operations                      |
| Matplotlib        | Data visualisation                        |
| Seaborn           | Statistical visualisation                 |
| Jupyter Notebook  | Python analysis environment               |
| MySQL             | Database management and querying          |
| MySQL Workbench   | SQL development and analysis              |
| SQL               | Business analysis and data retrieval      |
| Microsoft Excel   | Spreadsheet-based data handling           |
| Power BI          | Interactive dashboard development         |
| GitHub            | Project documentation and version control |

## 6. Project Workflow

The project follows a structured analytics workflow:

**1. Dataset Inspection & Preparation**

- Loaded the banking transactions dataset using Pandas.
- Examined dataset dimensions, column names and data types.
- Inspected transaction records and assessed data quality.

**2. Exploratory Data Analysis using Python**

- Analysed transaction volume and transaction amounts.
- Examined transaction types, customer activity and banking channels.
- Explored transaction trends and geographical distributions.
- Investigated transaction status and fraud-flag patterns.

**3. Database Integration**

- Imported the prepared dataset into MySQL.
- Created and used the `indian_banking_db` database.
- Stored transaction records in the `banking_transactions` table.

**4. SQL-Based Business Analysis**

- Developed and executed 60 SQL queries.
- Performed aggregations, filtering, grouping and sorting.
- Applied subqueries, CTEs and window functions.
- Analysed transaction performance and potential risk indicators.

**5. Power BI Dashboard Development**

- Designed two interactive dashboard pages.
- Presented banking performance and customer insights.
- Developed visualisations for fraud-flag and transaction monitoring.

## 7. Key Analytical Findings

The following figures are taken from the completed Power BI dashboards.

**A. Banking Performance & Customer Insights**

| Metric                   |         Result |
| ------------------------ | -------------: |
| Total Transactions       |        550,000 |
| Total Transaction Value  | ₹16.45 Billion |
| Unique Customers         |         79,916 |
| Successful Transactions  |        506,247 |
| Transaction Success Rate |         92.04% |

Additional analysis examines:

- Monthly transaction activity.
- State-wise transaction performance.
- Transaction type distribution.
- Banking channel usage patterns.

**B. Fraud, Risk & Transaction Monitoring**

| Metric                   |  Result |
| ------------------------ | ------: |
| Total Transactions       | 550,000 |
| Flagged Transactions     |   4,873 |
| Flagged Transaction Rate |   0.89% |
| Failed Transactions      |  21,905 |
| Failed Transaction Rate  |   3.98% |

Additional analysis examines:

- Channel-wise flagged transaction counts.
- Flagged transaction rates by transaction type.
- Monthly flagged transaction trends.
- Transaction status distribution among flagged records.

**Important Interpretation:** A transaction marked with a fraud flag represents a flagged record in the supplied dataset. It should not automatically be interpreted as confirmed fraudulent activity.

## 8. Key Skills Demonstrated

- Data Cleaning and Preparation
- Exploratory Data Analysis (EDA)
- Python Programming for Data Analytics
- Pandas and NumPy
- Data Visualisation
- MySQL Database Management
- SQL Query Writing and Optimisation
- Joins, Subqueries and CTEs
- Window Functions
- Aggregations and Conditional Analysis
- Power BI Dashboard Development
- Business Analysis and Data Interpretation
- Data Storytelling

## 9. Project Limitations

- The analysis is based on the fields and records available in the supplied dataset.
- The dataset represents a defined period from 01 January 2019 to 01 January 2024.
- A fraud flag is a dataset indicator and does not independently confirm fraudulent activity.
- Observed patterns should not be interpreted as proof of causation.
- Transaction trends near the beginning or end of the dataset may be affected by incomplete reporting periods.
- The findings should be interpreted within the scope and quality of the available data.

## 10. Conclusion

The Indian Banking Transactions Analysis project demonstrates an end-to-end data analytics workflow involving Python, SQL, Microsoft Excel and Power BI.

By combining banking performance analysis with customer transaction insights and fraud-risk monitoring, the project transforms transaction-level records into structured business insights.

The project also demonstrates practical analytical skills in data preparation, exploratory analysis, SQL querying, dashboard development and business interpretation.

**Dataset Source & Attribution:** The dataset is identified in the project report as the Kaggle dataset titled *Indian Banking Transactions*. The exact original dataset URL and applicable redistribution terms should be verified and added before public repository publication.
