
-- Q1.Display the first 100 transactions, sorted by transaction date and time
select * from banking_transactions
order by transaction_date, transaction_time
limit 100;

-- Q2.Find all distinct account types in the dataset
select distinct(account_type) from banking_transactions;

-- Q3.List all distinct transaction types and sort them alphabetically
select distinct(transaction_type) from banking_transactions
order by transaction_type;

-- Q4.Find all transactions with an amount greater than ₹50,000
select * from banking_transactions
where transaction_amount > 50000;

-- Q5.Find transactions whose status is Failed or Reversed
select * from banking_transactions
where transaction_status in ('Failed', 'Reversed');
-- where transaction_status = 'Failed' or transaction_status = 'Reversed';

-- Q6.Display transactions made through UPI or Net Banking
select * from banking_transactions
where transaction_type in ('UPI', 'Net_Banking');
-- where transaction_type = 'UPI' or  transaction_type = 'Net_Banking';

-- Q7.Find transactions occurring on 1 January 2019
select * from banking_transactions
where transaction_date = '2019-01-01'
order by transaction_time;

-- Q8.Find transactions with amounts between ₹1,000 and ₹10,000, inclusive
select * from banking_transactions
where transaction_amount between 1000 and 10000;

-- Q9.Find customers whose IDs begin with `CUST00`
select * from banking_transactions
where customer_id like 'CUST00%';

-- Q10.Count transactions by transaction status and sort from highest to lowest count
select transaction_status, count(transaction_status) as Total_Transactions
from banking_transactions
group by transaction_status
order by Total_Transactions desc;

-- Q11.Check whether `transaction_id` contains duplicates
SELECT transaction_id, COUNT(*) AS occurrences
FROM banking_transactions
GROUP BY transaction_id
HAVING COUNT(*) > 1;

-- Q12.Count NULL values in each important column, including loan and KYC fields
SELECT
    SUM(customer_id IS NULL) AS null_customer_id,
    SUM(transaction_date IS NULL) AS null_transaction_date,
    SUM(transaction_amount IS NULL) AS null_amount,
    SUM(account_balance IS NULL) AS null_balance,
    SUM(credit_score IS NULL) AS null_credit_score,
    SUM(has_loan IS NULL) AS null_has_loan,
    SUM(loan_type IS NULL) AS null_loan_type,
    SUM(emi_amount IS NULL) AS null_emi_amount,
    SUM(kyc_status IS NULL) AS null_kyc_status
FROM banking_transactions;

-- Q13.Check for negative or zero transaction amounts
select * from banking_transactions
where transaction_amount <= 0;

-- Q14.Find records where `has_loan = 1` but `loan_type` is NULL
select * from banking_transactions
where has_loan = 1 and loan_type IS NULL;

-- Q15.Find records where `has_loan = 0` but `loan_type` is populated
select * from banking_transactions
where has_loan = 0 and loan_type IS NOT NULL;

-- Q16.Check for inconsistent combinations of transaction status and transaction direction
select transaction_status, transaction_direction, count(*) as Total from banking_transactions
where transaction_status IN ('Failed', 'Pending','Reversed')
group by transaction_status, transaction_direction
order by transaction_status;

-- Q17.Find transaction dates or transaction times that are NULL or fall outside the expected date range
SELECT * FROM banking_transactions
WHERE transaction_date IS NULL
   OR transaction_time IS NULL
   OR transaction_date < '2019-01-01'
   OR transaction_date > '2024-01-01';

-- Q18.Check whether `transaction_hour` agrees with the hour extracted from `transaction_time`
SELECT * FROM banking_transactions
WHERE transaction_hour != HOUR(transaction_time);

-- Q19.Find duplicate records using the combination of customer, date, time, amount and transaction type
select customer_id, transaction_date, transaction_time, transaction_amount, transaction_type, count(*) as Total
from banking_transactions
group by customer_id, transaction_date, transaction_time, transaction_amount, transaction_type
having count(*) > 1;

-- Q20.Compare total records, distinct transaction IDs and distinct customers. Explain what the differences indicate
select count(*) as Total_Records, count(distinct(transaction_id)) as Total_Transaction_IDs, 
count(distinct(customer_id)) as Total_Customers
from banking_transactions;

-- Q21.Calculate total transaction amount, average amount, minimum amount and maximum amount
select round(sum(transaction_amount),2) as Total_Transaction_Amount, round(avg(transaction_amount),2) as Average_Transaction_Amount,
min(transaction_amount) as Minimum_Transaction_Amount, max(transaction_amount) as Maximum_Transaction_Amount
from banking_transactions;

-- Q22.Calculate total transaction amount and transaction count by transaction type
select transaction_type, round(sum(transaction_amount),2) as Total_Transaction_Amount, count(transaction_amount) as Transaction_Count 
from banking_transactions
group by transaction_type
order by transaction_type;

-- Q23.Calculate average transaction amount by account type
select account_type, round(avg(transaction_amount),2) as Average_Transaction_Amount
from banking_transactions
group by account_type;

-- Q24.Compare total transaction amount by Debit versus Credit direction
select transaction_direction, round(sum(transaction_amount),2) as Total_Transaction_Amount
from banking_transactions
group by transaction_direction;

-- Q25.Calculate transaction volume and average amount by transaction status
select transaction_status, count(transaction_amount) as Transaction_Volume, round(avg(transaction_amount),2) as Average_Amount
from banking_transactions
group by transaction_status
order by transaction_status;

-- Q26.Calculate daily transaction volume and total transaction amount
SELECT
    transaction_date,
    COUNT(*) AS transaction_volume,
    ROUND(SUM(transaction_amount), 2) AS total_transaction_amount
FROM banking_transactions
GROUP BY transaction_date
ORDER BY transaction_date;

-- Q27.Calculate monthly transaction volume and total transaction amount
SELECT
    DATE_FORMAT(transaction_date, '%Y-%m') AS transaction_month,
    COUNT(*) AS transaction_volume,
    ROUND(SUM(transaction_amount), 2) AS total_transaction_amount
FROM banking_transactions
GROUP BY DATE_FORMAT(transaction_date, '%Y-%m')
ORDER BY transaction_month;

-- Q28.Identify the top 10 states by transaction volume
select state, count(*) as transaction_volume
from banking_transactions
group by state
order by transaction_volume desc
limit 10;

-- Q29.Identify the top 10 merchant categories by total transaction amount
select merchant_category, round(sum(transaction_amount),2) as Total_Transaction_Amount
from banking_transactions
group by merchant_category
order by Total_Transaction_Amount desc
limit 10;

-- Q30.Calculate the percentage share of each transaction type in overall transaction volume
select transaction_type, count(*) as Transaction_Volume,
round(100 * (count(*)/ (select count(*) from banking_transactions)),2) as percentage_share
from banking_transactions
group by transaction_type
order by percentage_share desc;

-- Q31.Count distinct customers by account type
select account_type, count(distinct(customer_id)) as Customers
from banking_transactions
group by account_type;

-- Q32.Calculate the number of transactions per customer and identify the top 20 customers by transaction count
select customer_id, count(transaction_id) as Total_Transactions
from banking_transactions
group by customer_id
order by Total_Transactions desc
limit 20;

-- Q33.Calculate each customer's total transaction amount and identify the top 20 by this measure
select customer_id, round(sum(transaction_amount),2) as Total_Transaction_Amount
from banking_transactions
group by customer_id
order by Total_Transaction_Amount desc
limit 20;

-- Q34.Compare average transaction amounts across channels
select channel, round(avg(transaction_amount),2) as Average_Amount
from banking_transactions
group by channel
order by Average_Amount desc;

-- Q35.Identify the busiest transaction hours by transaction count
SELECT transaction_hour, COUNT(*) AS Transaction_Count
FROM banking_transactions
GROUP BY transaction_hour
ORDER BY Transaction_Count DESC;

-- Q36.Compare transaction volume across states and channels
select state, channel, count(*) as Transaction_Volume
from banking_transactions
group by state, channel
order by Transaction_Volume desc;

-- Q37.Compare transaction amounts for customers with and without loans
select has_loan, round(sum(transaction_amount),2) as Total_Amount
from banking_transactions
group by has_loan;

-- Q38.Compare transaction counts and average amounts by KYC status
select kyc_status, count(*) as Transaction_Count, round(avg(transaction_amount),2) as Average_Amount
from banking_transactions
group by kyc_status
order by Transaction_Count desc;

-- Q39.Calculate average credit score by account type and loan status
select account_type, has_loan, avg(credit_score) as Average_Credit_Score
from banking_transactions
group by account_type, has_loan
order by account_type;

-- Q40.Identify customers who used at least three distinct transaction types
select customer_id, count(distinct(transaction_type)) as Total_Count
from banking_transactions
group by customer_id
having count(distinct(transaction_type)) >= 3
order by Total_Count;

-- Q41.Count records flagged by `is_fraud` and calculate their percentage of all records
select is_fraud, count(*) as Total_Records,
round(100 * count(*)/ (select count(*) from banking_transactions),2) as Percentage
from banking_transactions
group by is_fraud;

-- Q42.Calculate the flagged-transaction rate by transaction type
SELECT transaction_type, COUNT(*) AS Total_Transactions,
    SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END)
        AS Flagged_Transactions,
    ROUND(
        100.0 * SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS Flagged_Transaction_Rate
FROM banking_transactions
GROUP BY transaction_type
ORDER BY Flagged_Transaction_Rate DESC;

-- Q43.Calculate the flagged-transaction rate by channel
select channel, COUNT(*) AS Total_Transactions, SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) AS Flagged_Transactions,
    ROUND(100.0 * SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) / COUNT(*),2) AS Flagged_Transaction_Rate
from banking_transactions
group by channel
order by Flagged_Transaction_Rate desc;

-- Q44.Calculate the flagged-transaction rate by state
select state, COUNT(*) AS Total_Transactions, SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) AS Flagged_Transactions,
    ROUND(100.0 * SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) / COUNT(*),2) AS Flagged_Transaction_Rate
from banking_transactions
group by state
order by Flagged_Transaction_Rate desc;

-- Q45.Compare flagged and non-flagged transactions by transaction amount
select
	case 
		WHEN is_fraud = 0 THEN 'Non-Flagged Transactions' 
        WHEN is_fraud = 1 THEN 'Flagged Transactions'
        ELSE 'Unknown Fraud Status'
	END AS Transactions,
    count(*) as Total_Transactions,
round(sum(transaction_amount),2) as Total_Amount,
round(avg(transaction_amount),2) as Average_Amount
from banking_transactions
group by is_fraud
order by Transactions;

-- Q46.Identify customers with more than one flagged transaction
select customer_id, SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) AS Flagged_Transactions
from banking_transactions
group by customer_id
having SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) > 1
order by Flagged_Transactions;

-- Q47.Compare transaction status distributions between flagged and non-flagged records
select transaction_status,
	case 
		WHEN is_fraud = 0 THEN 'Non-Flagged Records' 
        WHEN is_fraud = 1 THEN 'Flagged Records'
        ELSE 'Unknown Fraud Status'
	END AS Transactions,
    count(*) as Total_Count
from banking_transactions
group by transaction_status, is_fraud
order by transaction_status, Transactions;

-- Q48.Identify hours with the highest count of flagged transactions
select transaction_hour, SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) AS Flagged_Transactions
from banking_transactions
group by transaction_hour
order by Flagged_Transactions desc;

-- Q49.Find unusually high transaction amounts relative to the dataset's overall average and standard deviation
WITH Transaction_Stats AS (
    SELECT
        AVG(transaction_amount) AS Average_Amount,
        STDDEV_POP(transaction_amount) AS Std_Deviation
    FROM banking_transactions
)
SELECT
    bt.transaction_id,
    bt.customer_id,
    bt.transaction_amount,
    ROUND(ts.Average_Amount, 2) AS Average_Amount,
    ROUND(ts.Std_Deviation, 2) AS Std_Deviation
FROM banking_transactions AS bt
CROSS JOIN Transaction_Stats AS ts
WHERE bt.transaction_amount >
      ts.Average_Amount + (2 * ts.Std_Deviation)
ORDER BY bt.transaction_amount DESC;

-- Q50.Build a risk-monitoring summary combining channel, transaction type, status and flag count
select channel, transaction_type, transaction_status, sum(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) AS Flag_Count
from banking_transactions
group by channel, transaction_type, transaction_status
order by channel, transaction_type, Flag_Count desc;

-- Q51.Find the second-highest distinct transaction amount
-- Approach 1 :-
select max(transaction_amount) as Second_Highest_Transaction_Amount from banking_transactions
where transaction_amount < (select max(transaction_amount) from banking_transactions);

-- Approach 2 :-
select distinct(transaction_amount) as Second_Highest_Transaction_Amount from banking_transactions
order by transaction_amount desc
limit 1 offset 1;

-- Q52.Rank transaction types by total transaction amount using `DENSE_RANK()`
select transaction_type, round(sum(transaction_amount), 2) as Total_Amount,
dense_rank() over(order by sum(transaction_amount) desc) as ranking
from banking_transactions
group by transaction_type
order by Total_Amount desc;

-- Q53.Find the top three merchant categories by transaction amount within each state
WITH cte AS (
    SELECT
        state,
        merchant_category,
        round(SUM(transaction_amount),2) AS Total_Amount,
        ROW_NUMBER() OVER (
            PARTITION BY state
            ORDER BY SUM(transaction_amount) DESC
        ) AS ranking
    FROM banking_transactions
    GROUP BY
        state,
        merchant_category
)
SELECT
    state,
    merchant_category,
    Total_Amount,
    ranking
FROM cte
WHERE ranking <= 3
ORDER BY state, ranking;

-- Q54.Calculate each month's transaction amount and the previous month's amount using `LAG()`
WITH Monthly_Summary AS (
    SELECT
        YEAR(transaction_date) AS Transaction_Year,
        MONTH(transaction_date) AS Transaction_Month,
        round(SUM(transaction_amount),2) AS Monthly_Transaction_Amount
    FROM banking_transactions
    GROUP BY
        YEAR(transaction_date),
        MONTH(transaction_date)
)
SELECT
    Transaction_Year,
    Transaction_Month,
    Monthly_Transaction_Amount,
    LAG(Monthly_Transaction_Amount) OVER (
        ORDER BY Transaction_Year, Transaction_Month
    ) AS Previous_Month_Amount
FROM Monthly_Summary
ORDER BY Transaction_Year, Transaction_Month;

-- Q55.Calculate the month-over-month percentage change in transaction amount
WITH Monthly_Summary AS (
    SELECT
        YEAR(transaction_date) AS Year,
        MONTH(transaction_date) AS Month,
        SUM(transaction_amount) AS Monthly_Amount
    FROM banking_transactions
    GROUP BY
        YEAR(transaction_date),
        MONTH(transaction_date)
),
Monthly_Comparison AS (
    SELECT
        Year,
        Month,
        Monthly_Amount,
        LAG(Monthly_Amount) OVER (
            ORDER BY Year, Month
        ) AS Previous_Month_Amount
    FROM Monthly_Summary
)
SELECT
    Year,
    Month,
    ROUND(Monthly_Amount, 1) AS Monthly_Amount,
    ROUND(Previous_Month_Amount, 0) AS Previous_Month_Amount,
    CASE
        WHEN Previous_Month_Amount IS NULL THEN NULL
        WHEN Previous_Month_Amount = 0 THEN 'Undefined'
        WHEN Monthly_Amount > Previous_Month_Amount THEN
            CONCAT(
                ROUND(ABS((Monthly_Amount - Previous_Month_Amount)
                * 100.0 / Previous_Month_Amount), 2),
                '% Increase'
            )
        WHEN Monthly_Amount < Previous_Month_Amount THEN
            CONCAT(
                ROUND(ABS((Monthly_Amount - Previous_Month_Amount)
                * 100.0 / Previous_Month_Amount), 2),
                '% Decrease'
            )
        ELSE '0.00% No Change'
    END AS MoM_Change
FROM Monthly_Comparison
ORDER BY Year, Month;

-- Q56.Calculate each transaction's percentage contribution to its customer's total transaction amount
SELECT transaction_id, customer_id, transaction_amount,
ROUND(SUM(transaction_amount) OVER (PARTITION BY customer_id),2) AS Customer_Total_Amount,
CONCAT(ROUND(100.0 * transaction_amount / SUM(transaction_amount) OVER (PARTITION BY customer_id),2),'%') AS Percentage_Contribution
FROM banking_transactions
ORDER BY customer_id, Percentage_Contribution DESC;

-- Q57.Use `ROW_NUMBER()` to rank each customer's transactions from newest to oldest
select customer_id, transaction_id, transaction_date, transaction_time, transaction_amount,
row_number() over(partition by customer_id order by transaction_date desc, transaction_time desc) as ranking
from banking_transactions;

-- Q58.Calculate a running total of transaction amount over time
SELECT transaction_id, transaction_date, transaction_time, transaction_amount,
ROUND(SUM(transaction_amount) OVER (ORDER BY transaction_date, transaction_time
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 2) AS Running_Total
FROM banking_transactions
ORDER BY transaction_date, transaction_time;

-- Q59.Use conditional aggregation to compare Successful, Failed, Pending and Reversed transactions in one result per channel
SELECT channel,
    SUM(CASE WHEN transaction_status = 'Success' THEN 1 ELSE 0 END) AS Successful_Transactions,
    SUM(CASE WHEN transaction_status = 'Failed' THEN 1 ELSE 0 END) AS Failed_Transactions,
    SUM(CASE WHEN transaction_status = 'Pending' THEN 1 ELSE 0 END) AS Pending_Transactions,
    SUM(CASE WHEN transaction_status = 'Reversed' THEN 1 ELSE 0 END) AS Reversed_Transactions
FROM banking_transactions
GROUP BY channel
ORDER BY channel;

-- Q60.Create a final monthly banking performance report combining transaction volume, amount, average transaction amount, failed-transaction rate and flagged-transaction rate
select YEAR(transaction_date) as Year, MONTH(transaction_date) as Month,
count(*) as Transaction_Volume, round(sum(transaction_amount),2) as Transaction_Amount,
round(avg(transaction_amount),2) as Average_Transaction_Amount,
SUM(CASE WHEN transaction_status = 'Failed' THEN 1 ELSE 0 END) as Failed_Transactions,
round(100.0 * SUM(CASE WHEN transaction_status = 'Failed' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Failed_Transaction_Rate,
SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) as Flagged_Transactions,
round(100.0 * SUM(CASE WHEN is_fraud = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS Flagged_Transaction_Rate
from banking_transactions
group by YEAR(transaction_date), MONTH(transaction_date)
order by Year, Month;