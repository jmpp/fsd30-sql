-- 1. Calculez les profits de chaque compagnie par année, ainsi que le total par année pour toutes les compagnies et enfin le total global des profits.

SELECT
    company,
    YEAR(created_at) AS year,
    SUM(profit) AS chiffre_affaire
FROM sales
GROUP BY company, year
WITH ROLLUP;

-- 2. Calculez maintenant par année et par mois avec la même granularité que la question 1 respectivement par rapport à ce dernier regroupement.

SELECT
    company,
    YEAR(created_at) AS year,
    MONTH(created_at) AS month,
    SUM(profit) AS chiffre_affaire
FROM sales
GROUP BY company, year, month
WITH ROLLUP;