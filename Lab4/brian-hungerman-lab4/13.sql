SELECT COUNT(*) 
FROM lineitem
WHERE l_suppkey IN (
	SELECT s_suppkey
	FROM supplier
	WHERE s_nationkey IN (
		SELECT n_nationkey
		FROM nation
		WHERE n_regionkey = (
			SELECT r_regionkey
			FROM region
			WHERE r_name = 'EUROPE'
		)
	)
) AND l_orderkey IN (
	SELECT o_orderkey
	FROM orders
	INNER JOIN (
		SELECT c_custkey
		FROM customer
		WHERE c_nationkey = (
			SELECT n_nationkey
			FROM nation
			WHERE n_name = 'CANADA'
		)
	) c ON c_custkey = o_custkey
)
