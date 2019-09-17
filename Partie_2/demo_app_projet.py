#!/usr/bin/python3

import psycopg2
import datetime
import sys
HOST = "tuxa.sme.utc"
USER = "bdd0p101"
PASSWORD = "SS53Tkyw"
DATABASE = "dbbdd0p101"

# Connect to an existing database
conn = psycopg2.connect("host=%s dbname=%s user=%s password=%s" % (HOST, DATABASE, USER, PASSWORD))
cursor = conn.cursor()

def add_values():
    print("Select a table to add values\n")
    print("1. Table Client\n")
    print("2. Table Veterinaire\n")
    print("3. Table Assistant\n")
    print("4. Table Animal\n")
    print("5. Table Medicament\n")
    choix = int(input("Your choice: "))
    if (choix == 1):
        id_client = int(input("Enter Client ID: "))
        name = input("Enter Client name: ")
        surname = input("Enter Client surname: ")
        ddn_entry = input("Enter Client date of birth in YYYY-MM-DD format: ")
        year, month, day = map(int, ddn_entry.split('-'))
        ddn = datetime.date(year,month,day)
        ad = input("Enter Client adresse: ")
        tel = input("Enter Client telephone number: ")
        sql = "INSERT INTO Client VALUES (%s, %s, %s, %s, %s, %s)"
        cursor.execute(sql, [id_client, name, surname, ddn, ad, tel])
        conn.commit()
        print("Table Client: Insertion Done\n")
    elif (choix == 2):
        id_personnel = int(input("Enter Veterinaire ID: "))
        name = input("Enter Veterinaire name: ")
        surname = input("Enter Veterinaire surname: ")
        ddn_entry = input("Enter Veterinaire date of birth in YYYY-MM-DD format: ")
        year, month, day = map(int, ddn_entry.split('-'))
        ddn = datetime.date(year,month,day)
        ad = input("Enter Veterinaire adresse: ")
        tel = input("Enter Veterinaire telephone number: ")
        cursor.execute("SELECT * FROM Classe_animal")
        ligne = cursor.fetchone()
        i = 0
        while ligne:
            print("Choose ",i,"for veterinaire speciality ",ligne)
            print("\n")
            i = i + 1
            ligne = cursor.fetchone()
        choice = int(input("Your choice: "))
        cursor.execute("SELECT * FROM Classe_animal")
        ligne = cursor.fetchone()
        for k in range(choice):
            ligne = cursor.fetchone()
        speciality = ligne
        sql = "INSERT INTO Veterinaire VALUES (%s, %s, %s, %s, %s, %s, %s)"
        cursor.execute(sql, [id_personnel, name, surname, ddn, ad, tel, speciality])
        conn.commit()
        print("Table Veterinaire: Insertion Done\n")
    elif (choix == 3):
        id_personnel = int(input("Enter Assistant ID: "))
        name = input("Enter Assistant name: ")
        surname = input("Enter Assistant surname: ")
        ddn_entry = input("Enter Assistant date of birth in YYYY-MM-DD format: ")
        year, month, day = map(int, ddn_entry.split('-'))
        ddn = datetime.date(year,month,day)
        ad = input("Enter Assistant adresse: ")
        tel = input("Enter Assistant telephone number: ")
        cursor.execute("SELECT * FROM Classe_animal")
        ligne = cursor.fetchone()
        i = 0
        while ligne:
            print("Choose ",i,"for assistant speciality ",ligne)
            print("\n")
            i = i + 1
            ligne = cursor.fetchone()
        choice = int(input("Your choice: "))
        cursor.execute("SELECT * FROM Classe_animal")
        ligne = cursor.fetchone()
        for k in range(choice):
            ligne = cursor.fetchone()
        speciality = ligne
        sql = "INSERT INTO Assistant VALUES (%s, %s, %s, %s, %s, %s, %s)"
        cursor.execute(sql, [id_personnel, name, surname, ddn, ad, tel, speciality])
        conn.commit()
        print("Table Assistant: Insertion Done\n")
    elif (choix == 4):
        id_annimal = int(input("Enter Pet ID: "))
        name = input("Enter Pet name: ")
        poids = float(input("Enter Pet weight: "))
        taille = float(input("Enter Pet height: "))
        ddn_entry = input("Enter Pet date of birth in YYYY-MM-DD format: ")
        year, month, day = map(int, ddn_entry.split('-'))
        ddn = datetime.date(year,month,day)
        cursor.execute("SELECT * FROM Espece")
        ligne = cursor.fetchone()
        i = 0
        while ligne:
            print("Choose ",i,"if your pet is ",ligne[0])
            print("\n")
            i = i + 1
            ligne = cursor.fetchone()
        choice = int(input("Your choice: "))
        cursor.execute("SELECT * FROM Espece")
        ligne = cursor.fetchone()
        for k in range(choice):
            ligne = cursor.fetchone()
        espece = ligne[0]
        cursor.execute("SELECT * FROM Client")
        ligne = cursor.fetchone()
        i = 0
        while ligne:
            print("Choose ",i,"if your pet is belong to ",ligne[0]," ",ligne[1]," ",ligne[2])
            print("\n")
            i = i + 1
            ligne = cursor.fetchone()
        choice = int(input("Your choice: "))
        cursor.execute("SELECT * FROM Client")
        ligne = cursor.fetchone()
        for k in range(choice):
            ligne = cursor.fetchone()
        client = ligne[0]
        sql = "INSERT INTO Animal VALUES (%s, %s, %s, %s, %s, %s, %s)"
        cursor.execute(sql, [id_annimal, name, poids, taille, ddn, espece, client])
        conn.commit()
        print("Table Animal: Insertion Done\n")
    elif (choix == 5):
        name = input("Enter Medicament name: ")
        desc = input("Enter Medicament description: ")
        eff = input("Enter Medicament secondary effets: ")
        sql = "INSERT INTO Medicament VALUES (%s, %s, %s)"
        cursor.execute(sql, [name, desc, eff])
        conn.commit()
        print("Table Medicament: Insertion Done\n")
    else:
        print("Invalid choice\n")
    print("=====================================\n\n")
    main()

def update_values():
    print("Select a table to update values\n")
    print("1. Table Client\n")
    print("2. Table Veterinaire\n")
    print("3. Table Assistant\n")
    print("4. Table Animal\n")
    print("5. Table Medicament\n")
    choix = int(input("Your choice: "))
    if (choix == 1):
        cursor.execute("SELECT * FROM Client")
        ligne = cursor.fetchone()
        i = 0
        while ligne:
            print("Choose ",i,"if you want to update client: ",ligne[0]," ",ligne[1]," ",ligne[2])
            print("\n")
            i = i + 1
            ligne = cursor.fetchone()
        choice = int(input("Your choice: "))
        cursor.execute("SELECT * FROM Client")
        ligne = cursor.fetchone()
        for k in range(choice):
            ligne = cursor.fetchone()
        client = ligne[0]
        new_name = input("Enter client new name: ")
        new_surname = input("Enter client new surname: ")
        ddn_entry = input("Enter Client new date of birth in YYYY-MM-DD format: ")
        year, month, day = map(int, ddn_entry.split('-'))
        new_ddn = datetime.date(year,month,day)
        new_ad = input("Enter Client new adresse: ")
        new_tel = input("Enter Client new telephone number: ")
        sql = "UPDATE Client SET nom=%s, prenom=%s, date_de_naissance=%s, addresse=%s, numero_de_telephone=%s where id_client=%s"
        cursor.execute(sql, [new_name, new_surname, new_ddn, new_ad, new_tel, client])
        conn.commit()
        print("Table Client: Update Done\n")
    elif (choix ==2):
        print("WARNING: Veterinaire speciality cannot be changed\n")
        cursor.execute("SELECT * FROM Veterinaire")
        ligne = cursor.fetchone()
        i = 0
        while ligne:
            print("Choose ",i,"if you want to update veterinaire: ",ligne[0]," ",ligne[1]," ",ligne[2])
            print("\n")
            i = i + 1
            ligne = cursor.fetchone()
        choice = int(input("Your choice: "))
        cursor.execute("SELECT * FROM Veterinaire")
        ligne = cursor.fetchone()
        for k in range(choice):
            ligne = cursor.fetchone()
        vet = ligne[0]
        new_name = input("Enter veterinaire new name: ")
        new_surname = input("Enter veterinaire new surname: ")
        ddn_entry = input("Enter veterinaire new date of birth in YYYY-MM-DD format: ")
        year, month, day = map(int, ddn_entry.split('-'))
        new_ddn = datetime.date(year,month,day)
        new_ad = input("Enter veterinaire new adresse: ")
        new_tel = input("Enter veterinaire new telephone number: ")
        sql = "UPDATE Veterinaire SET nom=%s, prenom=%s, date_de_naissance=%s, addresse=%s, numero_de_telephone=%s where id_personnel=%s"
        cursor.execute(sql, [new_name, new_surname, new_ddn, new_ad, new_tel, vet])
        conn.commit()
        print("Table Veterinaire: Update Done\n")
    elif (choix ==3):
        print("WARNING: Assistant speciality cannot be changed\n")
        cursor.execute("SELECT * FROM Assistant")
        ligne = cursor.fetchone()
        i = 0
        while ligne:
            print("Choose ",i,"if you want to update assistant: ",ligne[0]," ",ligne[1]," ",ligne[2])
            print("\n")
            i = i + 1
            ligne = cursor.fetchone()
        choice = int(input("Your choice: "))
        cursor.execute("SELECT * FROM Assistant")
        ligne = cursor.fetchone()
        for k in range(choice):
            ligne = cursor.fetchone()
        ass = ligne[0]
        new_name = input("Enter assistant new name: ")
        new_surname = input("Enter assistant new surname: ")
        ddn_entry = input("Enter assistant new date of birth in YYYY-MM-DD format: ")
        year, month, day = map(int, ddn_entry.split('-'))
        new_ddn = datetime.date(year,month,day)
        new_ad = input("Enter assistant new adresse: ")
        new_tel = input("Enter assistant new telephone number: ")
        sql = "UPDATE Assistant SET nom=%s, prenom=%s, date_de_naissance=%s, addresse=%s, numero_de_telephone=%s where id_personnel=%s"
        cursor.execute(sql, [new_name, new_surname, new_ddn, new_ad, new_tel, ass])
        print("Table Assistant: Update Done\n")
    elif (choix==4):
        print("WARNING: Pet species and owners cannot be changed\n")
        cursor.execute("SELECT * FROM Animal")
        ligne = cursor.fetchone()
        i = 0
        while ligne:
            print("Choose ",i,"if you want to update pet: ",ligne[0]," ",ligne[1])
            print("\n")
            i = i + 1
            ligne = cursor.fetchone()
        choice = int(input("Your choice: "))
        cursor.execute("SELECT * FROM Animal")
        ligne = cursor.fetchone()
        for k in range(choice):
            ligne = cursor.fetchone()
        ani = ligne[0]
        name = input("Enter Pet new name: ")
        poids = float(input("Enter Pet new weight: "))
        taille = float(input("Enter Pet new height: "))
        ddn_entry = input("Enter Pet new date of birth in YYYY-MM-DD format: ")
        year, month, day = map(int, ddn_entry.split('-'))
        ddn = datetime.date(year,month,day)
        sql = "UPDATE Animal SET nom=%s, poids=%s, taille=%s, date_de_naissance=%s WHERE id_animal=%s"
        cursor.execute(sql, [name, poids, taille, ddn, ani])
        conn.commit()
        print("Table Animal: Update Done\n")
    elif (choix==5):
        print("WARNING: Name of medicament cannot be changed\n")
        print("If you want to change name of medicament, please delete it and insert a new one\n")
        while True:
            supp = int(input(("You want to delete it or not? 0 for No and 1 for Yes\n")))
            if (supp == 0 or supp == 1):
                break
        cursor.execute("SELECT * FROM Medicament")
        ligne = cursor.fetchone()
        i = 0
        while ligne:
            print("Choose ",i,"if you want to update medicament: ",ligne[0]," ",ligne[1])
            print("\n")
            i = i + 1
            ligne = cursor.fetchone()
        choice = int(input("Your choice: "))
        cursor.execute("SELECT * FROM Medicament")
        ligne = cursor.fetchone()
        for k in range(choice):
            ligne = cursor.fetchone()
        medi = ligne[0]
        if (supp == 0):
            desc = input("Enter Medicament new description: ")
            eff = input("Enter Medicament new secondary effets: ")
            sql = "UPDATE Medicament SET description=%s, effets_secondaires=%s WHERE nom_de_molecule=%s"
            cursor.execute(sql, [desc,eff, medi])
            conn.commit()
            print("Table Medicament: Update Done\n")
        else:
            sql = "DELETE FROM Medicament WHERE nom_de_molecule=%s"
            cursor.execute(sql, [medi])
            name = input("Enter Medicament new name: ")
            desc = input("Enter Medicament new description: ")
            eff = input("Enter Medicament new secondary effets: ")
            sql = "INSERT INTO Medicament VALUES (%s, %s, %s)"
            cursor.execute(sql, [name, desc, eff])
            conn.commit()
            print("Table Medicament: Update Done\n")
    else:
        print("Invalid choice\n")
    print("=====================================\n\n")
    main()

def show_values():
    print("Select a table to show values\n")
    print("1. Table Client\n")
    print("2. Table Veterinaire\n")
    print("3. Table Assistant\n")
    print("4. Table Animal\n")
    print("5. Table Medicament\n")
    print("6. Table Traitement\n")
    choix = int(input("Your choice: "))
    if (choix == 1):
        cursor.execute("SELECT * FROM Client")
        ligne = cursor.fetchone()
        while ligne:
            print("Client ID: ", ligne[0],"\n")
            print("Client Name: ",ligne[1],"\n")
            print("Client Surname: ",ligne[2],"\n")
            print("Client Date of Birth: ",ligne[3],"\n")
            print("Client Adresse: ",ligne[4],"\n")
            print("Client Tel Number: ",ligne[5],"\n")
            print("____________________________________\n")
            ligne = cursor.fetchone()
    elif (choix == 2):
        cursor.execute("SELECT * FROM Veterinaire")
        ligne = cursor.fetchone()
        while ligne:
            print("Veterinaire ID: ", ligne[0],"\n")
            print("Veterinaire Name: ",ligne[1],"\n")
            print("Veterinaire Surname: ",ligne[2],"\n")
            print("Veterinaire Date of Birth: ",ligne[3],"\n")
            print("Veterinaire Adresse: ",ligne[4],"\n")
            print("Veterinaire Tel Number: ",ligne[5],"\n")
            print("Veterinaire Speciality: ",ligne[6],"\n")
            print("____________________________________\n")
            ligne = cursor.fetchone()
    elif (choix ==3):
        cursor.execute("SELECT * FROM Assistant")
        ligne = cursor.fetchone()
        while ligne:
            print("Assistant ID: ", ligne[0],"\n")
            print("Assistant Name: ",ligne[1],"\n")
            print("Assistant Surname: ",ligne[2],"\n")
            print("Assistant Date of Birth: ",ligne[3],"\n")
            print("Assistant Adresse: ",ligne[4],"\n")
            print("Assistant Tel Number: ",ligne[5],"\n")
            print("Assistant Speciality: ",ligne[6],"\n")
            print("____________________________________\n")
            ligne = cursor.fetchone()
    elif (choix ==4):
        cursor.execute("SELECT * FROM Animal")
        ligne = cursor.fetchone()
        while ligne:
            print("Pet ID: ", ligne[0],"\n")
            print("Pet Name: ",ligne[1],"\n")
            print("Pet Weight: ",ligne[2],"\n")
            print("Pet Height: ",ligne[3],"\n")
            print("Pet Date of Birth: ",ligne[4],"\n")
            print("Pet Species: ",ligne[5],"\n")
            print("Pet Owner: ",ligne[6],"\n")
            print("____________________________________\n")
            ligne = cursor.fetchone()
    elif (choix ==5):
        cursor.execute("SELECT * FROM Medicament")
        ligne = cursor.fetchone()
        while ligne:
            print("Medicament Name: ", ligne[0],"\n")
            print("Medicament Description: ",ligne[1],"\n")
            print("Medicament Secondary Effets: ",ligne[2],"\n")
            print("____________________________________\n")
            ligne = cursor.fetchone()
    elif (choix == 6):
        cursor.execute("SELECT * FROM Traitement")
        ligne = cursor.fetchone()
        while ligne:
            print("Traitement ID: ",ligne[0],"\n")
            print("Traitement Start: ",ligne[1],"\n")
            print("Traitement End: ",ligne[2],"\n")
            print("Traitement Name: ",ligne[3],"\n")
            print("Traitement Patient: ",ligne[4],"\n")
            print("Traitement Veterinaire: ",ligne[5],"\n")
            print("____________________________________\n")
            ligne = cursor.fetchone()
    else:
        print("Invalid choice\n")
    print("=====================================\n\n")
    main()

def request():
    print("Select your request:\n")
    print("1. Quantity of each type of medicament for a pet\n")
    print("2. Quantity of medicament of our clinique\n")
    print("3. Average weight and height of pet species\n")
    choix = int(input("Your choice: "))
    if (choix == 1):
        cursor.execute("SELECT * FROM Animal")
        ligne = cursor.fetchone()
        i = 0
        while ligne:
            print("Choose ",i,"to view medicaments info of ",ligne[0])
            print("\n")
            i = i + 1
            ligne = cursor.fetchone()
        choice = int(input("Your choice: "))
        cursor.execute("SELECT * FROM Animal")
        ligne = cursor.fetchone()
        for k in range(choice):
            ligne = cursor.fetchone()
        ani = ligne[0]
        sql = "SELECT T.medicament, count(*) FROM traitement_medicament T, traitement TR WHERE TR.id_animal=%s AND T.traitement = TR.id_traitement GROUP BY T.medicament"
        cursor.execute(sql, [ani])
        ligne = cursor.fetchone()
        while ligne:
            print("Medicament: ",ligne[0])
            print("Quantity: ",ligne[1])
            print("____________________________________\n")
            ligne = cursor.fetchone()
    elif (choix == 2):
        sql = "SELECT T.medicament, count(*) FROM traitement_medicament T GROUP BY T.medicament"
        cursor.execute(sql)
        ligne = cursor.fetchone()
        while ligne:
            print("Medicament: ",ligne[0])
            print("Quantity: ",ligne[1])
            print("____________________________________\n")
            ligne = cursor.fetchone()
    elif (choix == 3):
        sql = "SELECT A.espece, AVG(a.poids), AVG(A.taille) FROM Animal A GROUP BY A.espece"
        cursor.execute(sql)
        ligne = cursor.fetchone()
        while ligne:
            print("Species: ",ligne[0])
            print("Average Weight: ",ligne[1])
            print("Average Height: ",ligne[2])
            print("____________________________________\n")
            ligne = cursor.fetchone()
    else:
        print("Invalid choice\n")
    print("=====================================\n\n")
    main()

def main():
    print("Select an option \n")
    print("1.Show values \n")
    print("2.Insert values \n")
    print("3.Update values \n")
    print("4.Statistics \n")
    print("5.Quit \n")
    c = int(input("Your choice: "))
    if (c==1):
        show_values()
    elif (c==2):
        add_values()
    elif (c==3):
        update_values()
    elif (c==4):
        request()
    else:
        print("Goodbye \n")
        conn.close()
        sys.exit(0)


print("Hello and welcome to our application of vet clinic \n")
main()