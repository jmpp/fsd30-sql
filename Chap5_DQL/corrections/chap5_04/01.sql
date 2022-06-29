-- 1. Exercice moyenne des heures de vol
SELECT
    company,
    AVG(num_flying) AS moyenne_heures_vol
FROM pilots GROUP BY company;


-- 02. Calculez la moyenne des heures de vol des pilotes dont le bonus est de 500, par compagnie.
SELECT
    company,
    AVG(num_flying) AS moyenne_heures_vol
FROM pilots
WHERE bonus = 500
GROUP BY company;


-- 03 Sélectionnez les compagnies ayant plus d'un pilote, ainsi que leur nombre de pilotes.
SELECT
    company,
    COUNT(certificate) AS nb_pilots
FROM pilots
GROUP BY company
HAVING nb_pilots > 1;


-- 05. Sélectionnez le nombre de pilotes par compagnie et par type d'avion.
SELECT
    company,
    plane,
    COUNT(certificate) as nb_pilots
FROM pilots
GROUP BY company, plane;


-- 06. Sélectionnez le nom des pilotes par bonus.
SELECT
    GROUP_CONCAT(
        name
        SEPARATOR ' / '
    ),
    bonus
FROM pilots
GROUP BY bonus;
-- 06. Sélectionnez le nom des pilotes et la companie par bonus.
SELECT
    GROUP_CONCAT(
        CONCAT(name, '(', company, ')')
        SEPARATOR ', '
    ),
    bonus
FROM pilots
GROUP BY bonus;


-- 7. Calculez l'étendue du nombre d'heures de vol par compagnie.
SELECT
    -- GROUP_CONCAT(num_flying),
    MAX(num_flying) - MIN(num_flying) AS etendue,
    company
FROM pilots
GROUP BY company;


-- 8. Faites la somme du nombre de jours de vols par compagnie dont la somme est supérieure à 30.
SELECT
    SUM(num_jobs) AS sum_jobs,
    company
FROM pilots
GROUP BY company
HAVING sum_jobs > 30;


-- 9. Afficher la moyenne des heures de vol pour les compagnies qui sont en France.
SELECT
    AVG(num_flying) AS moyenne_heure,
    company
FROM pilots
WHERE company = (
    SELECT comp FROM companies WHERE name = 'Air France'
)
GROUP BY company;