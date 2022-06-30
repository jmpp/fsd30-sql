ALTER TABLE pilots ADD lead_pl VARCHAR(255) DEFAULT NULL AFTER certificate;


ALTER TABLE pilots ADD CONSTRAINT fk_lead_pilot
FOREIGN KEY (`lead_pl`) REFERENCES `pilots` (`certificate`)
ON DELETE RESTRICT
ON UPDATE RESTRICT;

UPDATE pilots
SET lead_pl = 'ct-7'
WHERE name IN ('Alan', 'Tom', 'Yi');

-- Avec une sous-table temporaire, créée pour l'occasion
UPDATE pilots
SET lead_pl = (
        SELECT * FROM (
                SELECT pp.certificate
                FROM pilots pp
                WHERE pp.name = 'John'
            ) tempTable
    )
WHERE
    name IN ('Sophie', 'Albert', 'Yan');

-- (SELECT pp.certificate FROM pilots pp WHERE pp.name = 'Pierre')


SELECT * FROM pilots WHERE lead_pl IS NULL;

----- 02 Jointures