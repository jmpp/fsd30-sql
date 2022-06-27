-- ### Exercice créer la table pilots
CREATE TABLE `pilots` (
    `certificate` VARCHAR(6),
    `num_flying` DECIMAL(7,1),
    `company` CHAR(4),
    `name` VARCHAR(20) NOT NULL,
    CONSTRAINT pk_pilots PRIMARY KEY (`certificate`),
    CONSTRAINT uk_name UNIQUE (`name`)
) ENGINE=InnoDB ;

ALTER TABLE pilots ADD CONSTRAINT fk_pilots_company FOREIGN KEY (company) REFERENCES companies(`comp`);