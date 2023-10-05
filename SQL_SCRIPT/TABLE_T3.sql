CREATE TEMP TABLE T3 AS
SELECT 
	T2.order_id,
	UPPER(T2.zone) AS zone,
	ccr.wt_slab,
	T2.order_wt,
	((CEIL(T2.order_wt/ccr.wt_slab))*ccr.wt_slab) AS wt_slab_X,
	T2.charged_wt,
	((CEIL(T2.charged_wt/ccr.wt_slab))*ccr.wt_slab)AS wt_slab_CC,
	(FLOOR(T2.order_wt/ccr.wt_slab)) as factor_X
FROM T2	
JOIN ccr on UPPER(T2.zone)=ccr.zone;



