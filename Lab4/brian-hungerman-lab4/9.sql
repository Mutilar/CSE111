SELECT SUM(count)
FROM supplier
INNER JOIN (
	SELECT l_suppkey, COUNT(*) count
	FROM lineitem
	INNER JOIN (
		SELECT o_orderkey
		FROM orders
        GROUP BY o_clerk
	) o ON l_orderkey = o_orderkey
    GROUP BY l_suppkey
) l ON s_suppkey = l_suppkey
WHERE s_nationkey IN (
	SELECT n_nationkey
    FROM nation
    WHERE n_name = 'RUSSIA'
)