CREATE OR REPLACE TYPE personne AS OBJECT (
    nom varchar(30),
    prenom varchar(30),
    naissance date,
    adresse varchar(30),
    telephone number(10)
);
/

CREATE OR REPLACE TYPE effet_sec AS OBJECT (
    effets varchar(30)
);
/

CREATE OR REPLACE TYPE col_effet AS TABLE OF effet_sec;
/

CREATE TABLE classe (
    nom varchar(20),
    PRIMARY KEY (nom)
);

CREATE TABLE espece (
    nom varchar(20),
    classe varchar(20),
    FOREIGN KEY (classe) REFERENCES classe(nom),
    PRIMARY KEY (nom)
);

CREATE TABLE clients (
    code int,
    info personne NOT NULL,
    PRIMARY KEY (code)
);

CREATE TABLE veterinaire (
    code int,
    info personne NOT NULL,
    specialite varchar(20),
    PRIMARY KEY (code),
    FOREIGN KEY (specialite) REFERENCES classe(nom)
);

CREATE TABLE animal (
    code int,
    nom varchar(30) NOT NULL,
    poids float NOT NULL,
    taille float NOT NULL,
    naissance date,
    espece varchar(30),
    proprietaire int,
    CHECK ((poids > 0) AND (taille > 0)),
    FOREIGN KEY (espece) REFERENCES espece(nom),
    FOREIGN KEY (proprietaire) REFERENCES clients(code),
    PRIMARY KEY (code)
);

CREATE TABLE medicament (
    molecule varchar(30),
    description varchar(100) NOT NULL,
    effets_secondaire col_effet,
    PRIMARY KEY (molecule))
    NESTED TABLE effets_secondaire STORE AS nteffet;
    
CREATE TABLE med_correspond_ani (
    medicament varchar(30),
    espece varchar(30),
    FOREIGN KEY (medicament) REFERENCES medicament(molecule),
    FOREIGN KEY (espece) REFERENCES espece(nom),
    PRIMARY KEY (medicament, espece)
);

CREATE TABLE traitement (
    code int,
    debut DATE NOT NULL,
    duree INT NOT NULL,
    nom varchar(30) NOT NULL,
    animal int,
    veterinaire int,
    PRIMARY KEY (code),
    FOREIGN KEY (animal) REFERENCES animal(code),
    FOREIGN KEY (veterinaire) REFERENCES veterinaire(code),
    CHECK (duree > 0)
);

CREATE TABLE medi_traitement (
    traitement int,
    medicament varchar(30),
    qte_pj int NOT NULL,
    FOREIGN KEY (traitement) REFERENCES traitement(code),
    FOREIGN KEY (medicament) REFERENCES medicament(molecule),
    CHECK (qte_pj > 0),
    UNIQUE(traitement, qte_pj),
    PRIMARY KEY (traitement,medicament)
);