SELECT (
    SELECT n_name 
    FROM nation
    WHERE n_nationkey = c_nationkey
) name
FROM customer
GROUP BY c_nationkey
HAVING COUNT(*) = (
    SELECT MAX(num)
    FROM
    ( 
        SELECT c_nationkey, COUNT(*) num
        FROM customer
        GROUP BY c_nationkey
    ) x
)