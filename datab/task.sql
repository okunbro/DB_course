--a
SELECT workers.last_name, workers.first_name
FROM workers;

--b
SELECT goods.name, round(goods.price*9.5, 2) AS "cost for 10"
FROM goods;

--c
SELECT goods.*
FROM goods
ORDER BY goods.name ;

--d
SELECT workers.*
FROM workers
ORDER BY workers.qualification, workers.passport_no DESC;