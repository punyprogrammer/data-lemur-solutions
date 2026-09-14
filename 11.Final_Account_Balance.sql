SELECT account_id ,SUM(
CASE 
  WHEN transaction_type  = 'Deposit'
  THEN amount 
  ELSE 
  -1*amount
  END 
) as final_balance from 
transactions
GROUP BY account_id 
