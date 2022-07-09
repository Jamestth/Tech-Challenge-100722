SELECT "b"."CustomerId", "b"."Name", sum("a"."Price") as "Total Spending"
FROM "Dealership"."Transactions" as a 
INNER JOIN "Dealership"."Customers" as b ON "a"."CustomerId" = "b"."CustomerId"
GROUP BY "b"."CustomerId"