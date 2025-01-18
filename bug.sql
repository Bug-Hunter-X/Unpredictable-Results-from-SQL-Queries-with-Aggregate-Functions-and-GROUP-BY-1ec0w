In SQL, a common yet subtle error arises when dealing with aggregate functions and `GROUP BY` clauses.  If you use columns in your `SELECT` statement that aren't part of the `GROUP BY` clause or aren't wrapped within an aggregate function, the database might behave unpredictably, producing results that depend on the specific SQL implementation.

For example, consider this query:

```sql
SELECT order_id, customer_name, SUM(order_total) AS total_spent
FROM orders
GROUP BY order_id;
```

This query intends to calculate the total spent for each order. However, it's missing `customer_name` in the `GROUP BY` clause.  The database might arbitrarily choose one customer name associated with that `order_id`, leading to incorrect or inconsistent results across different database systems or even different executions on the same system.