CREATE TEMP TABLE RESULTANT AS
SELECT
	T2.awb_code,
	T2.order_wt as "Total weight as per X (KG)",
	T4.wt_slab_X as "Weight slab as per X (KG)",
	T4.charged_wt as "Total weight as per Courier Company (KG)",
	T4.Wt_slab_CC as "Weight slab charged by Courier Company (KG)",
	T4.zone as "Delivery Zone as per X",
	upper(cci.zone) as "Delivery Zone charged by Courier Company",
	CASE
		WHEN od.payment_md='COD'then
		    CASE 
			    when TS.order_amount<300 then ROUND((T4."CRUDE PRICE"),2)
				else ROUND((T4."CRUDE PRICE"+((5*TS.order_amount)/100)),2)
			END
	   	ELSE ROUND((T4."CRUDE PRICE"),2)		
	END AS "Expected Charge as per X (Rs.)",
	cci.price as "Charges Billed by Courier Company (Rs.)",
	CASE
		WHEN od.payment_md='COD'then
		    CASE 
			    when TS.order_amount<300 then ROUND((T4."CRUDE PRICE"-cci.price),2)
				else ROUND(((T4."CRUDE PRICE"+((5*TS.order_amount)/100))-cci.price),2)
			END
		ELSE ROUND((T4."CRUDE PRICE"-cci.price),2)	
	END AS "Difference Between Expected Charges and Billed Charges (Rs.)"
FROM T2
LEFT JOIN T4 on T2.order_id=T4.order_id
LEFT JOIN cci on T2.order_id=cci.order_id
LEFT JOIN order_details od on T2.order_id=od.order_id
LEFT join TS on T2.order_id=TS.order_id
GROUP by T2.awb_code,T2.order_wt,T4.wt_slab_X,T4.charged_wt,T4.Wt_slab_CC,T4.zone,cci.zone,
od.payment_md,TS.order_amount,T4."CRUDE PRICE",cci.price ;


