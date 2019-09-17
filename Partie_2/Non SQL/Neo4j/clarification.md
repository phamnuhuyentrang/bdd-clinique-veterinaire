## Inconvénients:
### Neo4j ne nous permet pas d'ajouter à associations les contraintes 1..*
    Par exemple:
    Dans l'association client-animal, avec PostgreSQL, on peut ajouter des contraintes pour vérifier que un animal est possédé par une seul client.
    Mais avec Neo4j, on ne peut pas faire comme ça, c'est-à-dire, un animal peut être possèdé par plusieurs clients.
### Neo4j ne nous permet pas de définir une fonction    
    En plus, pour que un médicament correspond seulement à quelques espèces animals, en PostgreSQL, on peut le transmettre en contraintes puis faire
    une fonction booléenne correspondante mais en Neo4j, on ne peut pas le faire.
    
    
## Avantages:
### Neo4j nous permet d'ajouter les attributs dans une association
    En PostgreSQL, on doit créer une nouvelle table d'association avec les attributs, par exemple dans la table d'association Traitement-Médicaments, on ajoute
    l'attribut quantite_pj.
    En Neo4j, on n'a pas besoin de le faire, on juste ajoute l'attribut quantite dans la relation. 
### Neo4j traite les requêtes plus facilement que PostgreSQL
    Par exemple:
    Quand on fait le requete pour trouver le client qui possede l'animal nommé Phe:
    
    Avec PostgreSQL:
    SELECT c.nom, c.prenom
    FROM Client c
    LEFT JOIN Animal a ON a.ID_client = c.ID_client
    where a.nom='Phe';
    
    Avec Neo4j:
    
    MATCH(c:client)-[:possède]->(a:animal)
    WHERE a.nom='Phe'
    RETURN c.nom, c.prenom;
    
    ou 
    
    MATCH (:animal { nom: 'Phe' })<--(client)
    RETURN client.nom, client.prenom;

    Les flèches dans Neo4J peuvent remplacer les jointures des tables qui causent la complexité de code.