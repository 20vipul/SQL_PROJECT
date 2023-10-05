CREATE TABLE SUMMARY AS
SELECT
    'Total Orders - Correctly Charged' AS " ",
    COUNT(*) FILTER (WHERE "Difference Between Expected Charges and Billed Charges (Rs.)" = 0) AS count,
    SUM(CASE WHEN "Difference Between Expected Charges and Billed Charges (Rs.)" = 0 THEN "Expected Charge as per X (Rs.)" END) AS amount
FROM RESULTANT

UNION ALL

SELECT
    'Total Orders - Over Charged' AS " ",
    COUNT(*) FILTER (WHERE "Difference Between Expected Charges and Billed Charges (Rs.)" > 0) AS count,
    SUM(CASE WHEN "Difference Between Expected Charges and Billed Charges (Rs.)" >0 THEN "Difference Between Expected Charges and Billed Charges (Rs.)" END) AS amount
FROM RESULTANT

UNION ALL

SELECT
    'Total Orders - Under Charged' AS " ",
    COUNT(*) FILTER (WHERE "Difference Between Expected Charges and Billed Charges (Rs.)" < 0) AS count,
    SUM(CASE WHEN "Difference Between Expected Charges and Billed Charges (Rs.)" < 0 THEN "Difference Between Expected Charges and Billed Charges (Rs.)" END) AS amount
FROM RESULTANT;



