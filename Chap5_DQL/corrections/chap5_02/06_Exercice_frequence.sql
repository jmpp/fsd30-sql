
-- Calculez le pourcentage des heures de vol de chaque pilote par rapport au total des heures de vol

-- SELECT ROUND( num_flying / (SELECT SUM(num_flying)  FROM pilots), 2 ) * 100 as fq_nb_flying
-- FROM pilots;
SELECT ROUND( num_flying / (SELECT SUM(num_flying)  FROM pilots) * 100, 2 ) as fq_nb_flying
FROM pilots;