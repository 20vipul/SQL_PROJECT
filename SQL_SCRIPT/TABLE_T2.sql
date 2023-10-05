CREATE TEMP TABLE T2 AS
SELECT 
	cci.awb_code,
	cci.order_id,
	TS.order_wt,
	cci.charged_wt,
	cci.wh_pc,
	cci.cu_pc,
	cci.zone
FROM cci
JOIN TS on cci.order_id=TS.order_id
WHERE cci.order_id=TS.order_id
GROUP BY cci.awb_code,cci.order_id,TS.order_wt,cci.charged_wt,cci.wh_pc,cci.cu_pc,cci.zone;

