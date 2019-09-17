/*Vue Personnel*/


CREATE VIEW Personnel AS (Select * From Assistant UNION ALL SELECT * FROM Veterinaire);



/*Vue Personne*/

CREATE VIEW Personne AS (Select Nom, Prenom, Date_de_naissance, Addresse, Numero_de_telephone From Client UNION ALL SELECT Nom, Prenom, Date_de_naissance, Addresse, Numero_de_telephone FROM Personnel);

/*Contraintes à tester */

/*cette vue permettra de verifier si il y a des assistant qui sont aussi veterinaire, il faudra que cette vue soit toujours nulle pour symobliser le XOR*/
/*CREATE VIEW Personnel_test AS (Select * From Assistant INNER JOIN Veterinaire ON Assistant.Nom = Veterinaire.nom AND Assistant.prenom = Veterinaire.prenom);*/ 

/*cette vue permettra de verifier si il y a des clients qui sont aussi veterinaire, il faudra que cette vue soit toujours nulle pour symobliser le XOR*/
/*CREATE VIEW Personnel_Client_test AS (Select * From Client INNER JOIN Veterinaire ON Client.Nom = Veterinaire.nom AND Client.prenom = Veterinaire.prenom AND Client.adresse = Veterinaire.adresse );*/

/*cette vue permettra de verifier si il y a des clients qui sont aussi Assistant, il faudra que cette vue soit toujours nulle pour symobliser le XOR*/
/*CREATE VIEW Assistant_Client_test AS (Select * From Client INNER JOIN Assistant ON Client.Nom = Assistant.nom AND Client.prenom = Assistant.prenom AND Client.adresse = Assistant.adresse );*/ 
