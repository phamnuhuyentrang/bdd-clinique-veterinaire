#### Notes
Tous les attributs sont NOT NULL par défaut
Tous les héritages sont exclusifs

#### Relationnel

Client(#nom: string, #prenom: string, naissance: date, adresse: string, numero: varchar(10))

Assistant(#nom: string, #prenom: string, naissance: date, adresse: string, numero: varchar(10),specialite=>Classe) 

Veterinaire(#nom: string, #prenom: string, naissance: date, adresse: string, numero: varchar(10), specialite=>Classe)

Classe(#nomClasse: string)

Espece(#nomEspece: string, nomClasse=>Classe)

Animal(#nom: string, poids: float, taille: float, naissance: date,
    nom_client=>Client(nom), prenom_client=>Client(prenom), espece=>Espece(nom))
		avec {poids > 0, taille > 0; naissance = (NULL OR date)}

Traitement(#nom:string, debut: date, dure:int, animal=>Animal(nom),
		nom_veterinaire=>Veterinaire(nom),prenom_veterinaire=>Veterinaire(prenom)) avec {dure>0}

Medicament(#nom: string, description: string)
    avec { la methode espece_autoriser() qui renvois
		vrai si l'animal peut prendre le médicament }

Effet_secondaire(#code:varchar(6), description: string)

Medicament_Effet(#medicament=>Medicament(nom),#effet=>Effet_secondaire(code)) 

Espece_Medicament(#nomEspece=>Espece, #nomMolec=>Medicament)

Traitement_Medicament(#traitement=>Traitement(nom), #medicament=>Medicament(nom),nbjournalier: int)

#### Contraintes
Classe - Espece:Projection(Classe, nomClasse) = Projection(Espece, nomClasse)

Dans la classe Client: Projection(Client, nom,prenom)=Projection(Animal,nom_client,prenom_client)

Jointure(Projection(Assistant, nom, prenom), Projection(Veterinaire, nom, prenom), Assistant.nom=Veterinaire.nom and Assistant.prenom=Veterinaire.prenom) doit être vide

#### Vues
vPersonnel(
Union(
	Projection(Assistant, nom, prenom, naissance, adresse, numero, specialite),
	Projection(Veterinaire, nom, prenom, naissance, adresse, numero, specialite)
	)
)

vPersonne(
Union(
	Union(
		Projection(Veterinaire, nom, prenom, naissance, adresse, numero, specialite)
		Projection(Assistant, nom, prenom, naissance, adresse, numero, specialite)
	}
		Projection(Client, nom, prenom, naissance, adresse, numero)
)

#### Justification heritage

Nous avons effectué des héritage par classe fille, car nos classes mère etaient toutes abstraites et les classes filles sont impliquées dans plusieurs associations.
Il etait plus simple et coherent de garder les classes filles et non pas les classes mères.
Inconvenients : Le XOR doit etre geré au niveau applicatif et division de l'association entre classe et personnel en deux associations différentes
