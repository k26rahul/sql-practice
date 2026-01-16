SELECT
  *
FROM
  Regions;

SELECT
  *
FROM
  Employees;

SELECT
  FirstName,
  LastName
FROM
  Employees;

SELECT
  FirstName,
  LastName
FROM
  Employees
ORDER BY
  LastName;

SELECT
  OrderID,
  OrderDate,
  ShippedDate,
  CustomerID,
  Freight
FROM
  Orders
ORDER BY
  Freight DESC
LIMIT
  5;

SELECT
  FirstName,
  LastName
FROM
  Employees
WHERE
  Title = "Sales Representative";

SELECT
  FirstName,
  LastName
FROM
  Employees
WHERE
  Region IS NOT NULL;

SELECT
  FirstName,
  LastName
FROM
  Employees
WHERE
  FirstName >= "N";

SELECT
  *
FROM
  Categories;

SELECT
  FirstName,
  LastName
from
  Employees;

SELECT
  *
FROM
  Employees;

SELECT
  OrderID,
  Freight,
  (Freight * 1.1) as FreightWithTax
FROM
  Orders
WHERE
  Freight >= 500