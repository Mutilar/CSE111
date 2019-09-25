SELECT COUNT(*)
FROM orders
WHERE o_orderpriority = '1-URGENT'
AND o_custkey IN (
	SELECT c_custkey 
    FROM customer
    WHERE c_nationkey = (
		SELECT n_nationkey
        FROM nation
        WHERE n_name = "Brazil"
    )
) and YEAR(o_orderdate) >= 1994 AND YEAR(o_orderdate) <= 1997