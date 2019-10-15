SELECT (
    SELECT SUM(l_extendedprice * (1-l_discount))
    FROM lineitem
    WHERE strftime('%Y', l_shipdate) = '1996' AND l_suppkey IN (
        SELECT s_suppkey
        FROM supplier
        WHERE s_nationkey = (
            SELECT n_nationkey 
            FROM nation 
            WHERE n_name = 'UNITED STATES'
        )
    ) AND l_orderkey IN (
        SELECT o_orderkey
        FROM orders
        INNER JOIN (
            SELECT c_custkey
            FROM customer
            INNER JOIN (
                SELECT n_nationkey 
                FROM nation 
                WHERE n_regionkey = (
                    SELECT r_regionkey
                    FROM region
                    WHERE r_name = 'EUROPE'
                )
            ) n ON n_nationkey = c_nationkey
        ) c ON o_custkey = c_custkey
    )
) / SUM(l_extendedprice * (1-l_discount))
FROM lineitem
WHERE strftime('%Y', l_shipdate) = '1996' AND l_orderkey IN (
    SELECT o_orderkey
    FROM orders
    INNER JOIN (
        SELECT c_custkey
        FROM customer
        INNER JOIN (
            SELECT n_nationkey 
            FROM nation 
            WHERE n_regionkey = (
                SELECT r_regionkey
                FROM region
                WHERE r_name = 'EUROPE'
            )
        ) n ON n_nationkey = c_nationkey
    ) c ON o_custkey = c_custkey
)
