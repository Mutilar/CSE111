SELECT SUM(ps_supplycost)
FROM partsupp
    INNER JOIN (
    SELECT p_partkey, l_suppkey
    FROM lineitem
    INNER JOIN (
        SELECT p_partkey
        FROM part
        WHERE p_retailprice < 1000
    ) p ON p_partkey = l_partkey
    WHERE strftime('%Y', l_shipdate) = '1996' AND l_suppkey NOT IN (
        SELECT s_suppkey
        FROM supplier
        INNER JOIN (
            SELECT l_suppkey l1_key
            FROM lineitem
            WHERE strftime('%Y', l_shipdate) = '1995' AND l_extendedprice < 1000
        ) l1 ON l1_key = s_suppkey
    ) 
) l ON ps_partkey = p_partkey AND l_suppkey = ps_suppkey