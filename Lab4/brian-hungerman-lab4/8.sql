SELECT (SELECT n_name FROM nation WHERE s_nationkey = n_nationkey) country, SUM(orders)
FROM supplier
INNER JOIN (
	SELECT l_suppkey, COUNT(*) orders
	FROM lineitem
	INNER JOIN (
		SELECT o_orderkey
		FROM orders
		WHERE o_orderstatus = 'F' AND YEAR(o_orderdate) = 1995
	) o ON l_orderkey = o_orderkey
    GROUP BY l_suppkey
) l ON s_suppkey = l_suppkey
WHERE s_nationkey IN (
	SELECT n_nationkey
    FROM nation
    WHERE n_regionkey = (
		SELECT r_regionkey
        FROM region
        WHERE r_name = 'AMERICA'
    )
)
GROUP BY country