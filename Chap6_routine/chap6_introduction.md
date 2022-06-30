# Procédures stockées (stored procedures)

Lorsque vous avez une requête qui doit-être exécutée plusieurs fois par jour par différents utilisateurs, vous pouvez utiliser une procédure stockée. La notion de procédure stockée équivaut à la notion de fonction dans d'autres langages.

```sql
DELIMITER |
CREATE PROCEDURE pilots_company (IN comp CHAR(4))
BEGIN
    SELECT name, last_name
    FROM pilots
    WHERE company = comp;
END |
DELIMITER ; 
```

Attention vous devez remettre le délimiteur par défaut à la fin de la procédure.

Vous commencerez une procédure stockée par BEGIN et la terminerez par END. Vous devez utiliser un délimiter différent de ";"

Le mot réservé IN indique un paramètre entrant dans la procédure. Vous avez également le mot réservé OUT ou INOUT pour les paramètres sortant ou entrant/sortant.

Notez que si vous ne précisez pas le paramètre entrant/sortant il sera par défaut entrant. Vous devez comme pour une fonction donner un nom et un type.

Dans votre terminal vous pouvez maintenant appeler la procédure comme suit :

```sql
CALL pilots_company('AUS');
```

Pour supprimer votre procédure vous devez taper la ligne de code suivante :

```bash
DROP PROCEDURE pilots_company;
```

## Paramètre sortant

Voici la syntaxe pour un paramètre sortant, attention le paramètre sortant ne peut avoir qu'une seule valeur sortante. Vous créez plusieurs paramètres sortants.

```sql
DELIMITER |
CREATE PROCEDURE get_count (OUT nb INT) 
    BEGIN
        SELECT COUNT(*) INTO nb FROM pilots;
    END
    |
DELIMITER ; 
```

Dans MySQL sur la base db_aviation, vous devez taper la ligne de commande suivante pour exécuter la procédure :

```sql
set @n = 0;
CALL get_count(@n);
SELECT @n;
```

## Exercices

1. Créez une procédure qui affiche la liste des noms des pilotes.

2. Créez une procédure qui affiche les compagnies qui emploient plus de 2 pilotes.

3. Créez une procédure qui affiche les compagnies qui n'ont pas de pilote.

4. Créez une procédure qui affiche la somme des heures de vol pour un pilote.

5. Créez une procédure qui affiche les pilotes d'une compagnie donnée.

6. Créez une procédure qui affiche les noms des pilotes avec leurs bonus ordonnés par ordre décroissant de bonus.

8. Créez une procédure qui retourne 1 ou 0 si la compagnie a respectivement des pilotes ou aucun pilote.
