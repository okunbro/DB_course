--1
SELECT goods.*, manufacturers.*
FROM goods CROSS JOIN manufacturers;

--2
SELECT *
FROM workers, workers AS collegues
WHERE(workers.chief=collegues.chief)
  AND(workers.passport_no != collegues.passport_no)
  AND (workers.passport_no < collegues.passport_no);

--3
SELECT goods.*, manufacturers.*
FROM goods INNER JOIN  manufacturers
ON goods.manufacturer_code = manufacturers.code;

--4
SELECT goods.name,goods.price, holds.amount,
       warehouses.name,round(goods.price*holds.amount,2) AS total_price
FROM (goods INNER JOIN  holds
ON goods.code = holds.goods_code)
    INNER JOIN warehouses
            ON holds.warehouse_code = warehouses.code
ORDER BY goods.name,warehouses.name;

--5
SELECT warehouses.name AS warehouse_name,
       workers.last_name || ' ' || workers.first_name || ' ' ||  workers.middle_name AS chief_name
FROM warehouses INNER JOIN  workers
ON workers.passport_no = warehouses.chief_passport_no;

--6
SELECT goods.name, holds.warehouse_code, holds.amount
FROM goods INNER JOIN holds
       ON goods.code=holds.goods_code
WHERE holds.amount >=15;

--7
    SELECT marriage.wife_passport_no, marriage.husband_passport_no,
           husbands.last_name || ' ' || husbands.first_name || ' ' ||  husbands.middle_name AS husband_name,
           wifes.last_name || ' ' || wifes.first_name || ' ' ||  wifes.middle_name AS wife_name
        FROM (marriage INNER JOIN workers as husbands
            ON husbands.passport_no=marriage.husband_passport_no)
    INNER JOIN workers as wifes ON wifes.passport_no=marriage.wife_passport_no;

--8
    SELECT goods.name, holds.amount, warehouses.name
    FROM goods LEFT JOIN
        (holds    INNER JOIN warehouses
          ON holds.warehouse_code=warehouses.code)
        ON goods.code=holds.goods_code;

--9
     SELECT goods.*
    FROM goods INNER holds
    ON holds.goods_code=goods.code;

--10
    SELECT goods.*
    FROM goods LEFT JOIN holds
    ON holds.goods_code=goods.code
     WHERE holds.warehouse_code IS NULL ;

--11
    SELECT workers.*
    FROM workers LEFT JOIN marriage
    ON(workers.passport_no=marriage.wife_passport_no) OR(workers.passport_no=marriage.husband_passport_no)
    WHERE marriage.husband_passport_no IS NULL;

--12
SELECT workers.*
    FROM workers LEFT JOIN warehouses
ON workers.passport_no = warehouses.chief_passport_no
Where warehouses.code is NULL;