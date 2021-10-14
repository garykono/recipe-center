DROP TABLE IF EXISTS accounts;
CREATE TABLE accounts ( 
    account_id serial PRIMARY KEY,
    username VARCHAR (255) UNIQUE NOT NULL,
    password VARCHAR (255) NOT NULL,
    email VARCHAR (255) UNIQUE NOT NULL
);

DROP TABLE IF EXISTS recipes;
CREATE TABLE recipes (
    recipe_id serial PRIMARY KEY,
    recipe_name VARCHAR (255) NOT NULL,
    prep_time INT NOT NULL,
    cook_time INT NOT NULL,
    servings INT NOT NULL,
    public_flag INT NOT NULL
);

DROP TABLE IF EXISTS ingredients;
CREATE TABLE ingredients (
    ingredient_id serial PRIMARY KEY,
    ingredient_name VARCHAR (255) NOT NULL
);

DROP TABLE IF EXISTS recipe_ingredients;
CREATE TABLE recipe_ingredients (
    recipe_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    PRIMARY KEY (recipe_id, ingredient_id),
    FOREIGN KEY (recipe_id)
        REFERENCES recipes (recipe_id),
    FOREIGN KEY (ingredient_id)
        REFERENCES ingredients (ingredient_id),
);

DROP TABLE IF EXISTS measurement_units;
CREATE TABLE measurement_units (
    unit_id serial PRIMARY KEY,
    unit_name VARCHAR (255) NOT NULL
);

DROP TABLE IF EXISTS recipe_ratings;
CREATE TABLE recipe_ratings (
    account_id INT PRIMARY KEY,
    rating INT NOT NULL,
    FOREIGN KEY (account_id)
        REFERENCES accounts (account_id)
);

DROP TABLE IF EXISTS recipe_comments;
CREATE TABLE recipe_comments (
    recipe_id INT PRIMARY KEY,
    comment VARCHAR (300) NOT NULL,
    FOREIGN KEY (recipe_id)
        REFERENCES recipes (recipe_id)
);

DROP TABLE IF EXISTS tags;
CREATE TABLE tags (
    tag_id serial PRIMARY KEY,
    tag_name VARCHAR (20) NOT NULL
);

DROP TABLE IF EXISTS recipe_tags;
CREATE TABLE recipe_tags (
    recipe_id INT NOT NULL,
    tag_id INT NOT NULL,
    PRIMARY KEY (recipe_id, tag_id),
    FOREIGN KEY (recipe_id)
        REFERENCES recipes (recipe_id),
    FOREIGN KEY (tag_id)
        REFERENCES tags (tag_id)
);