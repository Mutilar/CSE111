SELECT s_region, c_region, strftime('%Y', l_shipdate) year, SUM(l_extendedprice * (1-l_discount))
FROM lineitem
INNER JOIN (
    SELECT s_suppkey, (SELECT r_name FROM region WHERE r_regionkey = (SELECT n_regionkey FROM nation WHERE n_nationkey = s_nationkey)) s_region
    FROM supplier
) s ON l_suppkey = s_suppkey
INNER JOIN (
    SELECT o_orderkey, c_region
    FROM orders
    INNER JOIN (
        SELECT c_custkey, (SELECT r_name FROM region WHERE r_regionkey = (SELECT n_regionkey FROM nation WHERE n_nationkey = c_nationkey)) c_region
        FROM customer
    ) c ON o_custkey = c_custkey
) o ON l_orderkey = o_orderkey
WHERE year IN ('1995', '1996')
GROUP BY s_region, c_region, year
ORDER BY s_region, c_region, year ASC