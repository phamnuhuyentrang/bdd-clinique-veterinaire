//Client

db.client.insert(
{
    _id:ObjectId("5ccc915af64ced155f2fe437"),
    nom:"Nguyen",
    prenom:"Triet",
    naissance: Date("1998-06-12"),
    adresse:"15 Rue Winston Churchill",
    no_tel:"0698593783"
})

db.client.insert(
{
    _id:ObjectId("5ccc915af64ced155f2fe438"),
    nom:"Nguyen",
    prenom:"Dung",
    naissance: Date("1998-01-04"),
    adresse:"1 Rue de Paris",
    no_tel:"0697142635"
})

db.client.insert(
{
    _id:ObjectId("5ccc915af64ced155f2fe439"),
    nom:"Colin",
    prenom:"Lafond",
    naissance: Date("1998-01-01"),
    adresse:"Compiegne",
    no_tel:"0123456789"
})

db.client.insert(
{
    _id:ObjectId("5ccc915af64ced155f2fe43a"),
    nom:"Bennis",
    prenom:"Saad",
    naissance: Date("1998-02-02"),
    adresse:"France",
    no_tel:"0697132635"
})

db.client.insert(
{
    _id:ObjectId("5ccc915af64ced155f2fe43b"),
    nom:"Nguyen",
    prenom:"Bo",
    naissance: Date("1998-08-12"),
    adresse:"Delaidde",
    no_tel:"0987654321"
})

//Classe

db.classe.insert(
{
    _id:ObjectId("5ccc923bf64ced155f2fe43c"),
    nom:"Mammifere"
})

db.classe.insert(
{
    _id:ObjectId("5ccc923bf64ced155f2fe43d"),
    nom:"Oiseaux"
})

db.classe.insert(
{
    _id:ObjectId("5ccc923bf64ced155f2fe43e"),
    nom:"Reptiles"
})

db.classe.insert(
{
    _id:ObjectId("5ccc923bf64ced155f2fe43f"),
    nom:"Autres"
})

//Espece

db.espece.insert(
{
    _id:ObjectId("5ccc9aeef64ced155f2fe445"),
    nom:"Chien",
    classe:ObjectId("5ccc923bf64ced155f2fe43c")
})

db.espece.insert(
{
    _id:ObjectId("5ccc9aeef64ced155f2fe446"),
    nom:"Chat",
    classe:ObjectId("5ccc923bf64ced155f2fe43c")
})

db.espece.insert(
{
    _id:ObjectId("5ccc9aeef64ced155f2fe447"),
    nom:"Perrot",
    classe:ObjectId("5ccc923bf64ced155f2fe43d")
})

db.espece.insert(
{
    _id:ObjectId("5ccc9aeef64ced155f2fe448"),
    nom:"Poisson",
    classe:ObjectId("5ccc923bf64ced155f2fe43f")
})

db.espece.insert(
{
    _id:ObjectId("5ccc9aeef64ced155f2fe449"),
    nom:"Sarabee",
    classe:ObjectId("5ccc923bf64ced155f2fe43e")
})

//Animal

db.animal.insert(
{
    _id:ObjectId("5ccc9f58f64ced155f2fe44a"),
    nom:"Phe",
    poids:20.0,
    taille:19.5,
    naissance:Date("2008-06-01"),
    espece:ObjectId("5ccc9aeef64ced155f2fe445"),
    proprietaire:ObjectId("5ccc915af64ced155f2fe438")
})

db.animal.insert(
{
    _id:ObjectId("5ccc9f58f64ced155f2fe44b"),
    nom:"KiKi",
    poids:30.0,
    taille:24.5,
    naissance:Date("2006-01-06"),
    espece:ObjectId("5ccc9aeef64ced155f2fe446"),
    proprietaire:ObjectId("5ccc915af64ced155f2fe437")
})

db.animal.insert(
{
    _id:ObjectId("5ccc9f58f64ced155f2fe44c"),
    nom:"Nemo",
    poids:5.0,
    taille:3.5,
    naissance:Date("2001-01-01"),
    espece:ObjectId("5ccc9aeef64ced155f2fe448"),
    proprietaire:ObjectId("5ccc915af64ced155f2fe43b")
})

db.animal.insert(
{
    _id:ObjectId("5ccc9f58f64ced155f2fe44d"),
    nom:"Jason",
    poids:10.0,
    taille:5.5,
    naissance:Date("2009-01-01"),
    espece:ObjectId("5ccc9aeef64ced155f2fe447"),
    proprietaire:ObjectId("5ccc915af64ced155f2fe43a")
})

db.animal.insert(
{
    _id:ObjectId("5ccc9f58f64ced155f2fe44e"),
    nom:"Triet",
    poids:4.0,
    taille:4.5,
    naissance:Date("2010-01-01"),
    espece:ObjectId("5ccc9aeef64ced155f2fe449"),
    proprietaire:ObjectId("5ccc915af64ced155f2fe439")
})

//Medicaments

db.medicament.insert(
{
    _id:ObjectId("5ccca217f64ced155f2fe454"),
    nom:"Vitamin A"
})

db.medicament.insert(
{
    _id:ObjectId("5ccca217f64ced155f2fe455"),
    nom:"Vitamin D"
})

db.medicament.insert(
{
    _id:ObjectId("5ccca217f64ced155f2fe456"),
    nom:"Vitamin B"
})

db.medicament.insert(
{
    _id:ObjectId("5ccca217f64ced155f2fe457"),
    nom:"Omega 3"
})

//Traitement
db.traitement.insert(
{
    debut:Date("2019-04-04T08:00:00"),
    fin:Date("2019-04-04T09:00:00"),
    nom:"Optique",
    animal:ObjectId("5ccc9f58f64ced155f2fe44a"),
    medicaments:
        [
            {"medicament":ObjectId("5ccca217f64ced155f2fe454")},
            {"medicament":ObjectId("5ccca217f64ced155f2fe457")}
        ]
})

db.traitement.insert(
{
    debut:Date("2019-04-30T10:00:00"),
    fin:Date("2019-04-30T11:30:00"),
    nom:"Osteopathie",
    animal:ObjectId("5ccc9f58f64ced155f2fe44b"),
    medicaments:
        [
            {"medicament":ObjectId("5ccca217f64ced155f2fe455")},
            {"medicament":ObjectId("5ccca217f64ced155f2fe457")}
        ]
})

db.traitement.insert(
{
    debut:Date("2019-05-02T13:00:00"),
    fin:Date("2019-05-02T15:01:00"),
    nom:"Soin de ventre",
    animal:ObjectId("5ccc9f58f64ced155f2fe44c"),
    medicaments:
        [
            {"medicament":ObjectId("5ccca217f64ced155f2fe456")}
        ]
})

db.traitement.insert(
{
    debut:Date("2019-05-02T17:00:00"),
    fin:Date("2019-05-02T18:45:00"),
    nom:"Soin des yeux",
    animal:ObjectId("5ccc9f58f64ced155f2fe44d"),
    medicaments:
        [
            {"medicament":ObjectId("5ccca217f64ced155f2fe454")}
        ]
})

db.traitement.insert(
{
    debut:Date("2019-05-03T14:00:00"),
    fin:Date("2019-05-02T16:45:00"),
    nom:"Traitement general",
    animal:ObjectId("5ccc9f58f64ced155f2fe44e"),
    medicaments:
        [
            {"medicament":ObjectId("5ccca217f64ced155f2fe456")},
            {"medicament":ObjectId("5ccca217f64ced155f2fe455")},
            {"medicament":ObjectId("5ccca217f64ced155f2fe457")}
        ]
})