INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (5, 'Charmander', '2022-02-08', 0, 'false', -11);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (6, 'Plantmon', '2022-11-15', 2, 'false', -5.7);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (7, 'Squirtle', '1993-04-02', 3, 'false', -12.13);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (8, 'Angemon', '2005-06-12', 1, 'true', -45);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (9, 'Boarmon', '2005-06-07', 7, 'true', 20.4);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (10, 'Blossom', '1998-10-13', 3, 'true', 17);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (11, 'Ditto', '2022-05-14', 4, 'true', 22);


-- JOIN TABLES DAY 3
INSERT INTO owners (full_name, age)
  VALUES ('Sam Smith', 34),
         ('Jennifer Orwell ', 19),
		 ('Bob', 45),
		 ('Melody Pond ', 77),
		 ('Dean Winchester ', 14),
		 ('Jodie Whittaker', 38);
		 select * from animals
INSERT INTO species (name)
  VALUES ('Pokemon'),
         ('Digimon');

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander','Squirtle','Blossom');
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';


-- TABLE RELATIONS DAY 4

INSERT INTO vets (name, age, date_of_graduation) VALUES 
  ('William Tatcher', 45, '2000-04-23'), 
  ('Maisy Smith', 26, '2019-01-17'), 
  ('Stephanie Mendez', 64, '1981-05-04'), 
  ('Jack Harkness', 38, '2008-06-08');
  
INSERT INTO specializations (vet_id,species_id) VALUES (1,1),(3,1),(3,2),(4,2);

 INSERT INTO visits (animal_id, vet_id, date_of_visit) VALUES 
	(1, 1, '2020-05-24'), (1, 3, '2020-07-22'), (2,4,'2021-02-02'),
	(3, 2, '2020-01-05'), (3, 2, '2020-03-08'), (3, 2, '2020-05-14'),
	(4, 3, '2021-05-04'), (5, 4, '2021-02-24'), (6,2,'2019-12-21'),
	(6,1,'2020-08-10'), (6,2,'2021-04-07'), (7,3,'2019-09-29'),
	(8, 4, '2020-10-03'), (8, 4, '2020-11-04'), (9,2,'2019-01-24'),
	(9,2,'2019-05-15'), (9,2,'2020-02-27'), (9,2,'2020-08-03'),
	(10, 3, '2020-05-24'), (10, 1, '2021-01-11');