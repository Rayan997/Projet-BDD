DROP database VeloMax;
CREATE DATABASE VeloMax;
USE VeloMax;


CREATE TABLE Modele_Bicyclette(
numModele INT,
nomB VARCHAR(30),
PRIMARY KEY(numModele),
prixUnitaire INT,
ligne_produit VARCHAR(30),
date_intro VARCHAR(30),
date_discont_prod VARCHAR(30),
grandeur VARCHAR(30),
cadre VARCHAR(30),
guidon VARCHAR(30),
freins VARCHAR(30),
selle VARCHAR(30),
derailleur_Avant VARCHAR(30),
derailleur_Arrière VARCHAR(30),
roue_Avant VARCHAR(30),
roue_Arrière VARCHAR(30),
reflecteurs VARCHAR(30),
pedalier VARCHAR(30),
ordinateur VARCHAR(30),
panier VARCHAR(30));
INSERT INTO Modele_Bicyclette VALUES(101,'Kilimanjaro',569,'VTT','05/2019','08/2020','Adultes','C32','G7','F3','S88','DV133','DR56','R45','R46',null,'P12','O2',null);
INSERT INTO Modele_Bicyclette VALUES(102,'NorthPole',329,'VTT','05/2019','08/2020','Adultes','C34','G7','F3','S88','DV17','DR87','R48','R47',null,'P12',null,null);
INSERT INTO Modele_Bicyclette VALUES(103,'MontBlanc',399,'VTT','05/2019','08/2020','Jeunes','C76','G7','F3','S88','DV17','DR87','R48','R47',null,'P12','O2',null);
INSERT INTO Modele_Bicyclette VALUES(104,'Hooligan',199,'VTT','05/2019','08/2020','Jeunes','C76','G7','F3','S88','DV87','DR86','R12','R32',null,'P12',null,null);
INSERT INTO Modele_Bicyclette VALUES(105,'Orléans',229,'Vélo de course','07/2019','09/2020','Hommes','C43','G9','F9','S37','DV57','DR86','R19','R18','R02','P34',null,null);
INSERT INTO Modele_Bicyclette VALUES(106,'Orléans',229,'Vélo de course','07/2019','09/2020','Dames','C44f','G9','F9','S35','DV57','DR86','R19','R18','R02','P34',null,null);
INSERT INTO Modele_Bicyclette VALUES(107,'BlueJay',349,'Vélo de course','07/2015','11/2020','Hommes','C43','G9','F9','S37','DV57','DR87','R19','R18','R02','P34','O4',null);
INSERT INTO Modele_Bicyclette VALUES(108,'BlueJay',349,'Vélo de course','07/2015','11/2020','Dames','C43f','G9','F9','S35','DV57','DR87','R19','R18','R02','P34','O4',null);
INSERT INTO Modele_Bicyclette VALUES(109,'Trail Explorer',129,'Classique','07/2016','02/2021','Filles','C01','G12',null,'S02',null,null,'R1','R2','R09','P1',null,'S01');
INSERT INTO Modele_Bicyclette VALUES(110,'Trail Explorer',129,'Classique','07/2016','02/2021','Garçons','C02','G12',null,'S03',null,null,'R1','R2','R09','P1',null,'S05');
INSERT INTO Modele_Bicyclette VALUES(111,'Night Hawk',189,'Classique','07/2017','02/2020','Jeunes','C15','G12','F9','S36','DV15','DR23','R11','R12','R10','P15',null,'S74');
INSERT INTO Modele_Bicyclette VALUES(112,'Tierra Verde',199,'Classique','07/2018','03/2020','Hommes','C87','G12','F9','S36','DV41','DR76','R11','R12','R10','P15',null,'S74');
INSERT INTO Modele_Bicyclette VALUES(113,'Tierra Verde',199,'Classique','07/2018','03/2020','Dames','C87f','G12','F9','S34','DV41','DR76','R11','R12','R10','P15',null,'S73');
INSERT INTO Modele_Bicyclette VALUES(114,'Mud Zinger I',279,'BMX','01/2021','03/2021','Jeunes','C25','G7','F3','S87','DV132','DR52','R44','R47',null,'P12',null,null);
INSERT INTO Modele_Bicyclette VALUES(115,'Mud Zinger II',359,'BMX','01/2021','04/2021','Adultes','C25','G7','F3','S87','DV133','DR52','R44','R47',null,'P12',null,null);




CREATE TABLE Bicyclette(
id_bicyclette VARCHAR(30),
numModele INT,
PRIMARY KEY(id_bicyclette,numModele),
FOREIGN KEY (numModele) REFERENCES Modele_Bicyclette(numModele));
INSERT INTO Bicyclette VALUES('R152',110);
INSERT INTO Bicyclette VALUES('R153',108);
INSERT INTO Bicyclette VALUES('R154',101);
INSERT INTO Bicyclette VALUES('R155',115);

CREATE TABLE Fournisseur(
nomEntreprise VARCHAR(30),
siretFournisseur VARCHAR(30),
contact VARCHAR(30),
adresse VARCHAR(30),
libelle INT,
PRIMARY KEY (siretFournisseur)); 

INSERT INTO Fournisseur VALUE('Scott','0555978464687','0589874105','12 Rue du Capitole Toulouse', 1);
INSERT INTO Fournisseur VALUE('Trek','0555978475423','0387592405','15 Rue de la gare Nevers', 2);

CREATE TABLE Piece_rechange(
numeroProduit VARCHAR(30),
description VARCHAR(30),
date_intro VARCHAR(30),
date_discont_prod VARCHAR(30),
delai_approvisionnement INT,
numero_produit_fournisseur VARCHAR(30),
siretFournisseur VARCHAR(30),
PRIMARY KEY (numeroProduit),
FOREIGN KEY (siretFournisseur) REFERENCES Fournisseur(siretFournisseur));
INSERT INTO Piece_rechange values('C32','Cadre','03/2020','05/2020','5','156','0555978475423');
INSERT INTO Piece_rechange values('S88','Selle','03/2020','05/2020','55','157','0555978475423');
INSERT INTO Piece_rechange values('DV17','Dérailleur Avant','03/2020','05/2020','5','158','0555978464687');
INSERT INTO Piece_rechange values('G7','Guidon','03/2020','05/2020','5','159','0555978475423');


CREATE TABLE Fidelio(
noProgramme INT,
description VARCHAR(30),
cout INT,
duree INT,
rabais INT,
PRIMARY KEY (noProgramme));
INSERT INTO Fidelio VALUES(1,'Fidelio',15,1,5);
INSERT INTO Fidelio VALUES(2,'Fidelio Or',25,2,8);
INSERT INTO Fidelio VALUES(3,'Fidelio Platine',60,2,10);
INSERT INTO Fidelio VALUES(4,'Fidelio MAX',100,3,12);

CREATE TABLE Particulier(
numSecu VARCHAR(30),
prenom VARCHAR(30),
noProgramme INT,
PRIMARY KEY (numSecu),
FOREIGN KEY (noProgramme) REFERENCES Fidelio(noProgramme));
INSERT INTO Particulier Values('03e45886','toto',2);
INSERT INTO Particulier Values('03e47886','titi',Null);

CREATE TABLE Remise_Commerciale(
pourcentage_Remise INT,
PRIMARY KEY (pourcentage_Remise));
INSERT INTO Remise_Commerciale value(5);

CREATE TABLE Boutique_Specialisee(
siretBoutique VARCHAR(30),
nom_contact VARCHAR(30),
PRIMARY KEY (siretBoutique),
pourcentage_Remise INT,
FOREIGN KEY (pourcentage_Remise) REFERENCES Remise_Commerciale(pourcentage_Remise));

INSERT INTO Boutique_Specialisee Values('1565995588','Jean Reno',5);
INSERT INTO Boutique_Specialisee Values('1545583258','Jean Todt',5);

CREATE TABLE Client(
nom VARCHAR(30),
telephon VARCHAR(30),
ville VARCHAR(30),
rue VARCHAR(30),
codePostal INT,
Province VARCHAR(30),
courriel VARCHAR(30),
client_Part VARCHAR(30),
SiretBoutiqueSpe VARCHAR(30),
PRIMARY KEY (nom),
FOREIGN KEY (client_Part) REFERENCES Particulier(numSecu),
FOREIGN KEY (SiretBoutiqueSpe) REFERENCES Boutique_Specialisee(siretBoutique)); 
INSERT INTO Client values('toto','0548755987','Pau','5 Rue Louis Barthou',64000,'pyrenees atlantiques','xxxxxxx@xxxx.fr','03e45886',null);
INSERT INTO Client values('titi','0375485699','Bourges','5 Rue de l eglise',18000,'Cher','yyyyyyyyyy@xxxx.fr','03e47886',null);
INSERT INTO Client values('Decathlon','0375774990','Bourges','10 Rue de l eglise',18000,'Cher','aaaaaaaaaaa@xxxx.fr',null,'1565995588');
INSERT INTO Client values('intersport','0375458528','Auch','10 Rue d Artagnan',32000,'Gers','bbbbbbbbbbb@xxxx.fr',null,'1545583258');

CREATE TABLE Commande(
numeroCommande VARCHAR(30),
dateCommande Varchar(30),
adresse VARCHAR(30),
dateLivraison VARCHAR(30),
PRIMARY KEY (numeroCommande),
nom VARCHAR(30),
id_bicyclette VARCHAR(30),
numeroProduit VARCHAR(30),
FOREIGN KEY (id_bicyclette) REFERENCES Bicyclette(id_bicyclette),
FOREIGN KEY (numeroProduit) REFERENCES Piece_rechange(numeroProduit),
FOREIGN KEY (nom) REFERENCES Client(nom));
INSERT INTO Commande Value(1,'05/12/2020','55 Rue Louis Barthou Pau', '15/12/2020','toto','R152',null);

#Gestion du stock, connaissance à tout moment du stock des pièces et des vélos

#Par pièce
SELECT description, count(*) as Nombre
FROM Piece_rechange p
GROUP BY p.description;

SELECT *
FROM Piece_rechange p
WHERE p.description = 'Selle';



#Par fournisseur
SELECT f.nomEntreprise, count(*) as Nombre_de_pieces_differentes_venant_de_ce_fourisseur
#numeroProduit, description
FROM Piece_rechange p NATURAL JOIN fournisseur f
GROUP BY p.siretFournisseur;

SELECT *
FROM Piece_rechange p, fournisseur f
WHERE p.siretFournisseur = f.siretFournisseur and f.nomEntreprise = 'Scott';



#Par vélo
SELECT nomB, count(*) as Nombre
FROM Modele_Bicyclette m
GROUP BY m.nomB;

SELECT *
FROM Modele_Bicyclette m
WHERE m.nomB = 'Tierra Verde';


#Par catégorie de vélo
SELECT ligne_produit, count(*) as Nombre
FROM Modele_Bicyclette m
GROUP BY m.ligne_produit ;

SELECT *
FROM Modele_Bicyclette m
WHERE m.ligne_produit = 'VTT';




#Par grandeur ( Adultes, Jeunes, fille ... )
SELECT grandeur, count(*) as Nombre
FROM Modele_Bicyclette m
GROUP BY m.grandeur;

SELECT *
FROM Modele_Bicyclette m
WHERE m.grandeur = 'Jeunes';




#Par prixUnitaire
SELECT prixUnitaire, count(*) as Nombre
FROM Modele_Bicyclette m
GROUP BY m.prixUnitaire;

SELECT *
FROM Modele_Bicyclette m
WHERE m.prixUnitaire <= 200;




#Code pour trouver les pièces que velomax a (liste1). ( on créera par la suite a la main le liste des pièces dont velomax
#a besoin (liste2), puis on supprimera a liste2 les éléments de liste1 pour trouver les pièces manquantes )
SELECT numeroProduit
FROM Piece_rechange p;


#2. Produire la liste des membres pour chaque programme d’adhésion

SELECT numSecu, prenom
FROM Particulier p
WHERE noProgramme = 2;

#3. Affichez également la date d’expiration des adhésions 



#Afficher le nombre de client
SELECT count(*)
FROM Client c;
