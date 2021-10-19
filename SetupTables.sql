DROP TABLE IF EXISTS accounts CASCADE;
CREATE TABLE accounts ( 
    account_id serial PRIMARY KEY,
    username VARCHAR (255) UNIQUE NOT NULL,
    password VARCHAR (255) NOT NULL,
    email VARCHAR (255) UNIQUE NOT NULL
);

DROP TABLE IF EXISTS recipes CASCADE;
CREATE TABLE recipes (
    recipe_id serial PRIMARY KEY,
    account_id INT NOT NULL,
    recipe_name VARCHAR (255) NOT NULL,
    prep_time INT NOT NULL,
    cook_time INT NOT NULL,
    servings INT NOT NULL,
    public_flag INT NOT NULL,
    FOREIGN KEY (account_id)
        REFERENCES accounts (account_id)
);

DROP TABLE IF EXISTS ingredients CASCADE;
CREATE TABLE ingredients (
    ingredient_id serial PRIMARY KEY,
    ingredient_name VARCHAR (255) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS measurement_units CASCADE;
CREATE TABLE measurement_units (
    unit_id serial PRIMARY KEY,
    unit_name VARCHAR (255) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS recipe_ingredients;
CREATE TABLE recipe_ingredients (
    recipe_id INT NOT NULL,
    ingredient_id INT NOT NULL UNIQUE,
    unit_id INT NOT NULL,
    quantity NUMERIC NOT NULL,
    PRIMARY KEY (recipe_id, ingredient_id),
    FOREIGN KEY (recipe_id)
        REFERENCES recipes (recipe_id),
    FOREIGN KEY (ingredient_id)
        REFERENCES ingredients (ingredient_id),
    FOREIGN KEY (unit_id)
        REFERENCES measurement_units (unit_id)
);

DROP TABLE IF EXISTS recipe_instructions;
CREATE TABLE recipe_instructions (
    recipe_id INT NOT NULL,
    step_number INT NOT NULL UNIQUE,
    instruction_text VARCHAR(300) NOT NULL,
    PRIMARY KEY (recipe_id, step_number),
    FOREIGN KEY (recipe_id)
        REFERENCES recipes (recipe_id)
);

DROP TABLE IF EXISTS tags CASCADE;
CREATE TABLE tags (
    tag_id serial PRIMARY KEY,
    tag_name VARCHAR (20) NOT NULL UNIQUE
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

DROP TABLE IF EXISTS recipe_ratings;
CREATE TABLE recipe_ratings (
    rater_account_id INT NOT NULL,
    recipe_id INT NOT NULL,
    rating INT NOT NULL,
    PRIMARY KEY (rater_account_id, recipe_id),
    FOREIGN KEY (rater_account_id)
        REFERENCES accounts (account_id),
    FOREIGN KEY (recipe_id)
        REFERENCES recipes (recipe_id)
);

DROP TABLE IF EXISTS recipe_comments;
CREATE TABLE recipe_comments (
    commenter_account_id INT NOT NULL,
    recipe_id INT NOT NULL,
    comment_date DATE NOT NULL,
    comment_time TIME NOT NULL,
    comment_text VARCHAR (300) NOT NULL,
    PRIMARY KEY (commenter_account_id, recipe_id, comment_date, comment_time),
    FOREIGN KEY (commenter_account_id)
        REFERENCES accounts (account_id),
    FOREIGN KEY (recipe_id)
        REFERENCES recipes (recipe_id)
);