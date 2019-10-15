SELECT r1_name, COUNT(*)
FROM supplier
INNER JOIN (
    SELECT n_nationkey, r1_name
    FROM nation
    INNER JOIN (
        SELECT r_name r1_name, r_regionkey
        FROM region
    ) r ON n_regionkey = r_regionkey
) n ON n_nationkey = s_nationkey
INNER JOIN (
    SELECT r_name, AVG(s_acctbal) avg_bal
    FROM supplier
    INNER JOIN (
        SELECT n_nationkey, r_name
        FROM nation
        INNER JOIN (
            SELECT r_name, r_regionkey
            FROM region
        ) r ON n_regionkey = r_regionkey
    ) n ON n_nationkey = s_nationkey
    GROUP BY r_name
) s_avg ON r_name = r1_name
WHERE s_acctbal > avg_bal
GROUP BY r_name
