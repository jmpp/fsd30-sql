# Modifiez la table companies ci-dessus et ajoutez le champ status de type ENUM qui prendra les valeurs suivantes : "published", "unpublished", "draft" et qui par défaut aura la valeur "draft".
ALTER TABLE `companies`
    ADD `status` ENUM('published', 'unpublished', 'draft') DEFAULT 'draft';

# Ajoutez également la colonne num_street.
ALTER TABLE `companies`
    ADD `num_street` SMALLINT;

# Supprimez cette nouvelle colonne …
ALTER TABLE `companies`
    DROP `num_street`;

# … puis recréez la en la plaçant cette fois-ci après la colonne "name" de la table companies. Utilisez la commande suivante : AFTER dans la commande ALTER.
ALTER TABLE `companies`
    ADD `num_street` SMALLINT AFTER `name`;