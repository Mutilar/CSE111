SELECT s_name, s_acctbal
FROM supplier
WHERE s_acctbal = (SELECT min(s_acctbal) FROM supplier);