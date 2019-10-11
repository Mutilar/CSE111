SELECT (
	SELECT r_name 
    FROM region 
    WHERE r_regionkey = (
        SELECT n_regionkey 
        FROM nation 
        WHERE n_nationkey = c_nationkey
    )
) reg_name, COUNT(*)
FROM customer
WHERE c_acctbal > (
	SELECT AVG(c_acctbal)
	FROM customer
)
AND c_custkey NOT IN (
	SELECT DISTINCT o_custkey
	FROM orders
)
GROUP BY reg_name