SELECT c_name, o.totalspent, (SELECT n_name FROM nation where n_nationkey = c_nationkey) nation_name
FROM customer
INNER JOIN (
	SELECT o_custkey, SUM(o_totalprice) totalspent
	FROM orders
	GROUP BY o_custkey
) o ON c_custkey = o_custkey
GROUP BY c_name
HAVING nation_name = 'FRANCE'
