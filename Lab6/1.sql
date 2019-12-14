SELECT strftime('%m', l_shipdate) month, AVG(l_quantity)
FROM lineitem
WHERE strftime('%Y', l_shipdate) = '1996'
GROUP BY month