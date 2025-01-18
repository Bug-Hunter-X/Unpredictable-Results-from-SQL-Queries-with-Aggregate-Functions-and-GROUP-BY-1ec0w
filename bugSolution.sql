To fix this issue, ensure that all columns in the `SELECT` statement are either included in the `GROUP BY` clause or are used as arguments to aggregate functions.  Here's the corrected query:

```sql
SELECT order_id, customer_name, SUM(order_total) AS total_spent
FROM orders
GROUP BY order_id, customer_name; 
```

Alternatively, if you only need the total spent per order regardless of the customer name, you would simply remove `customer_name` from the SELECT clause altogether:

```sql
SELECT order_id, SUM(order_total) AS total_spent
FROM orders
GROUP BY order_id;
```
This revised query is much clearer and less likely to cause unexpected behavior.