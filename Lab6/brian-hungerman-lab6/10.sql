SELECT s_reg 
FROM (
    SELECT (
        SELECT r_name 
        FROM region 
        WHERE r_regionkey = (
            SELECT n_regionkey 
            FROM nation 
            WHERE n_nationkey = (
                SELECT s_nationkey
                FROM supplier
                WHERE s_suppkey = l_suppkey
            )
        )
        ) s_reg, (
        SELECT r_name 
        FROM region 
        WHERE r_regionkey = (
            SELECT n_regionkey 
            FROM nation 
            WHERE n_nationkey = (
                SELECT c_nationkey
                FROM customer
                WHERE c_custkey = o_custkey
            )
        )
        ) c_reg, SUM(l_extendedprice) val
    FROM lineitem
    INNER JOIN (
        SELECT o_custkey, o_orderkey
        FROM orders
    ) o ON l_orderkey = o_orderkey
    WHERE s_reg = c_reg
    GROUP BY s_reg
    HAVING val = (
        SELECT MAX(val_tot)
        FROM
        ( 
            SELECT (
                SELECT r_name 
                FROM region 
                WHERE r_regionkey = (
                    SELECT n_regionkey 
                    FROM nation 
                    WHERE n_nationkey = (
                        SELECT s_nationkey
                        FROM supplier
                        WHERE s_suppkey = l_suppkey
                    )
                )
            ) s_reg, (
                SELECT r_name 
                FROM region 
                WHERE r_regionkey = (
                    SELECT n_regionkey 
                    FROM nation 
                    WHERE n_nationkey = (
                        SELECT c_nationkey
                        FROM customer
                        WHERE c_custkey = o_custkey
                    )
                )
            ) c_reg, SUM(l_extendedprice) val_tot
            FROM lineitem
            INNER JOIN (
                SELECT o_custkey, o_orderkey
                FROM orders
            ) o ON l_orderkey = o_orderkey
            WHERE s_reg = c_reg
            GROUP BY s_reg

        ) x
    )
) y