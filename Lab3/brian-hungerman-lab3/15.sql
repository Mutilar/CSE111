SELECT n_name, s.yearordered, COUNT(*)
FROM nation
INNER JOIN (
	SELECT s_nationkey, l.yearordered
	FROM supplier
	INNER JOIN (
		SELECT l_suppkey, o.yearordered
		FROM lineitem
		INNER JOIN (
			SELECT o_orderkey, YEAR(o_orderdate) yearordered
			FROM orders
			WHERE o_orderpriority = '3-MEDIUM'
			GROUP BY o_orderkey
		) o ON l_orderkey = o_orderkey
	) l ON s_suppkey = l_suppkey
) s ON n_nationkey = s_nationkey
GROUP BY n_name, s.yearordered