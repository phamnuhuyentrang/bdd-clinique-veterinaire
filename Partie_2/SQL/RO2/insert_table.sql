/*clients*/

insert into clients values (0001,'Nguyen', 'Triet', TO_DATE('1998-06-12','YYYY-MM-DD'), '15 Rue Winston Churchill', 0698593783);
insert into clients values (0002,'Nguyen', 'Dung', TO_DATE('1998-01-04','YYYY-MM-DD'), '1 Rue de Paris', 0697142635);
insert into clients values (0003,'Colin', 'Lafond', TO_DATE('1998-01-01','YYYY-MM-DD'), 'Compiegne', 0123456789);
insert into clients values (0004,'Bennis', 'Saad', TO_DATE('1998-02-02','YYYY-MM-DD'), 'France', 0123456779);
insert into clients values (0005,'Nguyen', 'Bo', TO_DATE('1998-08-12','YYYY-MM-DD'), 'Delaidde', 0987654321);
/
/*classe*/

insert into classe values ('Mammifiere');
insert into classe values ('Oiseaux');
insert into classe values ('Reptiles');
insert into classe values ('Autres');
/
/*espece*/

declare 

    Mref REF TCLASSE;
    Oref REF TCLASSE;
    Rref REF TCLASSE;
    Aref REF TCLASSE;
    
begin 
    
    select REF(c) into Mref
    from CLASSE c
    where c.NOM='Mammifiere';
    
    select REF(c) into Oref
    from CLASSE c
    where c.NOM='Oiseaux';
    
    select REF(c) into Rref
    from CLASSE c
    where c.NOM='Reptiles';   
    
    select REF(c) into Aref
    from CLASSE c
    where c.NOM='Autres';
    
    insert into ESPECE values ('Chien',Mref);
    insert into ESPECE values ('Chat',Mref);
    insert into ESPECE values ('Perrot',Oref);
    insert into ESPECE values ('Poisson',Aref);
    insert into ESPECE values ('Scarabée',Rref);    
   
end;  
/
/*Animal*/

declare 

    chien REF TESPECE;
    chat REF TESPECE;
    perrot REF TESPECE;
    poisson REF TESPECE;
    scarabee REF TESPECE;
    
    client1 REF PERSONNE;
    client2 REF PERSONNE;
    client3 REF PERSONNE;
    client4 REF PERSONNE;
    client5 REF PERSONNE;
    
begin 
    
    select REF(e) into chien
    from ESPECE e
    where e.NOM='Chien';
    
    select REF(e) into chat
    from ESPECE e
    where e.NOM='Chat';
    
    select REF(e) into perrot
    from ESPECE e
    where e.NOM='Perrot';   
    
    select REF(e) into poisson
    from ESPECE e
    where e.NOM='Poisson';
    
    select REF(e) into scarabee
    from ESPECE e
    where e.NOM='Scarabée';
    
    select REF(c) into client1
    from clients c
    where c.code=0001;
    
    select REF(c) into client2
    from clients c
    where c.code=0002;
    
    select REF(c) into client3
    from clients c
    where c.code=0003;
    
    select REF(c) into client4
    from clients c
    where c.code=0004;
        
    select REF(c) into client5
    from clients c
    where c.code=0005;
    
    
    
    insert into ANIMAL values (0001,'Phe',20,20,TO_DATE('2008-06-01','YYYY-MM-DD'),chien,client2);
    insert into ANIMAL values (0002,'KiKi',30,25,TO_DATE('2006-01-06','YYYY-MM-DD'),chat,client1);
    insert into ANIMAL values (0003,'Nemo',5,5,TO_DATE('2001-01-01','YYYY-MM-DD'),poisson,client5);
    insert into ANIMAL values (0004,'Jason',10,10,TO_DATE('2009-01-01','YYYY-MM-DD'),perrot,client3);
    insert into ANIMAL values (0005,'Triet',4,4,TO_DATE('2010-01-01','YYYY-MM-DD'),scarabee,client4);

  
   
end;  
/
/*veterinaire*/

declare 

    Mref REF TCLASSE;
    Oref REF TCLASSE;
    Rref REF TCLASSE;
    Aref REF TCLASSE;
    
begin 
    
    select REF(c) into Mref
    from CLASSE c
    where c.NOM='Mammifiere';
    
    select REF(c) into Oref
    from CLASSE c
    where c.NOM='Oiseaux';
    
    select REF(c) into Rref
    from CLASSE c
    where c.NOM='Reptiles';   
    
    select REF(c) into Aref
    from CLASSE c
    where c.NOM='Autres';
    
    
    
    insert into VETERINAIRE values (0001,'Alex','Sandro',to_date('1970-08-14','YYYY-MM-DD'),'12 Rue Saint Saens',0789124536,Mref);
    insert into VETERINAIRE values (0002,'Mohamed','Salah',to_date('1983-07-09','YYYY-MM-DD'),'1 Rue Victoria',0304512368,ORef);
    insert into VETERINAIRE values (0003,'Triet','Tran',to_date('1989-09-08','YYYY-MM-DD'),'13 Rue Winston Churchill',0998989898,Rref);
    insert into VETERINAIRE values (0004,'Nguyen','Po',to_date('1997-12-12','YYYY-MM-DD'),'Vietnam',0798899889,Mref);
    insert into VETERINAIRE values (0005,'Pham','Trang',to_date('1978-02-01','YYYY-MM-DD'),'France',0890090909,Aref);
   
end;  
/
/*traitement*/

declare 

    ani1 REF TANIMAL;
    ani2 REF TANIMAL;
    ani3 REF TANIMAL;
    ani4 REF TANIMAL;
    ani5 REF TANIMAL;
    
    vet1 REF TEMPLOYE;
    vet2 REF TEMPLOYE;
    vet3 REF TEMPLOYE;
    vet4 REF TEMPLOYE;
    vet5 REF TEMPLOYE;
    
begin 
    
    select REF(a) into ani1
    from ANIMAL a
    where a.code=0001;
    
    select REF(a) into ani2
    from ANIMAL a
    where a.code=0002;
    
    select REF(a) into ani3
    from ANIMAL a
    where a.code=0003;
    
    select REF(a) into ani4
    from ANIMAL a
    where a.code=0004;
    
    select REF(a) into ani5
    from ANIMAL a
    where a.code=0005;
    
    select REF(v) into vet1
    from VETERINAIRE v
    where v.code=0001;
    
    select REF(v) into vet2
    from VETERINAIRE v
    where v.code=0002;
    
    select REF(v) into vet3
    from VETERINAIRE v
    where v.code=0003;
    
    select REF(v) into vet4
    from VETERINAIRE v
    where v.code=0004;
        
    select REF(v) into vet5
    from VETERINAIRE v
    where v.code=0005;
    
    
    
    insert into TRAITEMENT values (0001,to_date('2019-05-08','yyyy-mm-dd'),2,'Optique',ani1,vet2);
    insert into TRAITEMENT values (0002,to_date('2019-05-07','yyyy-mm-dd'),3 ,'Osteopathie',ani2,vet3);
    insert into TRAITEMENT values (0003,to_date('2019-05-04','yyyy-mm-dd'),6,'Soin de ventre',ani5,vet5);
    insert into TRAITEMENT values (0004,to_date('2019-05-02','yyyy-mm-dd'),4,'Soin des yeux',ani4,vet4);
    insert into TRAITEMENT values (0005,to_date('2019-05-01','yyyy-mm-dd'),5,'Traitement général',ani3,vet1);

  
   
end;  
/
/*medicament*/

insert into Medicament values ('Vitamin A','bon pour yeux','pas bon pour bebe et pas bon pour female pregnant');
insert into Medicament values ('Vitamin D','bon pour os', 'pas bon pour female pregnant');
insert into Medicament values ('Vitamin B','bon pour ventre', 'pas bon pour female pregnant');
insert into Medicament values ('Omega 3','vitamin A et D', 'pas bon pour bebe');

/*Médicament correspond animal*/

declare 

    vitA REF TMEDICAMENT ;
    vitB REF TMEDICAMENT ;
    vitD REF TMEDICAMENT ;
    om3 REF TMEDICAMENT ;
    
    chien REF TESPECE;
    chat REF TESPECE;
    perrot REF TESPECE;
    poisson REF TESPECE;
    scarabee REF TESPECE;
    
begin 
    
    select REF(e) into chien
    from ESPECE e
    where e.NOM='Chien';
    
    select REF(e) into chat
    from ESPECE e
    where e.NOM='Chat';
    
    select REF(e) into perrot
    from ESPECE e
    where e.NOM='Perrot';   
    
    select REF(e) into poisson
    from ESPECE e
    where e.NOM='Poisson';
    
    select REF(e) into scarabee
    from ESPECE e
    where e.NOM='Scarabée';
    
    select REF(m) into vitA
    from MEDICAMENT m
    where m.molecule='Vitamin A';
    
    select REF(m) into vitB
    from MEDICAMENT m
    where m.molecule='Vitamin B';
    
    select REF(m) into vitD
    from MEDICAMENT m
    where m.molecule='Vitamin D';
    
    select REF(m) into om3
    from MEDICAMENT m
    where m.molecule='Omega 3';
    
    
    insert into MEDI_CORESPOND_ANI values (vitA,chat);
    insert into MEDI_CORESPOND_ANI values (vitA,chien);
    insert into MEDI_CORESPOND_ANI values (vitD,chien);
    insert into MEDI_CORESPOND_ANI values (vitD,chat);
    insert into MEDI_CORESPOND_ANI values (om3,poisson);
    insert into MEDI_CORESPOND_ANI values (vitB,scarabee);
    insert into MEDI_CORESPOND_ANI values (om3,scarabee);

  
   
end;  
/
/* medicament correspond traitement */

declare 

    vitA REF TMEDICAMENT ;
    vitB REF TMEDICAMENT ;
    vitD REF TMEDICAMENT ;
    om3 REF TMEDICAMENT ;
    
    traite1 REF TTRAITEMENT ;
    traite2 REF TTRAITEMENT ;
    traite3 REF TTRAITEMENT ;
    traite4 REF TTRAITEMENT ;
    traite5 REF TTRAITEMENT ;
    
begin 
    
    select REF(t) into traite1
    from TRAITEMENT t
    where t.code=0001;
    
    select REF(t) into traite2
    from TRAITEMENT t
    where t.code=0002;
    
    select REF(t) into traite3
    from TRAITEMENT t
    where t.code=0003;  
    
    select REF(t) into traite4
    from TRAITEMENT t
    where t.code=0004;
    
    select REF(t) into traite5
    from TRAITEMENT t
    where t.code=0005;
    
    select REF(m) into vitA
    from MEDICAMENT m
    where m.molecule='Vitamin A';
    
    select REF(m) into vitB
    from MEDICAMENT m
    where m.molecule='Vitamin B';
    
    select REF(m) into vitD
    from MEDICAMENT m
    where m.molecule='Vitamin D';
    
    select REF(m) into om3
    from MEDICAMENT m
    where m.molecule='Omega 3';
    
    
    insert into MEDI_TRAITEMENT values (traite1,vitD,4);
    insert into MEDI_TRAITEMENT values (traite2,om3,5);
    insert into MEDI_TRAITEMENT values (traite3,vitA,4);
    insert into MEDI_TRAITEMENT values (traite4,vitB,6);
    insert into MEDI_TRAITEMENT values (traite5,om3,8);
    insert into MEDI_TRAITEMENT values (traite5,vitD,2);

  
   
end;  

