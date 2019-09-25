SELECT COUNT(*)
FROM (
	SELECT DISTINCT o_custkey
    FROM orders
    WHERE o_orderkey IN (
		SELECT l_orderkey
		FROM lineitem 
		WHERE l_discount >= .04
    )
) cust