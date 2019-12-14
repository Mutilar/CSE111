
SELECT s_name, p_size, ps_supplycost
FROM supplier
INNER JOIN (
	SELECT ps_suppkey, p_size, ps_supplycost
	FROM partsupp
	INNER JOIN (
		SELECT p_partkey, p_size
		FROM part
		WHERE p_type LIKE '%STEEL%'
	) p ON p_partkey = ps_partkey
) ps ON ps_suppkey = s_suppkey
WHERE s_nationkey IN (
	SELECT n_nationkey
	FROM nation
	WHERE n_regionkey = (
		SELECT r_regionkey
		FROM region
		WHERE r_name = 'AMERICA'
	)
)
GROUP BY p_size
HAVING ps_supplycost = MIN(ps_supplycost)