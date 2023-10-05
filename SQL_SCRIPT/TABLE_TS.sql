CREATE TEMP TABLE TS AS
SELECT 	
	T1.order_id,
	ROUND(SUM(T1.wt)/1000,2) AS order_wt,
	SUM(T1.price) AS order_amount,
	T1.payment_md
FROM T1
GROUP BY T1.order_id,T1.payment_md;	
	
	
	
