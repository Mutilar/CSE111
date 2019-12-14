SELECT MAX(l_discount)
FROM lineitem
INNER JOIN (
    SELECT o_orderkey
    FROM orders
    WHERE strftime('%Y', o_orderdate) = '1995' AND strftime('%m', o_orderdate) = '05'
) o ON l_orderkey = o_orderkey
WHERE l_discount < (
    SELECT AVG(l_discount)
    FROM lineitem
    INNER JOIN (
        SELECT o_orderkey
        FROM orders
        WHERE strftime('%Y', o_orderdate) = '1995' AND strftime('%m', o_orderdate) = '05'
    ) o ON l_orderkey = o_orderkey
)