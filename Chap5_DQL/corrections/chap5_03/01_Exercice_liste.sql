-- Quelles sont les coordonnées des compagnies qui employent des pilotes faisant moins de 90 heures de vol ?
SELECT num_street, name, comp
FROM companies
WHERE comp IN (
    SELECT company FROM pilots WHERE num_flying < 90
);


-- Sélectionnez le pilote ayant fait le plus d'heures de vol sans utiliser l'opérateur MAX. Puis sélectionnez les nombres d'heures de vol sauf le plus grand.
SELECT name, num_flying
FROM pilots
WHERE num_flying >= (SELECT num_flying FROM pilots ORDER BY num_flying DESC LIMIT 1);
-- Avec la clause ALL() :
SELECT name, num_flying
FROM pilots
WHERE num_flying >= ALL(SELECT num_flying FROM pilots);


-- Faites la somme des heures de vol des pilotes dont le nom de la compagnie est Air France. Bien sûr, vous ne connaissez pas la clef primaire de la compagnie.
SELECT SUM(num_flying)
FROM pilots
WHERE company = (
    SELECT comp FROM companies WHERE name = 'Air France'
);


-- Ajoutez maintenant la compagnie suivante dans la table companies :
INSERT INTO companies (comp, street, city, name, num_street, status) VALUES
('ITA', 'mapoli', 'Rome', 'Italia Air', 20, DEFAULT);


-- Trouvez toutes les compagnies n'ayant pas de pilotes.
SELECT num_street, name, comp
FROM companies
WHERE comp NOT IN (
    SELECT company FROM pilots
);


-- Sélectionnez tous les pilotes dont le nombre d'heures de travail est inférieur à tous les nombres d'heures de travail de la compagnie CHI.
SELECT name, company
FROM pilots
WHERE num_jobs < ALL (
    SELECT num_jobs FROM pilots WHERE company='CHI'
);


-- Sélectionnez la longueur des noms des pilotes dont la longueur de leurs noms est inférieur à toutes les longueurs des noms de la compagny FRE1.
SELECT LENGTH(name), name, company
FROM pilots
WHERE LENGTH(name) < ALL (
    SELECT LENGTH(name) FROM pilots WHERE company = 'FRE1'
);


-- Sélectionnez les coordonnées des compagnies ayant des pilotes dont le nombre d'heures de vol est inférieur à tous les nombres d'heures de vol (chaque heure de vol) des A380.
SELECT name, num_street, street, city
FROM companies
WHERE comp IN (
    SELECT company FROM pilots WHERE num_flying < (
        SELECT MIN(num_flying) FROM pilots WHERE plane='A380'
    )
);