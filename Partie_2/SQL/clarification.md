### Contraintes

    Nous avons supposé que plusieurs médicaments sont utilisé par traitement et quantité par jour est différent pour chaque médicament.
    c'est pourquoi nous avons ajouté le contrainte UNIQUE(traitement, qte_pj) dans la table medi_traitement pour vérifier que un traitement utilise plusieurs
    médicaments dont la quantité par jour est différente.
    
    En plus, nous avons créé 2 types de données: personne et effet_secondaire car les tables Clients, Vétérinaire a des attributs communs (nom, prénom, naissance
    adresse, téléphone), effets secondaires peut devenir un attribut de la table Médicament.
    
    Ici, nous gardons les contraintes de modèle SQL standard que nous avons fait avant.