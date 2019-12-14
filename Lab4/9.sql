SELECT COUNT(*)
FROM (
	SELECT o_clerk
	FROM lineitem
	INNER JOIN (
		SELECT s_suppkey
		FROM supplier
		WHERE s_nationkey IN (
			SELECT n_nationkey
			FROM nation
			WHERE n_name = 'RUSSIA'
		)
	) l ON s_suppkey = l_suppkey
	INNER JOIN (
		SELECT o_clerk, o_orderkey
		FROM orders
	) o ON o_orderkey = l_orderkey
	GROUP BY o_clerk
)