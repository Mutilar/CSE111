SELECT COUNT(*)
FROM (
	SELECT DISTINCT ps_suppkey
	FROM partsupp
	INNER JOIN (
		SELECT p_partkey, p_size
		FROM part
		WHERE p_type LIKE '%MEDIUM POLISHED%' AND p_size IN (3, 23, 26, 49)
	) p ON p_partkey = ps_partkey
)