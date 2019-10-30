SELECT COUNT(*)
FROM (
    SELECT o_custkey
    FROM orders
    WHERE strftime('%Y', o_orderdate) = '1995' AND strftime('%m', o_orderdate) = '08'
    GROUP BY o_custkey
    HAVING COUNT(*) <= 2
) x