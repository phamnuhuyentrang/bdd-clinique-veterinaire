Create table Client (
	ID_Client INT UNIQUE NOT NULL,
	Nom varchar(30) NOT NULL,
	Prenom varchar(30) NOT NULL,
	Date_de_naissance date NOT NULL,
	Addresse varchar(100) NOT NULL,
	Numero_de_telephone varchar(10) NOT NULL,
	unique(Nom, Prenom, Date_de_naissance),
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
	unique(Nom, Prenom, Date_de_naissance),
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
	unique(Nom, Prenom, Date_de_naissance),
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

Create table Medicament (
	Nom_de_molecule varchar(30) NOT NULL PRIMARY KEY,
	Description varchar(100) NOT NULL,
	Effets_secondaires varchar(255)
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
    foreign key(Veterinaire) references Veterinaire,
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


/*Insert values*/
insert into Client values (1,'Nguyen','Triet','1998-06-12','15 Rue Winston Churchill','0698593783');
insert into Client values (2,'Nguyen','Dung','1998-01-04','1 Rue de Paris','0697142635');
insert into Client values (3,'Colin','Lafond','1998-01-01','Compiegne','0123456789');
insert into Client values (4,'Bennis','Saad','1998-02-02','France','0123456779');
insert into Client values (5,'Nguyen','Bo','1998-08-12','Delaidde','0987654321');

insert into Classe_animal values ('Mammifiere');
insert into Classe_animal values ('Oiseaux');
insert into Classe_animal values ('Reptiles');
insert into Classe_animal values ('Autres');

insert into Veterinaire values (1,'Alex','Sandro','1970-08-14','12 Rue Saint Saens','0789124536','Mammifiere');
insert into Veterinaire values (2,'Mohamed','Salah','1983-07-09','1 Rue Victoria','0304512368','Oiseaux');
insert into Veterinaire values (3,'Triet','Tran','1989-09-08','13 Rue Winston Churchill','0998989898','Reptiles');
insert into Veterinaire values (4,'Nguyen','Po','1997-12-12','Vietnam','0798899889','Mammifiere');
insert into Veterinaire values (5,'Pham','Trang','1978-02-01','France','0890090909','Autres');

insert into Assistant values (6,'Kilian','Mbappe','1989-06-21','12 Rue Palais','0898456321','Mammifiere');
insert into Assistant values (7,'Leonel','Messi','1987-05-04','1 Rue Auguste','0945361785','Reptiles');

insert into Espece values ('Chien','Mammifiere');
insert into Espece values ('Chat','Mammifiere');
insert into Espece values ('Perrot','Oiseaux');
insert into Espece values ('Poisson','Autres');
insert into Espece values ('Scarabée','Reptiles');

insert into Animal values (1,'Phe',20,20,'2008-06-01','Chien',2);
insert into Animal values (2,'KiKi',30,25,'2006-01-06','Chat',1);
insert into Animal values (3,'Nemo',5,5,'2001-01-01','Poisson',5);
insert into Animal values (4,'Jason',10,10,'2009-01-01','Perrot',3);
insert into Animal values (5,'Triet',4,4,'2010-01-01','Scarabée',4);

insert into Medicament values ('Vitamin A','bon pour yeux',’pas bon pour bebe’);
insert into Medicament values ('Vitamin D','bon pour os','pas bon pour female pregnant');
insert into Medicament values ('Vitamin B','bon pour ventre',’pas bon pour bebe et female pregnant’);
insert into Medicament values ('Omega 3','vitamin A et D',’pas bon pour bebe et female pregnant’);

insert into Med_correspond_Ani values ('Vitamin A','Chat');
insert into Med_correspond_Ani values ('Vitamin A','Chien');
insert into Med_correspond_Ani values ('Vitamin D','Chien');
insert into Med_correspond_Ani values ('Vitamin D','Chat');
insert into Med_correspond_Ani values ('Omega 3','Poisson');
insert into Med_correspond_Ani values ('Vitamin B','Scarabée');
insert into Med_correspond_Ani values ('Omega 3','Scarabée');

insert into Traitement values (1,'08:00:00','01:00:00','Optique',1,2);
insert into Traitement values (2,'10:00:00','01:30:00','Osteopathie',2,3);
insert into Traitement values (3,'13:00:00','02:01:00','Soin de ventre',5,5);
insert into Traitement values (4,'17:00:00','00:30:00','Soin des yeux',4,4);
insert into Traitement values (5,'19:00:00','01:00:00','Traitement général',3,1);

insert into Traitement_Medicament values (1,'Vitamin D',4);
insert into Traitement_Medicament values (2,'Omega 3',5);
insert into Traitement_Medicament values (3,'Vitamin A',4);
insert into Traitement_Medicament values (4,'Vitamin B',6);
insert into Traitement_Medicament values (5,'Omega 3',8);
insert into Traitement_Medicament values (5,'Vitamin D',2);