SELECT p_type, MAX(l_discount)
FROM lineitem
INNER JOIN (
	SELECT p_type, p_partkey
	FROM part
	WHERE p_type LIKE '%ECONOMY%'
) p ON l_partkey = p_partkey
GROUP BY p_type