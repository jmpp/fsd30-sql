-- Créez une procédure qui affiche la liste des noms des pilotes.
DROP PROCEDURE IF EXISTS list_pilots;

DELIMITER |
CREATE PROCEDURE list_pilots()
BEGIN
    SELECT name FROM pilots;
END |
DELIMITER ;

-- Créez une procédure qui affiche les compagnies qui emploient plus de 2 pilotes.


DELIMITER |
DROP PROCEDURE IF EXISTS company_more_than_N_pilots|
CREATE PROCEDURE company_more_than_N_pilots(IN min_pilots INT)
BEGIN
    SELECT c.name, COUNT(p.certificate) AS nb_pilots
    FROM pilots p
    INNER JOIN companies c ON p.company = c.comp
    GROUP BY p.company
    HAVING nb_pilots >= min_pilots;
END |
DELIMITER ;

-- Créez une procédure qui affiche les compagnies qui n'ont pas de pilote.

DELIMITER |
DROP PROCEDURE IF EXISTS company_that_have_no_pilot_and_that_is_sad|
CREATE PROCEDURE company_that_have_no_pilot_and_that_is_sad()
BEGIN
    SELECT c.name
    FROM pilots p
    RIGHT JOIN companies c ON p.company = c.comp
    WHERE p.name IS NULL;
END |
DELIMITER ;