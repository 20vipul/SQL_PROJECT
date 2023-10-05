CREATE TEMP TABLE T4 AS
SELECT 
    T3.order_id,
    T3.zone,
	T3.wt_slab,
	T3.order_wt,
	T3.wt_slab_X,
    T3.charged_wt,
    T3.wt_slab_CC,
	T3.factor_X,
    CASE 
    	WHEN cci.to_shipment = 'Forward charges' THEN
    		CASE
        		WHEN T3.factor_X = 0 THEN ccr.fw_fx_cg
        		ELSE (ccr.fw_fx_cg + (ccr.fw_ad_cg * T3.factor_X))
        	END
    	WHEN cci.to_shipment = 'Forward and RTO charges' THEN
        	CASE 
        		WHEN T3.factor_X = 0 THEN (ccr.fw_fx_cg + ccr.rto_fx_cg)
        		ELSE ((ccr.fw_fx_cg + ccr.rto_fx_cg) + (ccr.fw_ad_cg + ccr.rto_ad_wt_cg) * T3.factor_X)
        END
    END AS "CRUDE PRICE"	  
FROM T3	
JOIN ccr ON T3.zone = ccr.zone
JOIN cci ON T3.order_id = cci.order_id;


