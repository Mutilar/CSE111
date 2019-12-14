SELECT o_orderpriority, COUNT(*)
FROM orders
INNER JOIN (
    SELECT DISTINCT l_orderkey
    FROM lineitem
    WHERE l_receiptdate > l_commitdate
) l ON l_orderkey = o_orderkey
WHERE strftime('%Y', o_orderdate) = '1996' AND strftime('%m', o_orderdate) IN ('10', '11', '12')
GROUP BY o_orderpriority