/* 
La requête permet de trouver le chiffre d’affaires (le montant total des ventes), jour par jour, du 1er janvier 2019 au 31 décembre 2019. 
Le résultat sera trié sur la date à laquelle la commande a été passée.
*/

SELECT 
    t.date AS date, 
    Sum(t.prod_price*t.prod_qty) AS ventes
FROM TRANSACTIONS t
WHERE t.date BETWEEN DATE(2019, 01, 01) AND DATE(2019, 12, 31)
Group by t.date
ORDER BY t.date ASC
