SELECT l_receiptdate, COUNT(*)
FROM lineitem
WHERE l_orderkey IN (
	SELECT o_orderkey
    FROM orders
    WHERE o_custkey = (
		SELECT c_custkey
        FROM customer
        WHERE c_name = 'Customer#000000118'
	)
)
GROUP BY l_receiptdate