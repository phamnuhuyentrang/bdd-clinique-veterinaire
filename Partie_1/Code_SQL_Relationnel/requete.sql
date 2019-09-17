/*Requête*/
/* Information :
    Les valeurs recherchés d'un variable vont être mises sous forme $nom_variable
*/

/* Requête pour la quantité de médicament prescrite à un animal */
/* Remarque: Je suppose que je vais compter le nombre de type d'éléments si je comprends bien le sujet*/
SELECT T.medicament as medicament, count(*) as quantite_medicament
FROM traitement_medicament T, traitement TR
WHERE TR.id_animal= $id_animal AND T.traitement = TR.id_traitement
GROUP BY T.medicament;

/* Si on demande de quantité par jour, on juste remplace count(*) par sum(T.quantite_medicaments_pj)*/
SELECT T.medicament as medicament, sum(T.quantite_medicaments_pj) as quantite_medicament
FROM traitement_medicament T, traitement TR
WHERE TR.id_animal= 5 AND T.traitement = TR.id_traitement
GROUP BY T.medicament;

/* Requête pour la quantité de médicament prescrite dans la clinique */
/* Même remarque pour le requête précédent */
SELECT T.medicament as medicament, count(*) as quantite_prescrite
FROM traitement_medicament T
GROUP BY T.medicament;

/* Ou bien */
SELECT T.medicament as medicament, sum(T.quantite_medicaments_pj) as quantite_prescrite
FROM traitement_medicament T
GROUP BY T.medicament;

/* Requête pour la quantité total d'un médicament prescrit dans la clinique */
SELECT COUNT (*) as quantite_medicament
FROM traitement_medicament T
WHERE T.medicament = $medicament;


/* Requête pour le poids moyen d'une espèce traité dans la clinique */
SELECT A.espece as Espece, AVG(A.poids) as Poids_Moyen
FROM Animal A
WHERE A.espece = $espece
GROUP BY A.espece;

/* Requête pour la taille moyenne d'une espèce traité dans la clinique */
SELECT A.especenom as Espece, AVG(A.taille) as Taille_Moyenne
FROM Animal A
WHERE especenom = $especenom
GROUP BY A.espece;

/* On peut faire les mêmes requêtes pour l'ensemble des espèces de la clinique */

/* Requete pour le poids moyen et la taille moyenne de toutes les especes traitées dans la clinique */
SELECT A.espece as Espece, AVG(a.poids) as Poids_Moyen, AVG(A.taille) as Taille_Moyenne
FROM Animal A
GROUP BY A.espece;

-- \set AUTOCOMMIT off

-- Un membre vient de terminer le paiement de ses frais d'inscription
BEGIN TRANSACTION;
INSERT INTO Client (nom, prénom, naissance, adresse, numero)
VALUES (‘Saad’, ‘Bennis’,’1998-01-01', ‘6 rue antoine, '1998-01-01’,’0123456789’);
COMMIT TRANSACTION;

-- Un membre vient de terminer le paiement de ses frais d'inscription
BEGIN TRANSACTION;
INSERT INTO Client (nom, prénom, naissance, adresse, numero)
VALUES (‘Colin’, ‘Lafond’,’1998-01-01', ‘6 rue antoine, '1998-01-01’,’04787249’);
COMMIT TRANSACTION;

-- Un Client change son numero de telephone)
BEGIN TRANSACTION;
UPDATE Resultat
SET numero = 0828371973,
WHERE nomMembre = ‘Bennis’
AND prenomMembre = ‘Saad’
AND dateDeNaissanceMembre = '1998-01-01'
COMMIT TRANSACTION;

