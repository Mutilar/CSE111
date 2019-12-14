SELECT (
    SELECT n_name 
    FROM nation
    WHERE n_nationkey = s_nationkey
)
FROM supplier
INNER JOIN (
    SELECT l_suppkey, SUM(l_extendedprice) val_per_supp
    FROM lineitem
    WHERE strftime('%Y', l_shipdate) = '1996'
    GROUP BY l_suppkey
) l ON s_suppkey = l_suppkey
GROUP BY s_nationkey
HAVING SUM(val_per_supp) = (
    SELECT MAX(val_per_nation)
    FROM
    ( 
        SELECT s_nationkey, SUM(val_per_supp) val_per_nation
        FROM supplier
        INNER JOIN (
            SELECT l_suppkey, SUM(l_extendedprice) val_per_supp
            FROM lineitem
            WHERE strftime('%Y', l_shipdate) = '1996'
            GROUP BY l_suppkey
        ) l ON s_suppkey = l_suppkey
        GROUP BY s_nationkey
    ) x
)