use ludycakeshop

CREATE TABLE Category
(
	CategoryID VARCHAR(36) NOT NULL CONSTRAINT PK_Category_CategoryID PRIMARY KEY,
	CategoryName VARCHAR(30) NOT NULL,
	CategoryDescription VARCHAR(255) NULL, 
	CategoryImage IMAGE NULL
)

CREATE TABLE Product
(
	ProductID VARCHAR(36) NOT NULL CONSTRAINT PK_Product_ProductID PRIMARY KEY,
	ProductName VARCHAR(25) NOT NULL,
	ProductDescription VARCHAR(200) NULL,
	QuantityAvailable INT NOT NULL,
	UnitPrice MONEY NOT NULL,
	Discontinued BIT NOT NULL CONSTRAINT DK_Product_Discontinued DEFAULT(0),
	QuantityPerUnit VARCHAR(30) NULL,
	CategoryID VARCHAR(36) NOT NULL CONSTRAINT FK_Product_CategoryID REFERENCES Category(CategoryID),
	ProductImage IMAGE NULL
)

CREATE TABLE Orders
(
	OrderID VARCHAR(36) NOT NULL CONSTRAINT PK_Orders_OrderID PRIMARY KEY,
	OrderNumber INT NOT NULL CONSTRAINT DF_Orders_OrderNumber DEFAULT (FLOOR(RAND() * (1000000-100 + 1)) + 100),
	InvoiceNumber INT NULL,
	OrderDate DATETIME NOT NULL CONSTRAINT DK_Orders_OrderDate DEFAULT(GETDATE()),
	OrderStatus VARCHAR(20) NOT NULL CONSTRAINT CHK_Orders_OrderStatus CHECK (OrderStatus IN ('Submitted', 'Completed', 'For-Pickup', 'Preparing')),
	GST MONEY NOT NULL,
	SubTotal MONEY NOT NULL,
	SaleTotal MONEY NOT NULL,
	CustomerName VARCHAR(40) NOT NULL,
	CustomerAddress VARCHAR(50) NULL,
	CustomerEmail VARCHAR(30) NULL,
	CustomerContactNumber VARCHAR(20) NOT NULL,
	Note VARCHAR(255) NULL,
)

CREATE TABLE OrderItem
(	
	OrderID VARCHAR(36) NOT NULL CONSTRAINT FK_OrderItem_OrderID REFERENCES Orders(OrderID),
	ProductID VARCHAR(36) NOT NULL CONSTRAINT FK_OrderItem_ProductID REFERENCES Product(ProductID),
	ItemQuantity INT NOT NULL,
	ItemTotal MONEY NOT NULL,
	CONSTRAINT PK_OrderItem PRIMARY KEY (OrderID, ProductID)
)

CREATE TABLE BulkOrders
(
	OrderID VARCHAR(36) NOT NULL CONSTRAINT PK_BulkOrders_OrderID PRIMARY KEY,
	OrderNumber INT NOT NULL CONSTRAINT DF_BulkOrders_OrderNumber DEFAULT (FLOOR(RAND() * (1000000-100 + 1)) + 100),
	InvoiceNumber INT NULL,
	OrderDate DATETIME NOT NULL CONSTRAINT DK_BulkOrders_OrderDate DEFAULT(GETDATE()),
	BulkOrderStatus VARCHAR(20) NOT NULL CONSTRAINT CHK_BulkOrders_BulkOrderStatus CHECK (BulkOrderStatus IN ('Submitted', 'Completed', 'Processing')),
	GST MONEY NOT NULL,
	SubTotal MONEY NOT NULL,
	SaleTotal MONEY NOT NULL,
	CompanyName VARCHAR(40) NOT NULL,
	CompanyAddress VARCHAR(50) NULL,
	CompanyEmail VARCHAR(30) NULL,
	CompanyContactNumber VARCHAR(20) NOT NULL,
	CompanyContactPerson VARCHAR(40) NOT NULL,
	Note VARCHAR(255) NULL,
)

CREATE TABLE BulkOrderItem
(	
	OrderID VARCHAR(36) NOT NULL CONSTRAINT FK_BulkOrderItem_OrderID REFERENCES BulkOrders(OrderID),
	ProductID VARCHAR(36) NOT NULL CONSTRAINT FK_BulkOrderItem_ProductID REFERENCES Product(ProductID),
	ItemQuantity INT NOT NULL,
	ItemTotal MONEY NOT NULL,
	CONSTRAINT PK_BulkOrderItem PRIMARY KEY (OrderID, ProductID)
)

CREATE TABLE UserAccount
(
	UserAccountID INT IDENTITY (1,1) NOT NULL CONSTRAINT PK_UserAccount_UserAccountID PRIMARY KEY,
	Username VARCHAR(30) NOT NULL CONSTRAINT U_UserAccount_Username UNIQUE (Username),
	Password VARCHAR(60) NOT NULL,
)
