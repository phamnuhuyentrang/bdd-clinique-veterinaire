Create table Client (
	ID_Client INT UNIQUE NOT NULL,
	Nom varchar(30) NOT NULL,
	Prenom varchar(30) NOT NULL,
	Date_de_naissance date NOT NULL,
	Addresse varchar(100) NOT NULL,
	Numero_de_telephone varchar(10) NOT NULL,
    CHECK(Numero_de_telephone SIMILAR TO '[0-9]{10}'),
    PRIMARY KEY(ID_Client)
);

Create table Classe_animal (
	Nom varchar(30) NOT NULL PRIMARY Key
);

Create table Veterinaire (
	ID_personnel INT UNIQUE NOT NULL PRIMARY KEY,
	Nom varchar(30) NOT NULL,
	prenom varchar(30) NOT NULL,
	Date_de_naissance date NOT NULL,
	Addresse varchar(100) NOT NULL,
	Numero_de_telephone varchar(30) NOT NULL,
	Specialite varchar(30), 
    foreign key (Specialite) references Classe_animal(Nom)
);

Create table Assistant (
	ID_personnel INT UNIQUE NOT NULL PRIMARY KEY,
	Nom varchar(30) NOT NULL,
	prenom varchar(30) NOT NULL,
	Date_de_naissance date NOT NULL,
	Addresse varchar(100) NOT NULL,
	Numero_de_telephone varchar(30) NOT NULL,
	Specialite varchar(30),
    foreign key (Specialite) references Classe_animal(Nom)
);

Create table Espece (
	Nom varchar(30) NOT NULL PRIMARY KEY,
	Classe varchar(30), 
    foreign key(Classe) references Classe_animal(Nom)
);

/*Ici on suppose que il reste des animaux qui ont même nom*/
Create table Animal (
	ID_Animal INT UNIQUE NOT NULL PRIMARY KEY,
	Nom varchar(30) NOT NULL,
	Poids FLOAT NOT NULL,
	Taille FLOAT NOT NULL,
	Date_de_naissance date,
	Espece varchar(30), 
    foreign key(Espece) references Espece(Nom),
	ID_Client INT, 
    foreign key(ID_Client) references Client(ID_Client),
	CHECK ((Poids > 0) AND (Taille > 0))
);

Create table Effets_secondaires (
	ID_effet_secondaire INT UNIQUE NOT NULL PRIMARY KEY,
	Effets varchar(100) NOT NULL
);

Create table Medicament (
	Nom_de_molecule varchar(30) NOT NULL PRIMARY KEY,
	Description varchar(100) NOT NULL
);

/*C'est une classe d'association*/
Create table Medicament_Effet (
	Medicament varchar(30), 
    foreign key(Medicament) references Medicament(Nom_de_molecule),
	Effets_secondaires INT, 
    foreign key(Effets_secondaires) references Effets_secondaires(ID_effet_secondaire),
    PRIMARY KEY(Medicament,Effets_secondaires)
);

/*C'est une classe d'association*/
Create table Med_correspond_Ani (
	Medicament varchar(30), 
    foreign key(Medicament) references Medicament(Nom_de_molecule),
	Espece varchar(30), 
    foreign key(Espece) references Espece(Nom),
    PRIMARY KEY(Medicament,Espece)
);

Create table Traitement (
	ID_Traitement INT UNIQUE NOT NULL PRIMARY KEY,
	Debut TIME NOT NULL,
	Duree TIME NOT NULL,
	Nom varchar(30) NOT NULL,
	ID_Animal INT, 
    foreign key(ID_Animal) references Animal(ID_Animal),
	Veterinaire INT,
    foreign key(Veterinaire) references Veterinaire(ID_personnel),
	CHECK (Duree <> '00:00:00')
);

/*C'est une classe d'association*/
Create table Traitement_Medicament (
	Traitement INT, 
    foreign key(Traitement) references Traitement(ID_Traitement),
	Medicament VARCHAR(30), 
    foreign key(Medicament) references Medicament(Nom_de_molecule),
	Quantite_medicaments_pj INT NOT NULL,
	CHECK (Quantite_medicaments_pj > 0),
	PRIMARY KEY(Traitement,Medicament)
);
