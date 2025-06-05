/* 
La requête permet de déterminer, par client et sur la période allant du 1er janvier 2019 au 31 décembre 2019, les ventes meuble et déco réalisées.
*/

SELECT 
	t.client_id as client_id, 
	SUM(CASE WHEN p.product_type = 'MEUBLE' THEN t.prod_price*t.prod_qty ELSE 0 END) AS ventes_meuble,
  	SUM(CASE WHEN p.product_type = 'DECO' THEN t.prod_price*t.prod_qty ELSE 0 END) AS ventes_deco
FROM TRANSACTIONS t
INNER JOIN PRODUCT_NOMENCLATURE p
on t.prod_id=p.product_id
WHERE t.date BETWEEN DATE(2019, 01, 01) AND DATE(2019, 12, 31)
GROUP BY client_id
