SELECT c_name, COUNT(*)
FROM orders
INNER JOIN (
	SELECT c_name, c_custkey
	FROM customer
	WHERE c_nationkey = (
		SELECT n_nationkey
		FROM nation
		WHERE n_name = 'GERMANY'
	)
) c ON o_custkey = c_custkey
WHERE YEAR(o_orderdate) = 1995
GROUP BY c_name


