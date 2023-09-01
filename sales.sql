#Count the number of Salesperson whose name begins with 'a'/'A'
SELECT COUNT(*) AS CountOfSalespeopleWithA
FROM SalesPeople
WHERE UPPER(Sname) LIKE 'A%';

#Display all the Salesperson whose all orders' worth is more than Rs. 2000
SELECT SP.Snum, SP.Sname
FROM SalesPeople SP
WHERE NOT EXISTS (
    SELECT *
    FROM Orders O
    WHERE O.Snum = SP.Snum AND O.Amt <= 2000
);

#Count the number of Salesperson belonging to Newyork
SELECT COUNT(*) AS CountOfSalespeopleInNewYork
FROM SalesPeople SP
WHERE SP.City = 'Newyork';

#Display the number of Salespeople belonging to London and belonging to Paris
SELECT City, COUNT(*) AS NumberOfSalespeople
FROM SalesPeople
WHERE City IN ('London', 'Paris')
GROUP BY City;

#Display the number of orders taken by each Salesperson and their date of orders
SELECT SP.Snum, SP.Sname, COUNT(O.Onum) AS NumberOfOrders, O.Odate
FROM SalesPeople SP
LEFT JOIN Customers C ON SP.Snum = C.Snum
LEFT JOIN Orders O ON C.Cnum = O.Cnum
GROUP BY SP.Snum, SP.Sname, O.Odate
ORDER BY SP.Snum, O.Odate;
