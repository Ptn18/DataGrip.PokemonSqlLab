# PART 2
# What are all the types of pokemon that a pokemon can have?
SELECT name FROM types;
#What is the name of the pokemon with id 45?
SELECT name FROM pokemons WHERE id = 45;
#How many pokemon are there?
SELECT COUNT(*) as "count" FROM pokemons;
#How many types are there?
SELECT COUNT(*) as "Type Count" FROM types;
#How many pokemon have a secondary type?
SELECT COUNT(*) as "Secondary Type" FROM pokemons WHERE secondary_type;
# PART 3
#What is each pokemon's primary type?
SELECT p.name, t.name
FROM pokemons p
JOIN types t
ON p.primary_type = t.id;
#What is Rufflet's secondary type?
SELECT t.name
FROM pokemons p
JOIN types t
ON p.secondary_type = t.id
WHERE p.name ="Rufflet";
#What are the names of the pokemon that belong to the trainer with trainerID 303?
SELECT p.name
FROM pokemon_trainer t
JOIN pokemons p
ON t.pokemon_id = p.id
WHERE t.trainerID = 303;
#How many pokemon have a secondary type Poison
SELECT COUNT(*)
FROM  pokemons
WHERE secondary_type IN(SELECT id
  FROM types
  WHERE name = "Poison");
#What are all the primary types and how many pokemon have that type?
SELECT t.name, COUNT(p.primary_type) as "Number Of Pokemon"
FROM pokemons p
JOIN types t
ON p.primary_type =t.id
GROUP BY t.name;
#How many pokemon at level 100 does each trainer with at least one level 100 pokemon have? (Hint: your query should not display a trainer
SELECT trainerID, COUNT(*)
FROM pokemon_trainer
WHERE pokelevel = 100
GROUP BY trainerID;
#How many pokemon only belong to one trainer and no other?
SELECT pokemon_id
FROM pokemon_trainer
GROUP BY pokemon_id
HAVING COUNT(*)=1;
#PART 4: FINAL REPORT
SELECT DISTINCT p.name as "Pokemon Name", t.trainername as "Trainer Name", pt.pokelevel as "Level", p.primary_type as "Primary Type",p.secondary_type as "Secondary Type",pt.hp as "Health",pt.pokemon_id
FROM pokemons p
JOIN pokemon_trainer pt
ON p.id = pt.pokemon_id
JOIN trainers t
ON pt.trainerID = t.trainerID
 ORDER BY pt.pokelevel DESC, p.secondary_type DESC, pt.hp DESC, t.trainername DESC ;


#RANKING THE STRONGEST TRAINER BY GETTING THE SUM OF ALL THE TRAINER'S POKEMONS LEVEL
SELECT t.trainername as "Trainer Name", SUM(pt.pokelevel) as "Level"
FROM pokemons p
JOIN pokemon_trainer pt
ON p.id = pt.pokemon_id
JOIN trainers t
ON pt.trainerID = t.trainerID
GROUP BY t.trainername, pt.pokelevel
 ORDER BY SUM(pt.pokelevel) DESC;
# The trainers Cool♀ and Cool♂ ties being the strongest trainer. 











