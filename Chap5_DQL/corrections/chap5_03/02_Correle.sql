ALTER TABLE pilots
ADD last_name VARCHAR(255) AFTER name;

UPDATE pilots SET last_name = (
    CASE
        WHEN name IN ('Alan', 'Yi', 'Sophie') THEN 'Dupont'
        WHEN name = 'Tom' THEN 'Lu'
        WHEN name IN ('Yan', 'Benoit', 'John', 'Pierre') THEN 'chai'
        ELSE 'Pierre'
    END
);

-- Sélectionnez les adresses des compagnies qui n'ont pas de pilote en utilisant une sous-requête corrélée.
SELECT comp, name
FROM companies AS c
WHERE NOT EXISTS (
    SELECT 1 FROM pilots AS p WHERE c.comp = p.company
);


-- Sélectionnez les adresses des compagnies qui ont des pilotes en utilisant une sous-requête corrélée.
SELECT comp, name
FROM companies AS c
WHERE EXISTS (
    SELECT 1 FROM pilots AS p WHERE c.comp = p.company
);


-- Sélectionnez les pilotes qui ont le même nom de famille en utilisant une sous-requête corrélée. Trouvez deux écritures à cette requête.
SELECT name, last_name
FROM pilots AS p1
WHERE last_name IN (
    SELECT last_name FROM pilots AS p2 WHERE p1.name != p2.name
);