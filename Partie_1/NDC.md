Note de clarification 
===
# Projet de conception et de réalisation de la base de données de la clinique vétérinaire A

## Contexte du projet


Dans le cadre de l’UV NF17 le présent projet concerne la conception et la réalisation d’une base de donnée de gestion d’une clinique vétérinaire.

## Acteurs du projet


Maîtrise d’ouvrage : M. Z administrateur de la clinique, représenté par M. Lussier

Maîtrise d’œuvre :

-   Colin LAFOND
-   Saad BENNIS
-   Van Triet NGUYEN
-   Nu Huyen Trang PHAM

## Données d'entrée sur les différentes composantes du projet


- Aspect technique
    - Cahier des charges fourni par la MOA (référencé https://librecours.net/projet/projets-19p-nx17/projets-19p-nx17.xhtml)
    - Définition des contraintes techniques (référencé https://librecours.net/projet/projets-19p-nx17/cadre.xhtml)

- Aspect projet
    - Définition du cadre du projet (référencé https://librecours.net/projet/projets-19p-nx17/cadre.xhtml)

    - Définition des livrables attendus (référencé https://librecours.net/projet/projets-19p-nx17/livrables-nx17.xhtml)


## Objet du projet


Il s’agit de mener à bien les phases de définition et de réalisation d’un projet de développement informatique pour le compte de la clinique vétérinaire A. 

La phase de formalisation du projet a été réalisée par la maîtrise d'ouvrage avec le cahier des charges. 


Le projet a pour vocation d'améliorer l'organisation interne de la clinique grâce à une gestion informatisée des ressources humaines, des données des clients et de leurs animaux. Le projet permettra également de gérer des processus métiers tels que le suivi des prescriptions médicales des différents vétérinaires.

## Produits du projet


- Une base de données permettant de gérer l'ensemble des processus de la clinique vétérinaire.

- Concernant les traitements administrés,  l’administrateur peut avoir accès aux historiques des traitements d’un animal il faut donc que chaque animal puisse être lié à un ou plusieurs traitements et qu’un traitement puisse être utilisé pour un unique animal.

- L’administrateur de la clinique doit pouvoir mettre à jour le personnel ainsi que les clients et les animaux traités. Il doit aussi pouvoir sortir des statistiques des médicaments qu’il a prescrit pour un animal, ou du nombre de médicaments au total ou encore des caractéristiques des animaux traités par la clinique. 


**Synthèse des livrables attendus :**

- Note de clarification du projet
- Modèle Conceptuel de Données (MCD)
- Modèle Logique de Données (MLD)
- Base de données relationnelle avec ses principales requêtes SQL et des données de test
- Des preuves de concept (POC) pour Neo4J/MongoDB, Oracle RO, Oracle/XML et PostgreSQL/JSON.

## Objets principaux de la base de données


Les principaux objets manipulés par la base de données sont les suivants :

-   Client
-   Poste
-   Personnel
-   Classe d'espèce animale
-   Espèce
-   Animal
-   Médicament
-   Traitement

## Utilisateurs principaux

Les utilisateurs de la base de données sont l’administrateur de la clinique, les vétérinaires et les assistants vétérinaires.

## Rôles des utilisateurs


Les rôles des différents utilisateurs sur la base de données sont ici donnés à titre indicatif et peuvent évoluer au cours du projet en fonction des besoins de la MOA.

La base de données doit permettre au gestionnaire de la clinique d’ajouter de nouveaux clients ainsi que leurs animaux, membres du personnel et médicaments.

La base de données doit permettre aux vétérinaires d’enregistrer les traitements qu’ils ont donnés avec les différentes prescriptions de médicaments.


## Fonctions principales de la base de données




###  Gestion du personnel

Le personnel possède un ID_personnel (clé primaire) un nom, prénom, date de naissance, adresse ainsi qu’un numéro de téléphone.
Pour le poste, nous avons proposé de diviser en deux tables distinctes. D’après l'énoncé le traitement peut être réalisé par un seul vétérinaire. Néanmoins, le traitement peut être servi par plusieurs assistants. De ce fait, il y a un conflit pour la relation entre la table Personnel et la table Traitement (plus précisément, 1..* pour la relation Traitement - Vétérinaire; *..* pour la relation Traitement - Assistant). 
Pour résoudre ce problème, nous comptons créer la table Vétérinaire et la table Assistant dont le label est ID_Personnel pour identifier quel personnel fait quel poste). 
On estime dans notre BBD que nous ne pouvons pas ajouter de postes. 

Ensuite pour le critère spécialité des employés, nous avons jugé plus pertinent qu’un membre du personnel puisse avoir plusieurs spécialités (au moins une).

### Gestion des clients et de leurs animaux

On a donc besoin de créer une table Client liée à la table animal, un client peut avoir 1 ou plusieurs animaux à la clinique. Dans la table client se trouve le nom, prénom, la Date de naissance, l’adresse, le numéro de téléphone. à cela il nous faut ajouter une clé primaire qui correspond à l’id client pour pouvoir différencier les différents clients. Ainsi qu’un foreign key ID_animal pour savoir plus tard à quel client appartient chaque animal. 

La table Animal devra donc contenir en clé primaire ID_animal ainsi que le nom, le poids la taille ainsi que la date de naissance. On ajoute une foreign key ID_espèce permettant de lier la table espèce à la table Animal, étant donné qu’un animal doit être nécessairement lié à une unique espèce. Ainsi l’utilisateur pourra s’il le désire faire des statistiques sur une espèce en particulier. 

La table espèce contient en clé primaire l’ID_espèce ainsi qu’un nom et est lié à la table classe permettant de savoir à quel classe appartient chaque espèce. La table classe contenant en clé primaire l’ID_classe et un nom. Un animal appartient nécessairement à une seule espèce et une espèce appartient à seulement une classe. Inversement une classe peut contenir plusieurs espèces et une espèce plusieurs animaux. Avec ce système là il est possible d’ajouter une espèce ou une classe si l’utilisateur le désire.

### Gestion des traitements

La table médicament contient un nom de molécule et un ID_effet_secondaire en clé étrangère. Il nous semble logique qu’un médicament ne puisse engendrer aucun ou plusieurs effets secondaires, et ne puisse être utilisé par aucun ou plusieurs traitements pour aucune ou plusieurs classes. 

Une table traitement sera nécessaire : elle contiendra ID_ traitement (primary key) un début une durée. Elle est liée à la table animal car un traitement correspond à zéro ou plusieurs animaux ainsi qu’à la table vétérinaire et assistant pour savoir qui s’occupe du traitement. Sachant que comme dit précédemment un seul vétérinaire peut faire le traitement mais plusieurs assistants peuvent l’assister.
On précise qu'un traitement peut contenir aucun ou plusieurs médicaments.


## Propriétés des objets principaux de la base


**Client**

ID_Client: INT <primary key>
Nom: String(30)
Prenom: String(30)
Date_de_naissance: Date
Adresse: String(100)
Numero_de_telephone: String(20)


**Vétérinaire**

ID_Veterinaire: String(6) (commence par VTxxxx, ex: VT0112) <primary key>


**Assistant**

ID_Assistant: String(6) (commence par ASxxxx) <primary key>

**Personnel**

ID_Personnel: INT <primary key>
Nom: String(30)
Prenom: String(30)
Date_de_naissance: Date
Adresse: String(100)
Numero_de_telephone: String(20)
Poste: String(6) (le choix entre ID_Veterinaire et ID_Assistant) <foreign key>
ID_Classes: INT <foreign key>


**Classe d’animale**

ID_Classes: INT <primary key>
Nom: String(20)


**Espèce**

ID_Espèce: INT <primary key>
Nom: String(30)
ID_Classes: INT <foreign key>





**Animal**

ID_Animal: INT <primary key>
Nom: String(30)
Poids: INT
Taille: INT
Date_de_naissance: date
ID_Espèce: INT <foreign key>
ID_Client: INT <foreign key>

**Médicament**

ID_Medicament: INT <primary key>
Nom_de_molecule: String(30)
ID_Classes: INT <foreign key>
ID_effet_secondaire: INT <foreign key>

**Effets secondaires**
ID_effet_secondaire: INT <primary key>
Effets: String(100)

**Traitement**

ID_Traitement: INT <primary key>
Debut: Time
Duree: Time
Nom: String(30)
ID_Animal: INT <foreign key>
ID_Medicament: INT <foreign key>
Quantite_medicaments_pj: INT 
Veterinaire (ID_Veterinaire): String(6) <foreign key>
Assistant (ID_Assistant): String(6) <foreign key>


_______________________________


| Document : Note de clarification version 1 | Date: 12/03/2019 |
| -------------------------------------------| ---------------- |
