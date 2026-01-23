--จงเขียนคำสั่ง SQL Commands ดังต่อไปนี้
--1. จงเขียนคำสั่งสร้างตารางสินค้า1 และใช้ชื่อแอตตริบิวต์เหมือนกับตารางสินค้าเดิม (product)
CREATE TABLE HWwattanadech.Product1 (
    ProductID VARCHAR(4) PRIMARY KEY,
    ShopID VARCHAR(4) NOT NULL,
    ProductName VARCHAR2(2000) NOT NULL,
    ProductDetail VARCHAR2(2000),
    Amount NUMBER NOT NULL,
    PricePerPiece NUMBER(10,2) NOT NULL,
    ReviewScore NUMBER(2,1),
    Picture VARCHAR2(100),
    CONSTRAINT Product1_Shop_FK 
        FOREIGN KEY (ShopID) REFERENCES HWwattanadech.Shop(ShopID)
)
ALTER TABLE HWwattanadech.Product1
ADD Categories NUMBER;

--2.แสดงการสั่งซื้อของลูกค้าที่ชื่อ "อนุชา ขยันยิ่ง"
SELECT c.CusName, ca.CartID, ca.OrderDate, p.ProductName, cd.Amount, cd.PricePerItems
FROM HWwattanadech.Customer c
JOIN HWwattanadech.Cart ca ON c.CusID = ca.CusID
JOIN HWwattanadech.CartDetail cd ON ca.CartID = cd.CartID
JOIN HWwattanadech.Product p ON cd.ProductID = p.ProductID
WHERE c.CusName = 'อนุชา ขยันยิ่ง'

--3.จงเขียนคำสั่งเพิ่มข้อมูลในตารางร้านค้า (shop) โดยกำหนดให้สามารถเพิ่มค่าทาง parameter
INSERT INTO Shop (ShopID, ShopName, ShopAddress, ShopPhone)
VALUES (:ShopID, :ShopName, :ShopAddress, :ShopPhone);



--4.แสดงข้อมูลสินค้าที่ยังไม่มีการซื้อขาย
SELECT p.*
FROM HWwattanadech.Product p
LEFT JOIN HWwattanadech.CartDetail cd
ON p.ProductID = cd.ProductID
WHERE cd.ProductID IS NULL


--5.แสดงชื่อสินค้าที่มีราคาต่อหน่วยมากที่สุด และราคาต่อหน่วยน้อยที่สุด
select P.productname, P.priceperpiece
from Product P
where P.priceperpiece = (select max(P.priceperpiece) from Product)
   or P.priceperpiece = (select min(P.priceperpiece) from Product)


--7.จงสร้างวิวแสดงข้อมูลรายการสั่งซื้อที่มีการจัดส่งสำเร็จ
CREATE VIEW HWWATTANADECH.V_SuccessfulOrders AS
SELECT ca.CartID, ca.OrderDate, p.ProductName, cd.Amount, ca.STATUS
FROM HWwattanadech.Cart ca
JOIN HWwattanadech.Customer c ON c.CusID = ca.CusID
JOIN HWwattanadech.CartDetail cd ON ca.CartID = cd.CartID
JOIN HWwattanadech.Product p ON cd.ProductID = p.ProductID
WHERE ca.Status = 'จัดส่งสำเร็จ';

SELECT * FROM HWwattanadech.V_SuccessfulOrders;

--8.แสดงข้อมูลชื่อร้านค้าและสินค้าที่อยู่ในร้าน
select S.Shopname, P.Productname
FROM HWwattanadech.Cart ca
JOIN HWwattanadech.CartDetail cd ON ca.CartID = cd.CartID
JOIN HWwattanadech.Product P ON cd.ProductID = P.ProductID
JOIN HWwattanadech.Shop S ON P.ShopID = S.ShopID


-- SELECT S.Shopid, S.Shopname
-- FROM Shop S
-- --JOIN Product P ON S.Shopid = P.Shopid
-- ORDER BY S.SHOPID 

-- SELECT p.shopid, p.productname
-- FROM Product P
-- JOIN Shop S ON P.Shopid = S.Shopid
-- ORDER BY P.SHOPID 


--9.แสดงข้อมูลการสั่งซื้อของลูกค้าที่มีจำนวนที่ซื้อสินค้ามากกว่าค่าเฉลี่ยของจำนวนที่ซื้อของการสั่งซื้อทั้งหมด
SELECT c.CusName, ca.CartID, p.ProductName, cd.Amount
FROM HWwattanadech.Customer c
JOIN HWwattanadech.Cart ca ON c.CusID = ca.CusID
JOIN HWwattanadech.CartDetail cd ON ca.CartID = cd.CartID
JOIN HWwattanadech.Product p ON cd.ProductID = p.ProductID
WHERE cd.Amount > (SELECT AVG(Amount) FROM HWwattanadech.CartDetail);

--10. แสดงข้อมูลการสั่งซื้อสินค้าตามเงื่อนไขต่อไปนี้
--ใบสั่งซื้อสินค้า B00001 แสดงชื่อลูกค้าที่สั่งซื้อ
SELECT C.CusName
FROM HWwattanadech.Cart CA
JOIN HWwattanadech.CartDetail CD ON CA.CartID = CD.CartID
JOIN HWwattanadech.Customer C ON CA.CusID = C.CusID
WHERE CA.CartID = 'B00001';
--ใบสั่งซื้อสินค้า B00002 แสดงชื่อลูกค้าที่สั่งซื้อ
SELECT C.CusName
FROM HWwattanadech.Cart CA
JOIN HWwattanadech.CartDetail CD ON CA.CartID = CD.CartID
JOIN HWwattanadech.Customer C ON CA.CusID = C.CusID
WHERE CA.CartID = 'B00002';
--ใบสั่งซื้อสินค้า B00003 แสดงชื่อลูกค้าที่สั่งซื้อ 
SELECT C.CusName
FROM HWwattanadech.Cart CA
JOIN HWwattanadech.CartDetail CD ON CA.CartID = CD.CartID
JOIN HWwattanadech.Customer C ON CA.CusID = C.CusID
WHERE CA.CartID = 'B00003';

