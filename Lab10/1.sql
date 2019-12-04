CREATE TRIGGER orders_now
AFTER INSERT ON orders
BEGIN
	UPDATE ORDERS
	SET o_orderdate = '2018-11-26 06:04:22' 
	WHERE o_orderdate = '2007-01-01 10:00:00';
END;


INSERT INTO orders (O_ORDERKEY, O_CUSTKEY, O_ORDERSTATUS, O_TOTALPRICE, O_ORDERDATE, O_ORDERPRIORITY, O_CLERK, O_SHIPPRIORITY, O_COMMENT)
SELECT O_ORDERKEY, O_CUSTKEY, O_ORDERSTATUS, O_TOTALPRICE, '2007-01-01 10:00:00', O_ORDERPRIORITY, O_CLERK, O_SHIPPRIORITY, O_COMMENT
FROM orders
WHERE strftime('%m', O_ORDERDATE) = '08' AND strftime('%Y', O_ORDERDATE) = '1996';

SELECT * FROM orders WHERE o_orderdate) = '2018-11-26 06:04:22';