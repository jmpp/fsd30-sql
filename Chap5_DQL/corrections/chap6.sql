-- =========================================
-- 01 Exercice ajouter une clé étrangère
-- =========================================

-- Ajoutez la clé étrangère "lead_pl" dans la table pilots.

ALTER TABLE pilots
ADD
    lead_pl VARCHAR(255) DEFAULT NULL AFTER certificate;

ALTER TABLE pilots
ADD
    CONSTRAINT fk_lead_pilot FOREIGN KEY (`lead_pl`) REFERENCES `pilots` (`certificate`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Mettez à jour la table pilots sachant que Pierre est le chef pilote de Alan, Tom et Yi. Et que John est le chef pilote de Sophie, Albert et Yam.

UPDATE pilots
SET lead_pl = 'ct-7'
WHERE
    name IN ('Alan', 'Tom', 'Yi');


-- (Avec une sous-table temporaire, créée pour l'occasion :)
UPDATE pilots
SET lead_pl = (
        SELECT *
        FROM (
                SELECT
                    pp.certificate
                FROM pilots pp
                WHERE
                    pp.name = 'John'
            ) tempTable
    )
WHERE
    name IN ('Sophie', 'Albert', 'Yan');


-- Ecrire et exécuter une requête pour déterminer les pilotes qui n'ont pas de chef.
SELECT * FROM pilots WHERE lead_pl IS NULL;


-- =========================================
-- 02 Exercice Jointures
-- =========================================


-- Sélectionnez les certificats des pilotes et les noms des compagnies pour lesquelles ils travaillent.

SELECT
    pilots.certificate AS pilot_certificate,
    companies.name AS companie_name
FROM `pilots`
    INNERT JOIN companies ON pilots.company = companies.comp;

-- Sélectionnez les certificats et les noms des pilotes travaillant pour la compagnie 'Air France', et ayant fait plus de 60 heures de vol.


SELECT
    pilots.name,
    company,
    pilots.certificate
FROM pilots
    INNER JOIN companies on pilots.company = companies.comp
WHERE
    company In('FRE1')
    and pilots.num_flying > 60;

-- =========================================
-- 03 Exercice sommes des heures de vol
-- =========================================

-- Faites la somme des heures de vol de tous les pilotes de la compagnie AUSTRA Air (recherche par rapport au nom de la compagnie dans la table companies).

SELECT SUM(num_flying), c.name FROM pilots p
INNER JOIN companies c ON p.company = c.comp
WHERE c.name = 'AUSTRA Air';

-- =========================================
-- 04 Exercice sommes des heures par compagnie
-- =========================================

-- Faites maintenant la somme des nombres des heures de vol par compagnie en donnant le nom des compagnies.

SELECT c.name, SUM(num_flying)
FROM pilots p
    INNER JOIN companies c ON p.company = c.comp
GROUP BY c.name;