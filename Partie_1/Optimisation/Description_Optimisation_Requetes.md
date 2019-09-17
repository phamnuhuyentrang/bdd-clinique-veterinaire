Descriptif Optimisation Selon Requêtes
===

**Quantité de chaque type de médicament prescrit pour un animal donné**

    --Groupement de tables: Créer une nouvelle table "traitement_bis" qui contient la jointure de 2 tables traitement et traitement_medicament
    --Partition verticale: Récupérer les attributs nécessaires de "traitement_bis" (id_animals, medicament, quantite_medicament_pj)
    --Indexation id_animals dans traitement_bis
    --Vue matérialisée de quantité de chaque type de médicament prescrit de chaque animal

**Quantité d'un médicament prescrit au total dans la clinique****

    --Partition verticale: Récupérer les attributs nécessaires de table "traitement_medicaments" (medicament, quantite_medicament_pj)
    --Indexation medicament dans traitement_medicaments
    --Vue matérialisée de quantité totale de chaque médicament prescrit dans la clinique
    
**Les poids et taille moyenne des animaux d'une espèce traités**

    --Partition verticale: Récupérer les attributs nécessaires de table "animal" (espece, poids, taille)
    --Indexation espece dans "animal"
    --Vue matérialisée de poids et taille de chaque espèce traité dans la clinique