
SELECT COUNT(*)
FROM customer
WHERE c_nationkey NOT IN (
	SELECT n_nationkey
	FROM nation
	WHERE n_regionkey IN (
		SELECT r_regionkey
		FROM region
		WHERE r_name = 'EUROPE' OR r_name = 'AFRICA'
	)
)