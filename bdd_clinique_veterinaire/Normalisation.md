Normalisation
===

# Les DF proposés

## Table Client

	ID_Client -> Nom
	ID_Client -> Prenom
	ID_Client -> Date_de_naissance
	ID_Client -> Addresse
	ID_Client -> Numero_de_telephone
	
	(Nom, Prenom, Date_de_naissance) -> Addresse
	(Nom, Prenom, Date_de_naissance) -> Numero_de_telephone



## Table Classe_animal

    NomCA -> NomCA

## Table Veterinaire

	ID_Personnel -> NomVe
	ID_Personnel -> PrenomVe
	ID_Personnel -> Date_de_naissanceVe
	ID_Personnel -> AddresseVe
	ID_Personnel -> Numero_de_telephoneVe
	ID_Personnel -> SpecialiteVe
	
	(NomVe, PrenomVe, Date_de_naissanceVe) -> AddresseVe
	(NomVe, PrenomVe, Date_de_naissanceVe) -> Numero_de_telephoneVe
	(NomVe, PrenomVe, Date_de_naissanceVe) -> SpecialiteVe
	

## Table Assistant

	ID_Personnel -> NomAs
	ID_Personnel -> PrenomAs
	ID_Personnel -> Date_de_naissanceAs
	ID_Personnel -> AddresseAs
	ID_Personnel -> Numero_de_telephoneAs
	ID_Personnel -> SpecialiteAs
	
	(NomAs, PrenomAs, Date_de_naissanceAs) -> AddresseAs
	(NomAs, PrenomAs, Date_de_naissanceAs) -> Numero_de_telephoneAs
	(NomAs, PrenomAs, Date_de_naissanceAs) -> SpecialiteAs

## Table Espece

	NomE -> ClasseE
	
	ClasseE -> NomAnimal

## Table Animal

	ID_Animal -> NomA
	ID_Animal -> PoidsA
	ID_Animal -> TaileA
	ID_Animal -> Date_de_naissanceA
	ID_Animal -> EspeceA
	ID_Animal -> ID_ClientA

## Table Effets_secondaires

	ID_effet_secondaire -> Effets

## Table Medicament

	Nom_de_molecule -> Description

## Table Traitement

	ID_Traitement -> Debut
	ID_Traitement -> Duree
	ID_Traitement -> NomT
	ID_Traitement -> ID_Animal
	ID_Traitement -> ID_personnel

# Commentaire:

	Les DF triviales ne sont pas retranscrites sauf pour les relations qui sont toutes clés.
	
# Couverture minimale:

	Tous les DF ci-dessus sont DFE. 

	Comme aucun autre DF peut être déterminé par transitivité à partir des DF proposés ci-dessus, le F+ est ce que nous avons écrit dans les parties précédentes.

	Vu que dans les tables Client, Veterinaire, Assistant, (Nom, Prenom, Date_de_naissance) peut déterminer les attributs non clés, nous avons proposé deux couvertures minimales:
		CM1 = F+ \ {(Nom, Prenom, Date_de_naissance) -> Addresse; (Nom, Prenom, Date_de_naissance) -> Numero_de_telephone <dans la table Client>;
			         (Nom, Prenom, Date_de_naissance) -> Addresse; (Nom, Prenom, Date_de_naissance) -> Numero_de_telephone, (Nom, Prenom, Date_de_naissance) -> Specilaite <dans la table Veterinaire>;
			         (Nom, Prenom, Date_de_naissance) -> Addresse; (Nom, Prenom, Date_de_naissance) -> Numero_de_telephone, (Nom, Prenom, Date_de_naissance) -> Specilaite <dans la table Assistant>}

		CM2 = F+ \{ID_Client -> Nom, ID_Client -> Prenom, ID_Client -> Date_de_naissance, ID_Client -> Addresse, ID_Client -> Numero_de_telephone <dans la table Client>;
			        ID_Personnel -> Nom, ID_Personnel -> Prenom, ID_Personnel -> Date_de_naissance, ID_Personnel -> Addresse, ID_Personnel -> Numero_de_telephone, ID_Personnel -> Specialite <dans la table Veterinaire>;
			        ID_Personnel -> Nom, ID_Personnel -> Prenom, ID_Personnel -> Date_de_naissance, ID_Personnel -> Addresse, ID_Personnel -> Numero_de_telephone, ID_Personnel -> Specialite <dans la table Assistant>}

# Décomposition et normalisation:

	Dans notre projet, il.y a deux clés candidates dans les tables Client, Veterinaire et Assistant: ID et (Nom, Prenom, Date_de_naissance); Pour les autres tables, il y en a une.

**1NF?**
	
	En considérant l'adresse des tables Client, Assistant et Vétérinaire comme un attribut atomique, nous avons tous les attributs atomiques et toutes les relations avec une clé, alors la BD est en 1NF.

**2NF?**
	
	Nous savons déjà la BD est en 1NF, de plus, tous les attributs des relations de la BD ne dépendent pas d'une partie des clés mais de toute la clé, alors nous sommes en 2NF.
	Preuve: <dans les tables Client, Veterinaire et Assistant>
		Nom -> Nom (Nom ne determine aucun autre attribut tout seul)
		Prenom -> Prenom  (Prenom ne determine aucun autre attribut tout seul)
		Date_de_naissance -> Date_de_naissance (Date de naissance ne determine aucun autre attribut tout seul)

**3NF?**
	
*Avant, nous avons mis les clés artificielles dans les tables Classe_animale, Espece et Medicament et nous ne sommes pas en 3NF car on a Nom_de_molecule -> Description par exemple. C’est pourquoi nous avons supprimé les clés artificielles dans ces tables et nous avons mis les clés primaires comme la partie ci-dessus.*


*Dans ce rendu, nous avons pris la version corrigée pour commenter.*

	Nous sommes déjà en 2NF, et les attributs non-clés des relations ne dépendent que des clés candidates. Alors nous respectons aussi la 3NF.

**Normalisation**
	
	Nous sommes aussi en BCNF car nous sommes en 3NF, et il n'y a pas d'attributs non-clés qui déterminent un attribut clé.
	Par exemple dans les tables Client, Assistant et Vétérinaire, il y a deux clés candidates qui déterminent tous les attributs, dû à l'utilisation d'une clé artificielle.
	Donc tous ces attributs sont clés et aucun des autres attributs non-clé ne détermine ces attributs clés.
