CREATE TEMP TABLE T1 AS
SELECT 
	od.order_id,
	od.sku,
	od.order_qt,
	sm.weight_gm,
	(od.order_qt*sm.weight_gm) AS wt,
	od.price_qt,
	(od.price_qt*od.order_qt) AS price,
	od.payment_md
FROM order_details od
JOIN sku_master sm on od.sku=sm.sku;