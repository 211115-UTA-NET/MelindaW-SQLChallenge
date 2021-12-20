CREATE SCHEMA Pdb;
GO
CREATE TABLE Pdb.Pokemon
(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Name NVARCHAR(100) NOT NULL,
	Height NVARCHAR(50) NOT NULL,
	Weight NVARCHAR(50) NOT NULL
);

CREATE TABLE Pdb.Type
(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Name NVARCHAR(100) UNIQUE
);

CREATE TABLE Pdb.PokemonType
(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	PokemonID INT FOREIGN KEY REFERENCES Pdb.Pokemon(Id),
	TypeID INT FOREIGN KEY REFERENCES Pdb.Type(Id)
);

INSERT INTO Pdb.Pokemon
	(Name, Height, Weight)
VALUES
	('Bulbasaur','7','70'),
	('Ditto','3','40');

INSERT INTO Pdb.Type
	(Name)
VALUES
	('Normal'),
	('Grass');

INSERT INTO Pdb.PokemonType
	(PokemonID, TypeID)
VALUES
	((SELECT Id FROM Pdb.Pokemon WHERE Name='Bulbasaur'),(SELECT Id FROM Pdb.Type WHERE Name='Grass')),
	((SELECT Id FROM Pdb.Pokemon WHERE Name='Ditto'),(SELECT Id FROM Pdb.Type WHERE Name='Normal'));

SELECT Pdb.Pokemon.Id, Pdb.Pokemon.Name, Height, Weight, Pdb.Type.Id, Pdb.Type.Name, Pdb.PokemonType.ID
FROM Pdb.PokemonType
INNER JOIN Pdb.Type ON PDb.Type.Id=Pdb.PokemonType.TypeID
INNER JOIN Pdb.Pokemon ON Pdb.PokemonType.PokemonID=Pdb.Pokemon.Id;
