import random
import math
import mysql.connector as mysqlpy
import datetime 
import os

# ---------------------------------------------------------------------
# Accés à la bdd
#-----------------------------------------------------------------------------------
user = 'root'
password = 'example'
host = 'localhost'
port = '3307'
database = 'binomontron'

bdd = mysqlpy.connect(user=user, password=password, host=host, port=port, database=database)
cursor = bdd.cursor()

#-----------------------------------------------------------------------------------
# Boucle pour un tirage
#-----------------------------------------------------------------------------------
menu = 1
while menu==1:
    os.system('clear')
    print("1: Créer un nouveau projet")
    print("2: Recherche dans la base de données")
    print("3: Quitter")
    choix = int(input("\nVotre choix :"))
    # Faire la gestion des erreurs si ok et tout décaler
    
    

    
    if choix==2:
    #******************************************************
    #***************RECHERCHE DANS LA BDD******************
    #******************************************************
        os.system('clear')
        print("1: Les projet existant")
        print("2: Les groupes sur le dernier projet")
        print("3: Contact des eleves")
        choix_recherche = int(input("\nVotre choix :"))
        if choix_recherche==1:
            os.system('clear')
            query = "SELECT * FROM PROJETS;" # Requête pour récupérer la table ELEVES
            cursor.execute(query)  
            for c in cursor:
                print(c[1]," : du", c[2], "au ", c[3])
            attente = input("Press enter to continue...")
        if choix_recherche==2:
            os.system('clear')
            query= "SELECT max(id_projet) FROM PROJETS"
            cursor.execute(query)
            for c in cursor:
                max_id_projet=c[0]
            query= f"SELECT nom, prenom, denomination FROM ELEVES, ELEVES_GROUPES, GROUPES WHERE id_projet='{max_id_projet}' AND ELEVES.id_eleves=ELEVES_GROUPES.id_eleve AND GROUPES.id_groupe=ELEVES_GROUPES.id_groupe"
            cursor.execute(query)
            for c in cursor:
                print(c[2],c[1],c[0])
            attente = input("Press enter to continue...")
        if choix_recherche==3:
            os.system('clear')
            query = "SELECT * FROM ELEVES;" # Requête pour récupérer la table ELEVES
            cursor.execute(query)  
            for c in cursor:
                print(c[1],":", c[3])
            attente = input("Press enter to continue...")


    elif choix==1:
    #******************************************************
    #***************CREATION DE GROUPES********************
    #******************************************************
        tirage=bool(1) # Variable pour refaire un tirage ou non
        while tirage==1:
            os.system('clear')
            query = "SELECT * FROM ELEVES;" # Requête pour récupérer la table ELEVES
            cursor.execute(query)           # Excecution de la requête 
            liste= [i[1] for i in cursor]   # Stockage des étudiants dans liste
            x=0 # Variable qui correspond au nombre d'etudiants dans un groupe

            #-----------------------------------------------------------------------------------    
            #   Info projet
            #-----------------------------------------------------------------------------------
            projet = input('Nom du projet :') 
            # A ajouter au programme : verifier que le nom n'est pas déjà présent dans la bdd
            # et qu'il ne dépasse pas 20 caractère 
            
            test_duree, error = bool(0), bool(0)
            while test_duree == 0:
                duree = input('\nDurée du projet (en jours) : ')
                try:
                    duree= int(duree)
                except ValueError:
                    print("Il faut un nombre entier :")
                    error=1
                    continue
                if error==0:
                    test_duree=1

            date_debut = datetime.date.today()
            date_fin = date_debut + datetime.timedelta(duree) 
            
            #-----------------------------------------------------------------------------------    
            # RECUPERATION du nombre de personnes par groupe voulu 
            # par l'utilisateur et gestion des erreurs:
            #-----------------------------------------------------------------------------------
            test = bool(0)
            while test == 0:
                x = input('\nNombre de personnes voulu par groupe : ')
                try:
                    x= int(x)
                except ValueError:
                    print("Il faut un nombre entier :")
                    continue
                if x < 2:
                    print("Il faut 2 étudiants pour faire un groupe :")
                elif (len(liste)/x)<2:

                    print("Le nombre de personnes par groupe est trop important pour former 2 groupes :")
                else:
                    test = 1

            #-----------------------------------------------------------------------------------
            #               Creation des groupes 
            #----------------------------------------------------------------------------------- 
            # permettant de connaitre la proportion des etudiants restant pour faire un groupe
            ou_mettre_les_derniers= float(float(len(liste)/x)-int(len(liste)/x))        

            # Groupe complet
            liste_finale=[] # Variable pour stocker la liste des groupes(sera vidée à chaque boucle)
            while len(liste)>=x:
                liste_temp=[]
                for i in range(x):
                    a=str(random.choice(liste))
                    liste_temp.append(a)
                    liste.remove(a)
                liste_finale.append(liste_temp)

            # Etudiant restant:
            if len(liste)>0: # Il reste encore des étudiants
                if ou_mettre_les_derniers>0.5:  # S'il y a plus d'un demi groupe on ajoute 
                    liste_finale.append(liste)  # les élèves restant dans un groupe à part
                else: # Sinon on inclus les élèves restant dans les groupes déjà crées
                    i=0
                    for eleves_restant in range(len(liste)):
                        liste_finale[i].append(liste[0])
                        liste.remove(liste[0])
                        i+=1
                        if i==len(liste_finale)-1:
                            i=0
            #-----------------------------------------------------------------------------------
            # Affichage des elemeents à envoyer dans la base de donnee
            #-----------------------------------------------------------------------------------
            os.system('clear')
            print("Nom du projet :",projet)
            print("Debut du projet :{} \nFin du projet :{}\n".format(date_debut.strftime('%A-%d-%B-%Y'),date_fin.strftime('%A-%d-%B-%Y')))
            for i in range(len(liste_finale)):
                    print("Groupe", i+1, ": ", end="")
                    for j in range(len(liste_finale[i])):
                        print(liste_finale[i][j] , end=" ")
                    print("")
                    

            #-----------------------------------------------------------------------------------
            #Demander à l'utilisateur s'il veut refaire un tirage ou stocker la liste de son choix
            #-----------------------------------------------------------------------------------
            test,refaire = 0,0
            while test == 0:
                try: 
                    refaire = int(input("\n1 : Refaire un tirage \n2 : Stocker les informations dans la base de données\nVotre choix :"))  
                except ValueError:
                    print("Vous n'avez pas saisie 1 ou 2 :")
                if 1>refaire>2:
                    print("Vous n'avez pas saisie 1, 2 :")
                if refaire==1 or refaire==2:
                    test =1 

            #-----------------------------------------------------------------------------------
            #                               STOCKAGE 
            #-----------------------------------------------------------------------------------
            
            if refaire==2:
                query = f'INSERT INTO PROJETS(projet, date_debut, date_fin) VALUES ("{projet}","{date_debut}","{date_fin}");'
                cursor.execute(query)
                bdd.commit()
                for i in range(len(liste_finale)):
                    for j in range(len(liste_finale[i])):
                        reqeleve= 'SELECT id_eleves FROM ELEVES WHERE prenom="'+ liste_finale[i][j] +'";'
                        cursor.execute(reqeleve)
                        for c in cursor:
                            id_eleve=c[0]

                        reqprojet= 'SELECT id_projet FROM PROJETS WHERE projet="'+ projet +'";'
                        cursor.execute(reqprojet)
                        for result in cursor:
                            id_projet=result[0]
                            
                        query = f"INSERT INTO ELEVES_GROUPES(id_eleve, id_groupe, id_projet) VALUES ('{id_eleve}','{i+1}','{id_projet}')"
                        cursor.execute(query)
                        bdd.commit()
            
                print("Votre liste de groupes est stockée dans la base de données, au boulot !!!")
                attente = input("Press enter to continue...")
                tirage=0
        
    else:
    #******************************************************
    #******************FIN DU PROGRAMME********************
    #******************************************************
        menu=0
        cursor.close()
        bdd.close()
