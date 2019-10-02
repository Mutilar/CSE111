SELECT s_name, COUNT(*)
FROM part
INNER JOIN (
	SELECT ps_partkey, s_name
	FROM partsupp
	INNER JOIN (
		SELECT s_suppkey, s_name
		FROM supplier
		WHERE s_nationkey = (SELECT n_nationkey FROM nation WHERE n_name = 'BRAZIL')
	) s ON ps_suppkey = s_suppkey
) p ON p_partkey = ps_partkey
WHERE p_size < 20
GROUP BY s_name