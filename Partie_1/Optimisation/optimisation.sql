CREATE TABLE traitement_bis AS SELECT id_animal, medicament, quantite_medicaments_pj FROM traitement, traitement_medicament WHERE traitement.id_traitement = traitement_medicament.traitement ORDER BY traitement.id_animal, traitement_medicament.medicament;

CREATE INDEX ani ON traitement_bis(id_animal);
CREATE MATERIALIZED VIEW quantite_medicament_par_animal AS (SELECT medicament, SUM(quantite_medicaments_pj) FROM traitement_bis WHERE id_animal = $id_animal GROUP BY medicament);

CREATE MATERIALIZED VIEW quantite_medicament_total AS (SELECT medicament, SUM(quantite_medicaments_pj) FROM traitement_bis GROUP BY medicament);

CREATE INDEX especes ON animal(espece);
CREATE MATERIALIZED VIEW poids_taille_moy AS SELECT espece, avg(poids) as poids_moyenne, avg(taille) as taille_moyenne FROM animal group by espece;


/*Faire quelques insert value*/

REFRESH MATERIALIZED VIEW quantite_medicament_par_animal;
REFRESH MATERIALIZED VIEW quantite_medicament_total;
REFRESH MATERIALIZED VIEW poids_taille_moy;