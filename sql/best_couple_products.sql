-- TASK:
-- BEST PRODUCTS WHICH BUY TOGETHER BY ONE ORDER
-- GIVEN:
-- CREATE TEMPORARY TABLE temp_table_name(
--  order_id int,
--  product_id int);
--
-- INSERT INTO temp_table_name(order_id, product_id)
-- VALUES
--    (1,1),
--    (1,2),
--    (1,3),
--    (2,1),
--    (2,2);

SELECT o1.product_id,
       o2.product_id
FROM temp_table_name o1
JOIN temp_table_name o2
    ON o1.order_id=o2.order_id
    AND o1.product_id < o2.product_id
GROUP BY o1.product_id, o2.product_id
HAVING count(*) >1


-- OR


SELECT o1.product_id,
       o2.product_id,
       COUNT(*) as cnt
FROM temp_table_name o1
JOIN temp_table_name o2
    ON o1.order_id=o2.order_id
    AND o1.product_id < o2.product_id
GROUP BY o1.product_id, o2.product_id
