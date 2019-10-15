SELECT (SELECT s_name FROM supplier WHERE s_suppkey = l_suppkey), (SELECT c_name FROM customer WHERE c_custkey = o_custkey)
FROM lineitem
INNER JOIN (
    SELECT o_orderkey, o_custkey
    FROM orders
    WHERE o_orderstatus = 'F' AND o_totalprice = (
        SELECT MAX(o_totalprice)
        FROM orders
        WHERE o_orderstatus = 'F'
    )
) o ON o_orderkey = l_orderkey