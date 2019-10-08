SELECT n_name, COUNT(*)
FROM orders
INNER JOIN (
	SELECT l_orderkey, n_name
	FROM lineitem
	INNER JOIN (
		SELECT s_suppkey, n_name
		FROM supplier
		INNER JOIN (
			SELECT n_nationkey, n_name
			FROM nation
			WHERE n_regionkey = (
				SELECT r_regionkey
				FROM region
				WHERE r_name = 'AMERICA'
			)
		) n ON s_nationkey = n_nationkey
	) s on l_suppkey = s_suppkey	
) l ON o_orderkey = l_orderkey
WHERE o_orderstatus = 'F' AND YEAR(o_orderdate) = 1995
GROUP BY n_name