SELECT COUNT(*)
FROM (
	SELECT l_orderkey 
	FROM lineitem
	INNER JOIN (
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
	) s ON l_suppkey = s_suppkey
	INNER JOIN (
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
	) o ON l_orderkey = o_orderkey
	GROUP BY l_orderkey
)