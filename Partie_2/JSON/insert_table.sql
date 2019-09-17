/* client */
insert into Client values (1,'Nguyen','Triet','1998-06-12','15 Rue Winston Churchill','0698593783');
insert into Client values (2,'Nguyen','Dung','1998-01-04','1 Rue de Paris','0697142635');
insert into Client values (3,'Colin','Lafond','1998-01-01','Compiegne','0123456789');
insert into Client values (4,'Bennis','Saad','1998-02-02','France','0123456779');
insert into Client values (5,'Nguyen','Bo','1998-08-12','Delaidde','0987654321');
/* classe */
insert into Classe values ('Mammifiere');
insert into Classe values ('Oiseaux');
insert into Classe values ('Reptiles');
insert into Classe values ('Autres');
/* espece */
insert into Espece values ('Chien','Mammifiere');
insert into Espece values ('Chat','Mammifiere');
insert into Espece values ('Perrot','Oiseaux');
insert into Espece values ('Poisson','Autres');
insert into Espece values ('Scarabée','Reptiles');
/* animal */
insert into Animal values (1,'Phe',20,20,'2008-06-01','Chien',2,
'{"Debut":"18-05-2017",
  "Duree":"1",
  "Veterinaire":{"nom":"Alex","prenom":"Sandro"},
  "Medicament":[{"nom":"vitamin A","quantite":"1"},{"nom":"vitamin B","quantite":"5"}]}'
);
insert into Animal values (2,'KiKi',30,25,'2006-01-06','Chat',1,
'{"Debut":"20-05-2017",
  "Duree":"5",
  "Veterinaire":{"nom":"leonardo","prenom":"DaVinci"},
  "Medicament":[{"nom":"vitamin D","quantite":"2"},{"nom":"vitamin C","quantite":"9"}]}'
);

insert into Animal values (3,'Nemo',5,5,'2001-01-01','Poisson',5,
'{"Debut":"30-06-2017",
  "Duree":"2",
  "Veterinaire":{"nom":"Tran","prenom":"Tien"},
  "Medicament":[{"nom":"vitamin E","quantite":"9"},{"nom":"Omega 3","quantite":"4"},{"nom":"vitamin c","quantite":"5"}]}'
);

insert into Animal values (4,'Jason',10,10,'2009-01-01','Perrot',3,
'{"Debut":"21-07-2017",
  "Duree":"4",
  "Veterinaire":{"nom":"Kim","prenom":"Kook"},
  "Medicament":[{"nom":"vitamin B","quantite":"6"}]}'
);

insert into Animal values (5,'Triet',4,4,'2010-01-01','Scarabée',4,NULL);
