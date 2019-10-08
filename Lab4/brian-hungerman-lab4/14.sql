SELECT s_regionkey, c_regionkey, SUM(L_EXTENDEDPRICE)
FROM LINEITEM
INNER JOIN (
	SELECT o_orderkey, c_regionkey
	FROM ORDERS
	INNER JOIN (
		SELECT R2_NAME c_regionkey, c_custkey 
		FROM CUSTOMER
		INNER JOIN (
			SELECT n_nationkey, R2_NAME
			FROM NATION
			INNER JOIN (
				SELECT R_REGIONKEY, R_NAME R2_NAME
				FROM REGION
			) r2 ON R_REGIONKEY = N_REGIONKEY 
		) n2 ON c_nationkey = n_nationkey
	) c on c_custkey = o_custkey
) o ON o_orderkey = l_orderkey
INNER JOIN (
	SELECT s_suppkey, R_NAME s_regionkey
	FROM SUPPLIER
	INNER JOIN (
		SELECT n_nationkey, R_NAME
		FROM NATION
		INNER JOIN (
			SELECT R_REGIONKEY, R_NAME
			FROM REGION
		) r1 ON R_REGIONKEY = N_REGIONKEY 
	) n1 ON s_nationkey = n_nationkey
) s ON S_SUPPKEY = L_SUPPKEY
GROUP BY s_regionkey, c_regionkey