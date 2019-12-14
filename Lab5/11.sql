SELECT MAX(l_extendedprice * (1-l_discount))
FROM lineitem
WHERE l_shipdate > '1994-10-02'