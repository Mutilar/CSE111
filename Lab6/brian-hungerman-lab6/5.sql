SELECT COUNT(*)
FROM (
    SELECT DISTINCT ps_suppkey
    FROM partsupp
	INNER JOIN (
		SELECT p_partkey
		FROM part
		WHERE p_retailprice = (
			SELECT MIN(p_retailprice)
			FROM part
		)
	) p ON p_partkey = ps_partkey
)