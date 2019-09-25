SELECT AVG(c_acctbal)
FROM customer
WHERE (
	c_nationkey IN (
		SELECT n_nationkey
        FROM nation
        WHERE n_regionkey = (
			SELECT r_regionkey
            FROM region
            WHERE r_name = 'EUROPE'
		)
	)
	AND c_mktsegment = 'MACHINERY'
)