/*Clients*/

insert into clients values (1,personne('Nguyen', 'Triet', TO_DATE('1998-06-12','YYYY-MM-DD'), '15 Rue Winston Churchill', 0698593783));
insert into clients values (2,personne('Nguyen', 'Dung', TO_DATE('1998-01-04','YYYY-MM-DD'), '1 Rue de Paris', 0697142635));
insert into clients values (3,personne('Colin', 'Lafond', TO_DATE('1998-01-01','YYYY-MM-DD'), 'Compiegne', 0123456789));
insert into clients values (4,personne('Bennis', 'Saad', TO_DATE('1998-02-02','YYYY-MM-DD'), 'France', 0123456779));
insert into clients values (5,personne('Nguyen', 'Bo', TO_DATE('1998-08-12','YYYY-MM-DD'), 'Delaidde', 0987654321));

/*Classe*/

insert into classe values ('Mammifiere');
insert into classe values ('Oiseaux');
insert into classe values ('Reptiles');
insert into classe values ('Autres');

/*Vétérinaire*/

insert into veterinaire(code,info,specialite) values (1,personne('Alex','Sandro',to_date('1970-08-14','YYYY-MM-DD'),'12 Rue Saint Saens',0789124536),'Mammifiere');
insert into veterinaire(code,info,specialite) values (2,personne('Mohamed','Salah',to_date('1983-07-09','YYYY-MM-DD'),'1 Rue Victoria',0304512368),'Oiseaux');
insert into veterinaire(code,info,specialite) values (3,personne('Triet','Tran',to_date('1989-09-08','YYYY-MM-DD'),'13 Rue Winston Churchill',0998989898),'Reptiles');
insert into veterinaire(code,info,specialite) values (4,personne('Nguyen','Po',to_date('1997-12-12','YYYY-MM-DD'),'Vietnam',0798899889),'Mammifiere');
insert into veterinaire(code,info,specialite) values (5,personne('Pham','Trang',to_date('1978-02-01','YYYY-MM-DD'),'France',0890090909),'Autres');

/*Espèces*/

insert into espece values ('Chien','Mammifiere');
insert into espece values ('Chat','Mammifiere');
insert into espece values ('Perrot','Oiseaux');
insert into espece values ('Poisson','Autres');
insert into espece values ('Scarabée','Reptiles');

/*Animals*/

insert into animal values (1,'Phe',20,20,TO_DATE('2008-06-01','YYYY-MM-DD'),'Chien',2);
insert into animal values (2,'KiKi',30,25,TO_DATE('2006-01-06','YYYY-MM-DD'),'Chat',1);
insert into animal values (3,'Nemo',5,5,TO_DATE('2001-01-01','YYYY-MM-DD'),'Poisson',5);
insert into animal values (4,'Jason',10,10,TO_DATE('2009-01-01','YYYY-MM-DD'),'Perrot',3);
insert into animal values (5,'Triet',4,4,TO_DATE('2010-01-01','YYYY-MM-DD'),'Scarabée',4);

/*Médicaments*/

insert into Medicament values ('Vitamin A','bon pour yeux', col_effet(effet_sec('pas bon pour bebe'), effet_sec('pas bon pour female pregnant')));
insert into Medicament values ('Vitamin D','bon pour os', col_effet(effet_sec('pas bon pour female pregnant')));
insert into Medicament values ('Vitamin B','bon pour ventre', col_effet(effet_sec('pas bon pour female pregnant')));
insert into Medicament values ('Omega 3','vitamin A et D', col_effet(effet_sec('pas bon pour bebe')));

/*Médicament correspond animal*/

insert into med_correspond_ani values ('Vitamin A','Chat');
insert into med_correspond_ani values ('Vitamin A','Chien');
insert into med_correspond_ani values ('Vitamin D','Chien');
insert into med_correspond_ani values ('Vitamin D','Chat');
insert into med_correspond_ani values ('Omega 3','Poisson');
insert into med_correspond_ani values ('Vitamin B','Scarabée');
insert into med_correspond_ani values ('Omega 3','Scarabée');

/*Traitement*/
insert into Traitement values (1,to_date('2019-05-08','yyyy-mm-dd'),2,'Optique',1,2);
insert into Traitement values (2,to_date('2019-05-07','yyyy-mm-dd'),3 ,'Osteopathie',2,3);
insert into Traitement values (3,to_date('2019-05-04','yyyy-mm-dd'),6,'Soin de ventre',5,5);
insert into Traitement values (4,to_date('2019-05-02','yyyy-mm-dd'),4,'Soin des yeux',4,4);
insert into Traitement values (5,to_date('2019-05-01','yyyy-mm-dd'),5,'Traitement général',3,1);


/*Traitement - Médicament*/
insert into medi_traitement values (1,'Vitamin D',4);
insert into medi_traitement values (2,'Omega 3',5);
insert into medi_traitement values (3,'Vitamin A',4);
insert into medi_traitement values (4,'Vitamin B',6);
insert into medi_traitement values (5,'Omega 3',8);
insert into medi_traitement values (5,'Vitamin D',2);

