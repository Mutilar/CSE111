SELECT n_name, total_nation_orders
FROM nation
INNER JOIN (
	SELECT c_nationkey, SUM(total_orders) total_nation_orders
	FROM customer
	INNER JOIN (
		SELECT o_custkey, COUNT(*) total_orders
		FROM orders
		GROUP BY o_custkey
	) o ON c_custkey = o_custkey
	GROUP BY c_nationkey
) c ON n_nationkey = c_nationkey
WHERE n_regionkey = (
	SELECT r_regionkey
    FROM region
    WHERE r_name = "EUROPE"
)