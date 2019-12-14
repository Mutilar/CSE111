SELECT COUNT(*)
FROM (
	SELECT (ps_supplycost * ps_availqty) val, ps_suppkey
	FROM partsupp
	ORDER BY val DESC
	LIMIT ((SELECT COUNT(*) FROM partsupp) * .03)
)
INNER JOIN (
	SELECT s_suppkey
	FROM supplier
	INNER JOIN (
		SELECT n_nationkey
		FROM nation
		WHERE n_name = 'CANADA'
	) n ON s_nationkey = n_nationkey
) s ON s_suppkey = ps_suppkey