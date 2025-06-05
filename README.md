# Part2-SQL

## Remarque importante : 
1. Dans mes 2 requêtes, j’ai supposé que le champ date était de type DATE.
Si ce champ est en réalité au format STRING, il est important de le convertir en DATE avant de l’utiliser dans une clause WHERE, notamment avec BETWEEN, car cela garantit des comparaisons plus fiables et précises.
Par exemple, dans BigQuery :
```sql
WHERE PARSE_DATE('%d/%m/%Y', t.date) BETWEEN DATE(2019, 01, 01) AND DATE(2019, 12, 31)
```
De manière générale, il est déconseillé de manipuler des dates stockées sous forme de chaînes de caractères, car cela augmente le risque d’erreurs et limite l’usage des fonctions de date.
2. Dans mes deux requêtes, j’ai considéré que les champs prod_price et prod_qty étaient de type NUMERIC.
Si ces champs sont en réalité de type STRING, il est nécessaire de les convertir au format NUMERIC à l’aide de :
```sql
CAST(col AS NUMERIC)
```
Concernant prod_price, il convient d’abord de remplacer la virgule par un point pour garantir un format compatible avec BigQuery :
```sql
CAST(REPLACE(prod_price, ',', '.') AS NUMERIC)
```