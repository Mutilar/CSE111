SELECT SUM(o_totalprice)
FROM orders
WHERE 
	o_custkey IN (
		SELECT c_custkey
        FROM customer
        WHERE c_nationkey IN (
			SELECT n_nationkey
            FROM nation
            WHERE n_regionkey = (
				SELECT r_regionkey
                FROM region
                WHERE r_name = 'EUROPE'
			)
        )
    )
AND YEAR(o_orderdate) = 1996