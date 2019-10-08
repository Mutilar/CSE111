SELECT p_mfgr, o_orderpriority, COUNT(*)
FROM part
INNER JOIN (
	SELECT l_partkey, o_orderpriority
	FROM lineitem
	INNER JOIN (
		SELECT o_orderkey, o_orderpriority
		FROM orders
	) o ON o_orderkey = l_orderkey
) l ON l_partkey = p_partkey
GROUP BY p_mfgr, o_orderpriority
