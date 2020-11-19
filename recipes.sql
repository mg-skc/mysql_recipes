/* HERE ARE THE QUERIES UP HERE AT THE TOP*/

/*  Here's the update query I wrote to correct the bread entries 
It worked in Fiddle! :)  It changed the measure from Null to Whole.  */

UPDATE RecipeIngredient
SET measure_id=4
WHERE ingredient_id=17

/*
get recipes with a specific ingredient 
*/ 

SELECT *
From Recipe r
JOIN RecipeIngredient ri on ri.recipe_id = r.id  
JOIN Ingredient i on i.id = ri.ingredient_id 
WHERE i.name = 'Honey'

/*get a list of recipes */ 
SELECT * from Recipe

/* COMMENTS ON THE DATABASE SCHEMA NOW BELOW */


/*these first four create lines create the tables of our database. I had to change name length to 50 for my recipes.*/
create table Recipe (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name VARCHAR(50), description VARCHAR(50), instructions VARCHAR(500)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table Ingredient (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name VARCHAR(50)) ENGINE=InnoDB DEFAULT CHARSET=utf8; 
create table Measure (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name VARCHAR(30)) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

create table RecipeIngredient (recipe_id INT NOT NULL, ingredient_id INT NOT NULL, measure_id INT, amount INT, 
	CONSTRAINT fk_recipe FOREIGN KEY(recipe_id) REFERENCES Recipe(id), 
	CONSTRAINT fk_ingredient FOREIGN KEY(ingredient_id) REFERENCES Ingredient(id), 
	CONSTRAINT fk_measure FOREIGN KEY(measure_id) REFERENCES Measure(id)) 
	ENGINE=InnoDB DEFAULT CHARSET=utf8; 
/*these constrainT lines show the connections between the four tables...how they interconnect.*/

/* this insert creates the selection of measures of the measure database.*/
INSERT INTO Measure (name) VALUES('CUP'), ('TEASPOON'), ('TABLESPOON'), ('WHOLE'), ('CAN'), ('STICK'), ('OUNCE');

/* this insert creates the selection of ingredients of the ingredient database.*/
INSERT INTO Ingredient (name) VALUES('egg'), ('salt'), ('sugar'), ('chocolate'), ('vanilla extract'), ('flour'), ('unsalted butter'), ('70% dark chocolate, chopped'), ('old fashioned oatmeal'), ('maple syrup'), ('raw almonds, coarsely chopped'), ('coconut milk'), ('coconut cream'), ('cornstarch'), ('peanut butter'), ('jelly of your preference'), ('bread slices of your preference'), ('banana'), ('honey'), ('coconut oil') ;

/* this insert creates a recipe entry in the recipe database. The one below does the same. note that the recipe ID is auto assigned. egg is 1, choc cake is 2, etc. 3-7 are my contributions.*/
INSERT INTO Recipe (name, description, instructions) VALUES('Boiled Egg', 'A single boiled egg', 'Add egg to cold water. Bring water to boil. Cook.');

INSERT INTO Recipe (name, description, instructions) VALUES('Chocolate Cake', 'Yummy cake', 'Add eggs, flour, chocolate to pan. Bake at 350 for 1 hour');

INSERT INTO Recipe (name, description, instructions) VALUES('Flourless Chocolate Torte', 'Rich chocolate cake!', 'Melt butter and chopped chocolate over low heat. Add lightly beat eggs in mixing bowl. Gently fold in chocolate mixture. Pour into springform pan and place pan in bain marie. Bake at 350 for 35 minutes or until toothpick comes out clean in center.');

INSERT INTO Recipe (name, description, instructions) VALUES('Peanut Butter & Jelly Sandwich', 'The classic kids favorite', 'Spread peanut butter evenly on one slice of bread, and jelly same on the other. Place the peanut butter slice on top of the jelly slice. Enjoy!');

INSERT INTO Recipe (name, description, instructions) VALUES('Peanut Butter & Honey Sandwich', 'A delicious change of pace', 'Spread peanut butter evenly on one slice of bread, and honey same on the other. Place the peanut butter slice on top of the honey slice. Enjoy!');

INSERT INTO Recipe (name, description, instructions) VALUES('Crunchy Granola', 'The best granola you have ever eaten', 'Gently heat coconut oil to melt. Add in honey to the oil make it easily pourable. Place chopped almonds in a large mixing bowl. Add maple syrup, vanilla extract, then the oil & honey mixture to the almonds. Mix well. Add in oatmeal one cup at a time. Press into cookie sheet lined with parchment and cook for 35 minutes at 325.');

INSERT INTO Recipe (name, description, instructions) VALUES('Instant Pot Chocolate Pudding', 'Smooth and satisfying chocolate pudding', 'Add coconut milk and coconut cream to medium saucepan. Heat until mixture is loose and steaming. Turn off heat, add chocolate, and stir to melt and incorporate. Turn heat back on an bring to a slow boil - add in cornstarch and stir until thickened. Place eggs in large mixing bowl, and beat lightly. Add in the hot chocolate mixture a cup at a time, stirring swiftly to temper the eggs. Pour into pyrex dish, place on trivet, and cook on low for 18 minutes');


/* These entries below add records to the RecipeIngredient table, which connects recipes with their constituient parts: ingredients and measures. Recipes 3-7 are mine. */
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount) VALUES (1, 1, NULL, 1);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (2, 1, NULL, 3);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (2, 2, 2, 1);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (2, 3, 1, 2);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (2, 4, 1, 1);



INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount) VALUES (3,1,4,6);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (3,8,7,16);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (3,7,6,1);


INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (4,17,NULL,2);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (4,15,3,2);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount) VALUES (4,16,3,2);


INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (5,17,NULL,2);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (5,15,3,2);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (5,19,3,1);


INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (6,11,7,11);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount) VALUES (6,20,3,6);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (6,19,3,6);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (6,10,3,6);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (6,5,3,2);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (6,9,1,5);


INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount) VALUES (7,8,7,6);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (7,12,5,1);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (7,13,5,1);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (7,14,3,2);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (7,5,3,1);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount) VALUES (7,1,4,4);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (7,10,3,8);

