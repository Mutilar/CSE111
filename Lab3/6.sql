SELECT n_name
FROM nation
WHERE n_nationkey IN (
	SELECT DISTINCT c_nationkey
	FROM customer
	WHERE c_custkey IN (
		SELECT o_custkey
        FROM orders
        WHERE YEAR(o_orderdate) = 1996 and MONTH(o_orderdate) = 12
	)
)