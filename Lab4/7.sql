SELECT (SELECT n_name FROM nation WHERE n_nationkey = c_nationkey) country, o_orderstatus, COUNT(*)
FROM customer
INNER JOIN (
	SELECT o_custkey, o_orderstatus
	FROM orders
) o ON c_custkey = o_custkey
WHERE c_nationkey IN (
	SELECT n_nationkey
    FROM nation
    WHERE n_regionkey = (
		SELECT r_regionkey
        FROM region
        WHERE r_name = 'ASIA'
    )
)
GROUP BY country, o_orderstatus