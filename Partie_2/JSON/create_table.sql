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
Create table Classe (
	Nom varchar(30) NOT NULL PRIMARY Key
);
Create table Espece (
	Nom varchar(30) NOT NULL PRIMARY KEY,
	Classe varchar(30), 
    foreign key(Classe) references Classe(Nom)
);
create table Animal (
	ID_Animal INT PRIMARY KEY,
	Nom varchar(30) NOT NULL,
	Poids FLOAT NOT NULL,
	Taille FLOAT NOT NULL,
	Date_de_naissance date,
	Espece varchar(30), 
    foreign key(Espece) references Espece(Nom),
	ID_Client INT, 
    foreign key(ID_Client) references Client(ID_Client),
	CHECK ((Poids > 0) AND (Taille > 0)),
	Traitement JSON
);

