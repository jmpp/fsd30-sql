ALTER TABLE pilots DROP plane;

CREATE TABLE planes (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL, 
    name CHAR(5), 
    description TEXT, 
    num_flying DECIMAL(8,1)
);
    
ALTER TABLE pilots ADD plane_id INT UNSIGNED;

ALTER TABLE pilots ADD CONSTRAINT fk_pilots_planes FOREIGN KEY (plane_id) REFERENCES planes (id);

INSERT INTO `planes`
 (`name`, `description`, `num_flying`)
VALUES
('A320', 'Avion de ligne quadriréacteur', 17000.0),
('A340', 'Moyen courier', 50000.0),
('A380', 'Gros porteur', 12000.0);

ALTER TABLE `pilots` DROP FOREIGN KEY `fk_pilots_planes`;
ALTER TABLE `pilots` ADD CONSTRAINT fk_pilots_planes FOREIGN KEY (plane_id) REFERENCES planes (id) ON DELETE SET NULL ON UPDATE SET NULL;


----- 04. -----

SELECT
    pilots.name,
    certificate,
    trip_id
FROM pilots
    LEFT JOIN pilot_trip USING(certificate)
WHERE
    pilot_trip.trip_id IS NULL;


------- 05. -----------

SELECT
    trips.name,
    trips.departure,
    trips.arrival,
    trips.created,
    pilots.name,
    pilots.certificate
FROM `trips`
    INNER JOIN pilot_trip ON trips.id = pilot_trip.trip_id
    INNER JOIN pilots ON pilots.certificate = pilot_trip.certificate
ORDER BY `pilots`.`name` ASC;


------- 06. ---------

SELECT
    GROUP_CONCAT(trips.departure),
    pilots.certificate
FROM pilot_trip
    INNER JOIN pilots ON pilots.certificate = pilot_trip.certificate
    INNER JOIN trips ON trips.id = pilot_trip.trip_id
GROUP BY pilots.certificate;
/*
+-------------------------------+-------------+
| GROUP_CONCAT(trips.departure) | certificate |
+-------------------------------+-------------+
| Paris,Amsterdan               | ct-10       |
| Paris                         | ct-100      |
| Paris                         | ct-11       |
| Amsterdan,Alger               | ct-12       |
| Paris                         | ct-6        |
+-------------------------------+-------------+
*/

--  OU SINON, on créer des groupes distincts :
SELECT
    trips.departure,
    pilots.certificate
FROM pilot_trip
    INNER JOIN pilots ON pilots.certificate = pilot_trip.certificate
    INNER JOIN trips ON trips.id = pilot_trip.trip_id
GROUP BY pilots.certificate, trips.departure;
/* 
+-----------+-------------+
| departure | certificate |
+-----------+-------------+
| Paris     | ct-10       |
| Paris     | ct-100      |
| Paris     | ct-6        |
| Paris     | ct-11       |
| Amsterdan | ct-12       |
| Amsterdan | ct-10       |
| Alger     | ct-12       |
+-----------+-------------+
 */



 -------- 07. ------------

SELECT
    trips.name,
    trips.departure,
    trips.arrival,
    trips.created
FROM `trips`
    INNER JOIN pilot_trip ON trips.id = pilot_trip.trip_id
    INNER JOIN pilots ON pilots.certificate = pilot_trip.certificate
ORDER BY `pilots`.`name` ASC;