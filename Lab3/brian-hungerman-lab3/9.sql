SELECT (SELECT n_name FROM nation WHERE n_nationkey = s_nationkey) AS country, COUNT(*), AVG(s_acctbal)
FROM supplier
GROUP BY s_nationkey
HAVING COUNT(*) >= 5