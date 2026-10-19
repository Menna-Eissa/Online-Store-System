-- Online Store System: schema (SQL Server / T-SQL)
CREATE DATABASE EERD_DB;
GO
USE EERD_DB;
GO

CREATE TABLE Category (
    Cat_id      INT PRIMARY KEY,
    Cat_Name    VARCHAR(100) NOT NULL,
    Description TEXT
);

CREATE TABLE Product (
    Product_id  INT PRIMARY KEY,
    Name        VARCHAR(150) NOT NULL,
    Description TEXT,
    Price       DECIMAL(10,2) NOT NULL,
    Quantity    INT NOT NULL DEFAULT 0,
    Cat_id      INT,
    FOREIGN KEY (Cat_id) REFERENCES Category(Cat_id)
);

-- Product specialization (disjoint): Physical / Digital
CREATE TABLE Physical_Product (
    Product_id    INT PRIMARY KEY,
    Weight        DECIMAL(8,3),
    Dimensions    VARCHAR(100),
    Shipping_Cost DECIMAL(8,2),
    FOREIGN KEY (Product_id) REFERENCES Product(Product_id)
);

CREATE TABLE Digital_Product (
    Product_id    INT PRIMARY KEY,
    File_Size     DECIMAL(10,2),
    Download_Link VARCHAR(500),
    Format        VARCHAR(50),
    FOREIGN KEY (Product_id) REFERENCES Product(Product_id)
);

CREATE TABLE Customer (
    Customer_id INT PRIMARY KEY,
    First_Name  VARCHAR(100) NOT NULL,
    Last_Name   VARCHAR(100) NOT NULL,
    Email       VARCHAR(200) UNIQUE NOT NULL,
    Phone       VARCHAR(20),
    Address     TEXT,
    Password    VARCHAR(255) NOT NULL
);

CREATE TABLE Orders (
    Order_id     INT PRIMARY KEY,
    Order_Date   DATE NOT NULL,
    Status       VARCHAR(50) NOT NULL,
    Total_Amount DECIMAL(12,2) NOT NULL,
    Customer_id  INT NOT NULL,
    FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id)
);

CREATE TABLE OrderDetails (
    OrderDetails_ID INT PRIMARY KEY,
    Order_id        INT NOT NULL,
    Product_id      INT NOT NULL,
    Quantity        INT NOT NULL,
    Unit_Price      DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (Order_id)   REFERENCES Orders(Order_id),
    FOREIGN KEY (Product_id) REFERENCES Product(Product_id)
);

CREATE TABLE Shipment (
    ship_id     INT PRIMARY KEY,
    ship_Date   DATE,
    Ship_Status VARCHAR(50),
    Tracking_No VARCHAR(100),
    Order_id    INT NOT NULL,
    FOREIGN KEY (Order_id) REFERENCES Orders(Order_id)
);

CREATE TABLE Payment (
    Payment_id  INT PRIMARY KEY,
    Pay_Date    DATE NOT NULL,
    Pay_Amount  DECIMAL(12,2) NOT NULL,
    Order_id    INT NOT NULL,
    FOREIGN KEY (Order_id) REFERENCES Orders(Order_id)
);

-- Payment specialization (disjoint): Card / Cash
CREATE TABLE Card (
    Payment_id  INT PRIMARY KEY,
    Card_No     VARCHAR(20) NOT NULL,
    Expiry_Date DATE NOT NULL,
    CVV         VARCHAR(5) NOT NULL,
    FOREIGN KEY (Payment_id) REFERENCES Payment(Payment_id)
);

-- Card specialization (disjoint): Credit / Debit
CREATE TABLE Credit_Card (
    Payment_id   INT PRIMARY KEY,
    Credit_Limit DECIMAL(12,2),
    FOREIGN KEY (Payment_id) REFERENCES Card(Payment_id)
);

CREATE TABLE Debit_Card (
    Payment_id INT PRIMARY KEY,
    Bank_Name  VARCHAR(100),
    FOREIGN KEY (Payment_id) REFERENCES Card(Payment_id)
);

CREATE TABLE Cash (
    Payment_id INT PRIMARY KEY,
    Invoice    VARCHAR(100),
    FOREIGN KEY (Payment_id) REFERENCES Payment(Payment_id)
);

-- Cash specialization (disjoint): Cash on delivery / In-store
CREATE TABLE Cash_On_Delivery (
    Payment_id    INT PRIMARY KEY,
    Delivery_Date DATE,
    Delivery_Emp  VARCHAR(100),
    FOREIGN KEY (Payment_id) REFERENCES Cash(Payment_id)
);

CREATE TABLE In_Store_Cash (
    Payment_id     INT PRIMARY KEY,
    Store_Location VARCHAR(200),
    Cashier_Name   VARCHAR(100),
    FOREIGN KEY (Payment_id) REFERENCES Cash(Payment_id)
);
