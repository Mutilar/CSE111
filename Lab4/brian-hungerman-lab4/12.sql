SELECT (SELECT r_name FROM region WHERE r_regionkey = (SELECT n_regionkey FROM nation WHERE n_nationkey = s_nationkey)) regionname, MAX(s_acctbal) largest
FROM supplier
GROUP BY regionname