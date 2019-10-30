SELECT COUNT(*)
FROM (
    SELECT ps_suppkey
    FROM partsupp
    INNER JOIN (
        SELECT s_suppkey
        FROM supplier
        WHERE s_nationkey = (SELECT n_nationkey FROM nation WHERE n_name = 'CANADA')
    ) s ON ps_suppkey = s_suppkey
    GROUP BY ps_suppkey
    HAVING COUNT(*) >= 4
) x