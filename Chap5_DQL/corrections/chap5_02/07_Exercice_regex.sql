/*
Récupérez tous les noms des pilotes dont le code de leurs compagnies se terminent par R suivi de 2 caractères exactement.

*/


SELECT name, company
FROM pilots 
WHERE company REGEXP '.*r.{2}$';