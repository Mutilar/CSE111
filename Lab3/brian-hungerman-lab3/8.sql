SELECT s_name, s_acctbal
FROM supplier
WHERE s_nationkey IN (
	SELECT n_nationkey
    FROM nation
    WHERE n_regionkey = (
		SELECT r_regionkey
        FROM region
        WHERE r_name = 'ASIA'
    )
) AND s_acctbal >= 1000