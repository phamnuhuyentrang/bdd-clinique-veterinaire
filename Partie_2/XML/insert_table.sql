//client
insert into Client values (0001,'Nguyen','Triet',to_date('1998-06-12','yyyy-mm-dd'),'15 Rue Winston Churchill','0698593783');
insert into Client values (0002,'Nguyen','Dung',to_date('1998-01-04','yyyy-mm-dd'),'1 Rue de Paris','0697142635');
insert into Client values (0003,'Colin','Lafond',to_date('1998-01-01','yyyy-mm-dd'),'Compiegne','0123456789');
insert into Client values (0004,'Bennis','Saad',to_date('1998-02-02','yyyy-mm-dd'),'France','0123456779');
insert into Client values (0005,'Nguyen','Bo',to_date('1998-08-12','yyyy-mm-dd'),'Delaidde','0987654321');
/
//classe
insert into Classe values ('Mammifiere');
insert into Classe values ('Oiseaux');
insert into Classe values ('Reptiles');
insert into Classe values ('Autres');
/
//espece
insert into Espece values ('Chien','Mammifiere');
insert into Espece values ('Chat','Mammifiere');
insert into Espece values ('Perrot','Oiseaux');
insert into Espece values ('Poisson','Autres');
insert into Espece values ('Scarabée','Reptiles');
/
//animal
insert into animal values (0001,'Phe',20,20,to_date('2008-06-01','yyyy-mm-dd'),'Chien',0002,XMLTYPE('
<traitement>
    <code>1</code>
    <debut>08:00:00</debut>
    <duree>1</duree>
    <nom>Optique</nom>
    <veterinaire>
        <nom>Mohamed</nom>
    </veterinaire>
    <medicaments>
        <medicament>
            <nom>Vitamin D</nom>
            <quantite>4</quantite>
        </medicament>
    </medicaments>
</traitement>'));
insert into animal values (0002,'KiKi',30,25,to_date('2006-01-06','yyyy-mm-dd'),'Chat',0001,XMLTYPE('
<traitement>
    <code>1</code>
    <debut>08:00:00</debut>
    <duree>1</duree>
    <nom>Optique</nom>
    <veterinaire>
        <nom>Mohamed</nom>
    </veterinaire>
    <medicaments>
        <medicament>
            <nom>Vitamin D</nom>
            <quantite>4</quantite>
        </medicament>
    </medicaments>
</traitement>'));
insert into animal values (0003,'Nemo',5,5,to_date('2001-01-01','yyyy-mm-dd'),'Poisson',0005,XMLTYPE('
<traitement>
    <code>5</code>
    <debut>19:00:00</debut>
    <duree>5</duree>
    <nom>Traitement général</nom>
    <veterinaire>
        <nom>Triet</nom>
    </veterinaire>
    <medicaments>
        <medicament>
            <nom>Omega 3</nom>
            <quantite>8</quantite>
        </medicament>
        <medicament>
            <nom>Vitamin D</nom>
            <quantite>2</quantite>
         </medicament>
    </medicaments>
</traitement>'));
insert into animal values (0004,'Jason',10,10,to_date('2009-01-01','yyyy-mm-dd'),'Perrot',0003,XMLTYPE('
 <traitement>
    <code>4</code>
    <debut>17:00:00</debut>
    <duree>4</duree>
    <nom>Soin des yeux</nom>
    <veterinaire>
        <nom>Nguyen</nom>
    </veterinaire>
    <medicaments>
        <medicament>
            <nom>Vitamin B</nom>
            <quantite>6</quantite>
        </medicament>
    </medicaments>   
</traitement>'));
insert into animal values (0005,'Triet',4,4,to_date('2010-01-01','yyyy-mm-dd'),'Scarabée',0004,XMLTYPE('
<traitement>
    <code>3</code>
    <debut>13:00:00</debut>
    <duree>3</duree>
    <nom>Soin de ventre</nom>
    <veterinaire>
        <nom>Pham</nom>
    </veterinaire>
    <medicaments>
        <medicament>
            <nom>Vitamin A</nom>
            <quantite>4</quantite>
        </medicament>
    </medicaments>
</traitement>'));
