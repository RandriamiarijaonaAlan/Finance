-- Création de la base de données
CREATE DATABASE Finance;
USE Finance;

-- Table Client
CREATE TABLE Client (
    IdClient INT AUTO_INCREMENT PRIMARY KEY,
    Nom VARCHAR(100) NOT NULL,
    Prenom VARCHAR(100) NOT NULL,
    DateDeNaissance DATE NOT NULL,
    Adresse VARCHAR(255) NOT NULL,
    Numero VARCHAR(15) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Profession VARCHAR(255) NOT NULL,
    MotDePasse VARCHAR(255) NOT NULL
);

-- Table Admin
CREATE TABLE Admin (
    IdAdmin INT AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Nom VARCHAR(100) NOT NULL,
    MotDePasse VARCHAR(255) NOT NULL,
    Numero VARCHAR(15) NOT NULL
);

-- Table TypePret
CREATE TABLE TypePret (
    IdTypePret INT AUTO_INCREMENT PRIMARY KEY,
    Libelle VARCHAR(100) NOT NULL,
    Taux DECIMAL(5,2) NOT NULL
);

-- Table Pret
CREATE TABLE Pret (
    IdPret INT AUTO_INCREMENT PRIMARY KEY,
    Titre VARCHAR(100) NOT NULL,
    Description TEXT NOT NULL,
    IdTypePret INT NOT NULL,
    Montant DECIMAL(15,2) NOT NULL,
    DatePret DATE NOT NULL,
    IdClient INT NOT NULL,
    FOREIGN KEY (IdTypePret) REFERENCES TypePret(IdTypePret),
    FOREIGN KEY (IdClient) REFERENCES Client(IdClient)
);

-- Table Fond
CREATE TABLE Fond (
    IdFond INT AUTO_INCREMENT PRIMARY KEY,
    NomPersonne VARCHAR(100) NOT NULL,
    Montant DECIMAL(15,2) NOT NULL,
    DateDepot DATE NOT NULL
);

-- Insertion données de test Admin
INSERT INTO Admin (Email, Nom, MotDePasse, Numero) 
VALUES ('admin@gmail.com', 'admin', 'admin', '0123456789');

-- Insertion données de test Client
INSERT INTO Client (Nom, Prenom, DateDeNaissance, Adresse, Numero, Email, Profession, MotDePasse)
VALUES (
    'User', 'One', '2000-01-01', '123 Rue Exemple', '0123456789', 'user1@gmail.com', 'Développeur', 'password1'
);

-- Insertion de 3 types de prêts
INSERT INTO TypePret (Libelle, Taux) VALUES
('Prêt Immobilier', 5.50),
('Prêt Personnel', 8.00),
('Prêt Étudiant', 3.00);
