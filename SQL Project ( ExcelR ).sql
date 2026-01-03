-- Cross sell placed achive %
WITH placed AS (
     SELECT
        SUM(Amount) AS placed_amt
    FROM brokerage_fees
    WHERE TRIM(income_class) = 'Cross Sell'
),
budget AS (
    SELECT
        SUM(Cross_sell_bugdet) AS target_amt
    FROM individual_budgets
)
SELECT
    ROUND(p.placed_amt / ifnull(b.target_amt, 1) * 100, 0) AS cross_sell_achieve_percent
FROM placed p
 cross join budget b;
  
-- cross sell achive %
 WITH invoice_data AS (
  SELECT SUM(amount) AS invoice_amount
  FROM invoice	
  WHERE income_class = 'Cross Sell'
),
budget_data AS (
  SELECT SUM(`Cross_sell_bugdet`) AS target_amount
  FROM individual_budgets
)
SELECT ROUND(invoice_data.invoice_amount / NULLIF(budget_data.target_amount,0) * 100, 2)
       AS Cross_sell_invoice_percent
FROM invoice_data
CROSS JOIN budget_data;

-- NEW PLACED ACHIVE %
WITH placed AS (
    SELECT
        SUM(Amount) AS placed_amt
    FROM brokerage_fees
    WHERE TRIM(income_class) = 'New'
),
budget AS (
    SELECT
        SUM(New_Budget) AS target_amt
    FROM individual_budgets
)
SELECT
    ROUND(p.placed_amt / ifnull(b.target_amt, 2) * 100, 2) AS  New_achieve_percent
FROM placed p
 cross join budget b;

-- New invoice achive %
WITH placed_data AS (
    SELECT SUM(amount) AS placed_amount
    FROM invoice
    WHERE income_class = 'New'
),
budget_data AS (
    SELECT SUM(`New_budget`) AS target_amount
    FROM individual_budgets
)
SELECT ROUND(
           placed_data.placed_amount / NULLIF(budget_data.target_amount, 0) * 100,
           2
       ) AS New_Placed_Ach_Percent
FROM placed_data
CROSS JOIN budget_data;
 
 -- Renewal placed achive %
 WITH placed AS (
    SELECT
        SUM(Amount) AS placed_amt
    FROM brokerage_fees
    WHERE TRIM(income_class) =  'Renewal'
),
budget AS (
    SELECT
        SUM(Renewal_Budget) AS target_amt
    FROM individual_budgets
)
SELECT
    ROUND(p.placed_amt / ifnull(b.target_amt, 2) * 100, 2) AS  Renewal_achieve_percent
FROM placed p
 cross join budget b;
 
 -- Renewal invoice Achive %
 WITH placed_data AS (
    SELECT SUM(amount) AS placed_amount
    FROM invoice
    WHERE income_class = 'Renewal'
),
budget_data AS (
    SELECT SUM(`Renewal_Budget`) AS target_amount
    FROM individual_budgets
)
SELECT ROUND(
           placed_data.placed_amount / NULLIF(budget_data.target_amount, 0) * 100,
           2
       ) AS  Renewal_Ach_Percent
FROM placed_data
CROSS JOIN budget_data;

select count(*) 
from opportunity;

select count(*) 
from opportunity
where stage = "Qualify opportunity" or stage = "Propose Solution";



select sum(revenue_amount)*100/(select sum(revenue_amount) as tot_opp
from opportunity) as conversion_ratio
from opportunity 
where stage = "Negotiate";

select sum(revenue_amount)
from opportunity 
where stage = "Negotiate";
 
SELECT YEAR(STR_TO_DATE(meeting_date, '%d-%m-%Y')) AS meeting_year,
       COUNT(*) AS meeting_count
FROM meeting
GROUP BY YEAR(STR_TO_DATE(meeting_date, '%d-%m-%Y'));



select * from meeting;

 
 
 
 
 
 
