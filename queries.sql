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