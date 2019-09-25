SELECT r_name, n.sumvals
FROM region
INNER JOIN (
	SELECT n_regionkey, SUM(c.vals) sumvals
	FROM nation
	INNER JOIN (
		SELECT c_nationkey, COUNT(*) vals
		FROM customer
		INNER JOIN (
			SELECT o_custkey
            FROM orders
            WHERE o_orderstatus = 'F'
		) o ON o_custkey = c_custkey 
		GROUP BY c_nationkey
	) c ON c_nationkey = n_nationkey
	GROUP BY n_regionkey
) n ON r_regionkey = n_regionkey
ORDER BY sumvals DESC

