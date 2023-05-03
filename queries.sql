/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name like '%mon'
SELECT name FROM animals WHERE date_part('year', date_of_birth) >= 2016 and date_part('year', date_of_birth) <= 2019
SELECT name FROM animals WHERE neutered = true AND escaped_attempts < 3
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu'
SELECT name, escaped_attempts FROM animals WHERE weight_kg > 10.5
SELECT * FROM animals WHERE neutered = true
SELECT * FROM animals WHERE name != 'Gabumon' OR SELECT * FROM animals WHERE name <> 'Gabumon'
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3

/* DAY TWO*/

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals

ROLLBACK;
SELECT * FROM animals

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT * FROM animals

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * (-1);
ROLLBACK TO SP1;
SELECT * FROM animals

UPDATE animals SET weight_kg = weight_kg * (-1) WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals

SELECT count(*) FROM animals
SELECT count(*) FROM animals where escaped_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, MAX(escaped_attempts) as excaped_attempts FROM animals GROUP BY neutered
SELECT species, MIN(weight_kg) as minWeight, MAX(weight_kg) as maxWeight FROM animals GROUP BY species
SELECT species, AVG(escaped_attempts) as avgEscapes FROM animals WHERE date_part('year', date_of_birth) 
BETWEEN 1990 AND 2000 GROUP BY species


-- JOIN TABLES DAY 3

SELECT name as animal_name FROM animals a JOIN owners o on a.owner_id = o.id 
	WHERE o.id IN (SELECT id FROM owners WHERE full_name = 'Melody Pond');

SELECT a.name FROM animals a JOIN species s on a.species_id = s.id 
	WHERE s.id IN (SELECT id FROM species WHERE s.name = 'Pokemon');

SELECT o.full_name as owner, a.name as animal FROM animals a RIGHT JOIN owners o ON a.owner_id = o.id

SELECT count(*) as total, s.name as species 
  FROM animals a JOIN species s ON a.species_id = s.id GROUP BY s.name
	
SELECT a.* FROM animals a JOIN species s ON a.species_id = s.id Join owners o ON a.owner_id = o.id WHERE
	s.id IN (SELECT id FROM species WHERE s.name = 'Digimon') AND 
	o.id IN (SELECT id FROM owners WHERE o.full_name = 'Jennifer Orwell');
	
SELECT a.* FROM animals a Join owners o ON a.owner_id = o.id WHERE
	o.id IN (SELECT id FROM owners WHERE o.full_name = 'Dean Winchester') AND 
	a.escaped_attempts = 0;

SELECT count(*) as total, o.full_name as OwnerName FROM 
	animals a JOIN owners o ON a.owner_id = o.id 
	GROUP BY o.full_name ORDER BY total desc LIMIT 1