SELECT n_name, total
FROM nation
INNER JOIN ( 
	SELECT s_nationkey, COUNT(*) total
    FROM supplier
    GROUP BY s_nationkey
) s ON s_nationkey = n_nationkey