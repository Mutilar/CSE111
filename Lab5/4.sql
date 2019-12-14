SELECT n_name, sum_c, sum_s
FROM nation
INNER JOIN (
    SELECT c_nationkey, COUNT(*) sum_c
    FROM customer
    WHERE c_nationkey IN (
        SELECT n_nationkey
        FROM nation
        WHERE n_regionkey = (
            SELECT r_regionkey
            FROM region
            WHERE r_name = 'EUROPE'
        )
    )
    GROUP BY c_nationkey
) c ON n_nationkey = c_nationkey
INNER JOIN (
    SELECT s_nationkey, COUNT(*) sum_s
    FROM supplier
    WHERE s_nationkey IN (
        SELECT n_nationkey
        FROM nation
        WHERE n_regionkey = (
            SELECT r_regionkey
            FROM region
            WHERE r_name = 'EUROPE'
        )
    )
    GROUP BY s_nationkey
) s ON n_nationkey = s_nationkey
GROUP BY n_name