SELECT "b"."ManufacturerId", "b"."Name", sum("a"."Price") as "Total Spending", count("a"."SerialNumber") as "Total Sales"
FROM "Dealership"."Transactions" as a 
INNER JOIN "Dealership"."Manufacturers" as b ON "a"."ManufacturerId" = "b"."ManufacturerId"
WHERE "a"."Timestamp" >= date_trunc('month', current_date - interval '1' month)
GROUP BY "b"."ManufacturerId" 
ORDER BY "Total Sales" Desc
Limit 3