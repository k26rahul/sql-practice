-- =========================
-- Northwind-style Schema
-- MySQL DDL
-- =========================
CREATE DATABASE IF NOT EXISTS northwind;

USE northwind;

-- =========================
-- Categories
-- =========================
CREATE TABLE
  Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255) NOT NULL,
    Description TEXT,
    Picture BLOB
  );

-- =========================
-- CustomerDemographics
-- =========================
CREATE TABLE
  CustomerDemographics (
    CustomerTypeID VARCHAR(20) PRIMARY KEY,
    CustomerDesc TEXT
  );

-- =========================
-- Customers
-- =========================
CREATE TABLE
  Customers (
    CustomerID VARCHAR(10) PRIMARY KEY,
    CompanyName VARCHAR(255) NOT NULL,
    ContactName VARCHAR(255),
    ContactTitle VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(100),
    Region VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100),
    Phone VARCHAR(50),
    Fax VARCHAR(50)
  );

-- =========================
-- CustomerCustomerDemo (M:N)
-- =========================
CREATE TABLE
  CustomerCustomerDemo (
    CustomerID VARCHAR(10),
    CustomerTypeID VARCHAR(20),
    PRIMARY KEY (CustomerID, CustomerTypeID),
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID),
    FOREIGN KEY (CustomerTypeID) REFERENCES CustomerDemographics (CustomerTypeID)
  );

-- =========================
-- Employees
-- =========================
CREATE TABLE
  Employees (
    EmployeeID INT PRIMARY KEY,
    LastName VARCHAR(255) NOT NULL,
    FirstName VARCHAR(255) NOT NULL,
    Title VARCHAR(255),
    TitleOfCourtesy VARCHAR(50),
    BirthDate DATE,
    HireDate DATE,
    Address VARCHAR(255),
    City VARCHAR(100),
    Region VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100),
    HomePhone VARCHAR(50),
    Extension VARCHAR(10),
    Photo BLOB,
    Notes TEXT,
    ReportsTo INT,
    PhotoPath VARCHAR(255),
    FOREIGN KEY (ReportsTo) REFERENCES Employees (EmployeeID)
  );

-- =========================
-- Regions
-- =========================
CREATE TABLE
  Regions (
    RegionID INT PRIMARY KEY,
    RegionDescription VARCHAR(255) NOT NULL
  );

-- =========================
-- Territories
-- =========================
CREATE TABLE
  Territories (
    TerritoryID VARCHAR(20) PRIMARY KEY,
    TerritoryDescription VARCHAR(255) NOT NULL,
    RegionID INT,
    FOREIGN KEY (RegionID) REFERENCES Regions (RegionID)
  );

-- =========================
-- EmployeeTerritories (M:N)
-- =========================
CREATE TABLE
  EmployeeTerritories (
    EmployeeID INT,
    TerritoryID VARCHAR(20),
    PRIMARY KEY (EmployeeID, TerritoryID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID),
    FOREIGN KEY (TerritoryID) REFERENCES Territories (TerritoryID)
  );

-- =========================
-- Shippers
-- =========================
CREATE TABLE
  Shippers (
    ShipperID INT PRIMARY KEY,
    CompanyName VARCHAR(255) NOT NULL,
    Phone VARCHAR(50)
  );

-- =========================
-- Suppliers
-- =========================
CREATE TABLE
  Suppliers (
    SupplierID INT PRIMARY KEY,
    CompanyName VARCHAR(255) NOT NULL,
    ContactName VARCHAR(255),
    ContactTitle VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(100),
    Region VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100),
    Phone VARCHAR(50),
    Fax VARCHAR(50),
    HomePage TEXT
  );

-- =========================
-- Products
-- =========================
CREATE TABLE
  Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    SupplierID INT,
    CategoryID INT,
    QuantityPerUnit VARCHAR(100),
    UnitPrice DECIMAL(10, 2),
    UnitsInStock INT,
    UnitsOnOrder INT,
    ReorderLevel INT,
    Discontinued BOOLEAN,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers (SupplierID),
    FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID)
  );

-- =========================
-- Orders
-- =========================
CREATE TABLE
  Orders (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR(10),
    EmployeeID INT,
    OrderDate DATETIME,
    RequiredDate DATETIME,
    ShippedDate DATETIME,
    ShipVia INT,
    Freight DECIMAL(10, 2),
    ShipName VARCHAR(255),
    ShipAddress VARCHAR(255),
    ShipCity VARCHAR(100),
    ShipRegion VARCHAR(100),
    ShipPostalCode VARCHAR(20),
    ShipCountry VARCHAR(100),
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID),
    FOREIGN KEY (ShipVia) REFERENCES Shippers (ShipperID)
  );

-- =========================
-- Order Details
-- =========================
CREATE TABLE
  `Order Details` (
    OrderID INT,
    ProductID INT,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    Quantity INT NOT NULL,
    Discount FLOAT DEFAULT 0,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
  );