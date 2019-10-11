SELECT o_orderpriority, COUNT(*)
FROM orders
INNER JOIN (
    SELECT l_orderkey
    FROM lineitem
    WHERE l_receiptdate < l_commitdate
) l ON l_orderkey = o_orderkey
WHERE YEAR(o_orderdate) = 1996
GROUP BY o_orderpriority