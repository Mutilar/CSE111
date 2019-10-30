SELECT x_name
FROM (
    SELECT p_name x_name, p_partkey x_partkey
    FROM part
    INNER JOIN (
        SELECT ps_partkey, ps_suppkey
        FROM partsupp
        INNER JOIN (
            SELECT s_suppkey
            FROM supplier
            WHERE s_nationkey IN (
                SELECT n_nationkey
                FROM nation
                WHERE n_regionkey = (
                    SELECT r_regionkey
                    FROM region
                    WHERE r_name = 'ASIA'
                )
            )
        ) s ON ps_suppkey = s_suppkey
        GROUP BY ps_partkey
        HAVING COUNT(*) = 4
    ) ps ON p_partkey = ps_partkey
) x
WHERE x_partkey IN (
    SELECT l_partkey
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
                WHERE n_regionkey = (
                    SELECT r_regionkey
                    FROM region
                    WHERE r_name = 'AMERICA'
                )
            )
        ) c ON c_custkey = o_custkey 
    ) o ON l_orderkey = o_orderkey
)
