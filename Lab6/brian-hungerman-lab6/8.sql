-- Find how many customers have at least one order supplied only by suppliers from ASIA.

SELECT COUNT(*) 
FROM (
    SELECT o_custkey
    FROM orders
    WHERE o_orderkey IN (
        SELECT l_orderkey
        FROM lineitem
        WHERE l_suppkey IN (
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
        )
    )
    GROUP BY o_custkey 
) x