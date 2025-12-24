--1แสดงข้อมูลสินค้าที่มีการซื้อมากสุด และน้อยที่สุด
SELECT p.ProductID, p.ProductName, SUM(cd.Amount) AS TotalSold
FROM HWwattanadech.Product p
JOIN HWwattanadech.CartDetail cd
ON p.ProductID = cd.ProductID
GROUP BY p.ProductID, p.ProductName
HAVING SUM(cd.Amount) = (
        SELECT MAX(SUM(Amount))
        FROM HWwattanadech.CartDetail
        GROUP BY ProductID
     )
   OR SUM(cd.Amount) = (
        SELECT MIN(SUM(Amount))
        FROM HWwattanadech.CartDetail
        GROUP BY ProductID
     );

--2 แสดงข้อมูลลูกค้าที่มีการสั่งซื้อสินค้า
SELECT DISTINCT c.*
FROM HWwattanadech.Customer c
JOIN HWwattanadech.Cart ca
ON c.CusID = ca.CusID;

--3 แสดงรายการสั่งซื้อสินค้าของลูกค้าที่มีชื่อว่า โสภา วิภา
SELECT c.CusName, ca.CartID, ca.OrderDate, p.ProductName, cd.Amount, cd.PricePerItems
FROM HWwattanadech.Customer c
JOIN HWwattanadech.Cart ca ON c.CusID = ca.CusID
JOIN HWwattanadech.CartDetail cd ON ca.CartID = cd.CartID
JOIN HWwattanadech.Product p ON cd.ProductID = p.ProductID
WHERE c.CusName = 'โสภา วิภา';

--4 แสดงข้อมูลเรทติ้งของร้านค้า โดยเรียงจากมากไปหาน้อย
SELECT ShopID, ShopName, Rating
FROM HWwattanadech.Shop
ORDER BY Rating DESC;

--5 แสดงข้อมูลสินค้า โดยกำหนดให้เมื่อ
--      - จำนวนสินค้าเหลือน้อยกว่า 10 แสดงข้อความว่า product is low
--      - จำนวนสินค้ามีมากกว่า 10 – 1000 แสดงข้อความว่า There is enough product
--           - จำนวนสินค้ามีมากกว่า 1000 ขึ้นไป แสดงข้อความว่า There are a lot of products
--      และหากมีเงื่อนไขเป็นอย่างอื่น แสดงข้อความว่า product is the amount of error
SELECT ProductID, ProductName, Amount,
CASE
    WHEN Amount < 10 THEN 'product is low'
    WHEN Amount BETWEEN 10 AND 1000 THEN 'There is enough product'
    WHEN Amount > 1000 THEN 'There are a lot of products'
    ELSE 'product is the amount of error'
END AS ProductStatus
FROM HWwattanadech.Product;


--6. แสดงข้อมูลสินค้าที่ยังไม่ถูกซื้อ
SELECT p.*
FROM HWwattanadech.Product p
LEFT JOIN HWwattanadech.CartDetail cd
ON p.ProductID = cd.ProductID
WHERE cd.ProductID IS NULL;

--7. จงสร้างวิวเก็บข้อมูลลูกค้าที่มีการสั่งซื้อสินค้า
CREATE VIEW HWwattanadech.V_Customer_Order AS
SELECT DISTINCT c.CusID, c.CusName, c.Address, c.Tel, c.Email
FROM HWwattanadech.Customer c
JOIN HWwattanadech.Cart ca
ON c.CusID = ca.CusID;

SELECT * FROM HWwattanadech.V_Customer_Order;
