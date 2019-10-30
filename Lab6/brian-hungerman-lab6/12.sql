SELECT (
    SELECT n_name 
    FROM nation
    WHERE n_nationkey = c_nationkey
)
FROM orders
INNER JOIN (
    SELECT c_custkey, c_nationkey
    FROM customer
) c ON o_custkey = c_custkey
GROUP BY c_nationkey
HAVING SUM(o_totalprice) = (
    SELECT MAX(tot)
    FROM
    ( 
        SELECT c_nationkey, SUM(o_totalprice) tot
        FROM orders
        INNER JOIN (
            SELECT c_custkey, c_nationkey
            FROM customer
        ) c ON o_custkey = c_custkey
        GROUP BY c_nationkey
    )
)
