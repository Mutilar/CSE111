SELECT COUNT(*)
FROM (
    SELECT l_suppkey
    FROM lineitem
    INNER JOIN (
        SELECT o_orderkey
        FROM orders
        INNER JOIN (
            SELECT c_custkey
            FROM customer
            WHERE c_nationkey IN (
                SELECT n_nationkey
                FROM nation
                WHERE n_name = 'FRANCE' OR n_name = 'GERMANY'
            )
        ) c ON c_custkey = o_custkey   
    ) o ON o_orderkey = l_orderkey
    GROUP BY l_suppkey
    HAVING COUNT(*) < 30
) x