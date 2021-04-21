CREATE DATABASE VeloMax;
USE VeloMax;
CREATE TABLE Liste_Assemblage(
nomB VARCHAR(30) PRIMARY KEY,
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

CREATE TABLE Modele_Bicyclette(
numModele INT,
nomB VARCHAR(30),
PRIMARY KEY(numModele,nomB),
FOREIGN KEY (nomB) REFERENCES Liste_Assemblage(nomB),
grandeur VARCHAR(30),
prixUnitaire INT,
ligne_produit VARCHAR(30),
date_intro DATETIME,
date_discont_prod DATETIME);

CREATE TABLE Bicyclette(
id_bicyclette VARCHAR(30),
numModele INT,
PRIMARY KEY(id_bicyclette,numModele),
FOREIGN KEY (numModele) REFERENCES Modele_Bicyclette(numModele));

CREATE TABLE Fournisseur(
nomEntreprise VARCHAR(30),
siretFournisseur VARCHAR(30),
contact VARCHAR(30),
adresse VARCHAR(30),
libelle VARCHAR(30),
PRIMARY KEY (siretFournisseur)); 

CREATE TABLE Piece_rechange(
numeroProduit VARCHAR(30),
description VARCHAR(30),
date_intro DATETIME,
date_discont_prod DATETIME,
delai_approvisionnement INT,
numero_produit_fournisseur VARCHAR(30),
siretFournisseur VARCHAR(30),
PRIMARY KEY (numeroProduit),
FOREIGN KEY (siretFournisseur) REFERENCES Fournisseur(siretFournisseur));

CREATE TABLE Fidelio(
noProgramme INT,
description VARCHAR(30),
cout INT,
duree INT,
rabais INT,
PRIMARY KEY (noProgramme));

CREATE TABLE Particulier(
numSecu VARCHAR(30),
prenom VARCHAR(30),
noProgramme INT,
PRIMARY KEY (numSecu),
FOREIGN KEY (noProgramme) REFERENCES Fidelio(noProgramme));

CREATE TABLE Remise_Commerciale(
pourcentage_Remise INT,
PRIMARY KEY (pourcentage_Remise));

CREATE TABLE Boutique_Specialisee(
siretBoutique VARCHAR(30),
nom_contact VARCHAR(30),
PRIMARY KEY (siretBoutique),
pourcentage_Remise INT,
FOREIGN KEY (pourcentage_Remise) REFERENCES Remise_Commerciale(pourcentage_Remise));

CREATE TABLE Client(
nom VARCHAR(30),
telephon VARCHAR(30),
ville VARCHAR(30),
rue VARCHAR(30),
codePostal INT,
Province VARCHAR(30),
courriel VARCHAR(30),
client_Part VARCHAR(30),
siretBoutique VARCHAR(30),
boutiqueSpe VARCHAR(30),
PRIMARY KEY (nom),
FOREIGN KEY (client_Part) REFERENCES Particulier(numSecu),
FOREIGN KEY (boutiqueSpe) REFERENCES Boutique_Specialisee(siretBoutique)); 

CREATE TABLE Commande(
numeroCommande VARCHAR(30),
dateCommande DATETIME,
adresse VARCHAR(30),
dateLivraison DATETIME,
PRIMARY KEY (numeroCommande),
nom VARCHAR(30),
id_bicyclette VARCHAR(30),
numeroProduit VARCHAR(30),
FOREIGN KEY (id_bicyclette) REFERENCES Bicyclette(id_bicyclette),
FOREIGN KEY (numeroProduit) REFERENCES Piece_rechange(numeroProduit),
FOREIGN KEY (nom) REFERENCES Client(nom));


