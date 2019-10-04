SELECT s_name, regionname
FROM supplier
INNER JOIN (
	SELECT MAX(s_acctbal) largest, (SELECT r_name FROM region WHERE r_regionkey = (SELECT n_regionkey FROM nation WHERE n_nationkey = s_nationkey)) regionname
	FROM supplier
	GROUP BY regionname
) s ON s_acctbal = largest