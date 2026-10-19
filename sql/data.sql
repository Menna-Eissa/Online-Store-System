-- Online Store System: sample data
USE EERD_DB;
GO

INSERT INTO Category VALUES
(1, 'Electronics',    'Electronic devices and accessories'),
(2, 'Clothing',       'Men, women and children apparel'),
(3, 'Books',          'Printed and digital books'),
(4, 'Home Furniture', 'Furniture and home decor'),
(5, 'Cosmetics',      'Skin and hair care products');

INSERT INTO Product VALUES
(101, 'Lenovo IdeaPad Laptop',        'Core i5 12th Gen, 8GB RAM, 512GB SSD',            18999.00, 30,   1),
(102, 'Egyptian Cotton Galabiya',     '100% cotton traditional galabiya, all sizes',      250.00,  200,  2),
(103, 'Azazeel Novel by Youssef Ziedan', 'Arabic Booker Prize winning historical novel', 120.00,  150,  3),
(104, '5-Piece Sofa Set',             'Modern beech wood frame with velvet upholstery',  12500.00, 15,   4),
(105, 'NIVEA Body Cream 200ml',       'Deep moisturizing cream for face and body',        89.00,   500,  5),
(106, 'Programming in Arabic PDF Book', 'Complete Arabic programming course - PDF file',  199.00,  9999, 3),
(107, 'JBL Tune 510BT Headphones',    'Wireless Bluetooth headphones, high quality',     1350.00,  80,   1);

INSERT INTO Physical_Product VALUES
(101, 2.100,  '37 x 25 x 2 cm',   150.00),
(102, 0.400,  '35 x 25 x 5 cm',   25.00),
(103, 0.350,  '21 x 14 x 2 cm',   20.00),
(104, 85.000, '210 x 95 x 90 cm', 350.00),
(105, 0.220,  '10 x 6 x 6 cm',    15.00),
(107, 0.180,  '20 x 18 x 4 cm',   30.00);

INSERT INTO Digital_Product VALUES
(106, 45.5, 'https://downloads.example.eg/programming-arabic.pdf', 'PDF');

INSERT INTO Customer VALUES
(1, 'Ahmed',   'El-Sayed', 'ahmed.elsayed@gmail.com',    '01012345678', '15 Tahrir Street, Downtown, Cairo',      '$2b$12$hashedpassword1'),
(2, 'Mona',    'Ibrahim',  'mona.ibrahim@yahoo.com',     '01098765432', '8 Road 9, Maadi, Cairo',                 '$2b$12$hashedpassword2'),
(3, 'Karim',   'Abdallah', 'karim.abdallah@outlook.com', '01155556789', '42 Haram Street, Giza',                  '$2b$12$hashedpassword3'),
(4, 'Sara',    'Mahmoud',  'sara.mahmoud@hotmail.com',   '01234567890', '27 Abbas El-Akkad, Nasr City, Cairo',    '$2b$12$hashedpassword4'),
(5, 'Mohamed', 'Othman',   'mohamed.othman@gmail.com',   '01501112233', '3 Corniche Road, Sidi Bishr, Alexandria','$2b$12$hashedpassword5');

INSERT INTO Orders VALUES
(1001, '2024-11-01', 'Completed',        18999.00, 1),
(1002, '2024-11-05', 'Out for Delivery', 370.00,   2),
(1003, '2024-11-10', 'Completed',        199.00,   3),
(1004, '2024-11-15', 'Cancelled',        12500.00, 4),
(1005, '2024-11-20', 'Processing',       1439.00,  5);

INSERT INTO OrderDetails VALUES
(5001, 1001, 101, 1, 18999.00),
(5002, 1002, 102, 2, 250.00),
(5003, 1002, 105, 1, 89.00),   -- NIVEA bundled with Galabiya order
(5004, 1003, 106, 1, 199.00),
(5005, 1004, 104, 1, 12500.00),
(5006, 1005, 107, 1, 1350.00),
(5007, 1005, 105, 1, 89.00);

INSERT INTO Shipment VALUES
(7001, '2024-11-03', 'Delivered',  'EG-SHIP-00291', 1001),
(7002, '2024-11-07', 'In Transit', 'EG-SHIP-00302', 1002),
(7003, '2024-11-11', 'Delivered',  'EG-SHIP-00318', 1003),
(7004, '2024-11-21', 'Dispatched', 'EG-SHIP-00335', 1005);

INSERT INTO Payment VALUES
(9001, '2024-11-01', 18999.00, 1001),
(9002, '2024-11-05', 370.00,   1002),
(9003, '2024-11-10', 199.00,   1003),
(9004, '2024-11-20', 1439.00,  1005);

INSERT INTO Card VALUES
(9001, '4111111111111111', '2026-08-01', '123'),  -- Ahmed: Visa credit card
(9003, '5500005555555559', '2025-12-01', '456');  -- Karim: Mastercard debit

INSERT INTO Credit_Card VALUES
(9001, 50000.00);  -- Ahmed's credit card limit (EGP)

INSERT INTO Debit_Card VALUES
(9003, 'National Bank of Egypt');  -- Karim's debit card

INSERT INTO Cash VALUES
(9002, 'INV-EG-2024-1002'),  -- Mona: cash on delivery
(9004, 'INV-EG-2024-1005');  -- Mohamed: in-store cash

INSERT INTO Cash_On_Delivery VALUES
(9002, '2024-11-07', 'Mostafa Ali');  -- Delivery employee

INSERT INTO In_Store_Cash VALUES
(9004, 'Mall of Arabia Branch, Giza', 'Norhan Hassan');
