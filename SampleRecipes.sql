/* Clear tables */
TRUNCATE TABLE accounts CASCADE;
TRUNCATE TABLE recipes CASCADE;

/* Sample Account 1 */
INSERT INTO accounts (username, password, email)
    VALUES ('Test Account 1', 'pass', 'test123@yahoo.com');

/*Sample Account 2 */
INSERT INTO accounts (username, password, email)
    VALUES ('Test Account 2', 'pass', 'test456@yahoo.com');

/*Sample Account 3 */
INSERT INTO accounts (username, password, email)
    VALUES ('Test Account 3', 'pass', 'test789@yahoo.com');


/* Add some units of measure for ingredients */
INSERT INTO measurement_units (unit_name) VALUES ('Cup')
    ON CONFLICT DO NOTHING;

INSERT INTO measurement_units (unit_name) VALUES ('Tbsp')
    ON CONFLICT DO NOTHING;

INSERT INTO measurement_units (unit_name) VALUES ('Tsp')
    ON CONFLICT DO NOTHING;

INSERT INTO measurement_units (unit_name) VALUES ('Pinch')
    ON CONFLICT DO NOTHING;

INSERT INTO measurement_units (unit_name) VALUES ('15 oz. Can')
    ON CONFLICT DO NOTHING;

INSERT INTO measurement_units (unit_name) VALUES ('')
    ON CONFLICT DO NOTHING;



/* Vegetable Soup */
INSERT INTO recipes (account_id, recipe_name, prep_time, cook_time, servings, public_flag)
    VALUES (
        (SELECT account_id
        FROM accounts
        WHERE username = 'Test Account 1'),
        'Vegetable Soup', 
        10, 
        30, 
        6, 
        1);
  

/* Ingredients to add to the general "ingredients" table */
INSERT INTO ingredients (ingredient_name) VALUES ('Olive Oil')
    ON CONFLICT DO NOTHING;

INSERT INTO ingredients (ingredient_name) VALUES ('Onion')
    ON CONFLICT DO NOTHING;

INSERT INTO ingredients (ingredient_name) VALUES ('Carrot')
    ON CONFLICT DO NOTHING;

INSERT INTO ingredients (ingredient_name) VALUES ('Celery')
    ON CONFLICT DO NOTHING;

INSERT INTO ingredients (ingredient_name) VALUES ('Tomato Paste')
    ON CONFLICT DO NOTHING;

INSERT INTO ingredients (ingredient_name) VALUES ('Garlic')
    ON CONFLICT DO NOTHING;

INSERT INTO ingredients (ingredient_name) VALUES ('Ground Black Pepper')
    ON CONFLICT DO NOTHING;

INSERT INTO ingredients (ingredient_name) VALUES ('Salt')
    ON CONFLICT DO NOTHING;

INSERT INTO ingredients (ingredient_name) VALUES ('Crushed Red Pepper Flakes')
    ON CONFLICT DO NOTHING;

INSERT INTO ingredients (ingredient_name) VALUES ('Can Diced Tomatoes')
    ON CONFLICT DO NOTHING;

INSERT INTO ingredients (ingredient_name) VALUES ('Potato')
    ON CONFLICT DO NOTHING;

INSERT INTO ingredients (ingredient_name) VALUES ('Cabbage')
    ON CONFLICT DO NOTHING;

INSERT INTO ingredients (ingredient_name) VALUES ('Bay Leaves')
    ON CONFLICT DO NOTHING;

INSERT INTO ingredients (ingredient_name) VALUES ('Frozen Peas')
    ON CONFLICT DO NOTHING;

INSERT INTO ingredients (ingredient_name) VALUES ('Lemon Juice')
    ON CONFLICT DO NOTHING;
        
/* Vegetable Soup Recipe Ingredients */
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, unit_id, quantity) 
    VALUES (
        (SELECT recipe_id
        FROM recipes
        WHERE recipe_name = 'Vegetable Soup'),
        (SELECT ingredient_id
        FROM ingredients
        WHERE ingredient_name = 'Olive Oil'),
        (SELECT unit_id
        FROM measurement_units
        WHERE unit_name = 'Tbsp'),
        3);

INSERT INTO recipe_ingredients (recipe_id, ingredient_id, unit_id, quantity) 
    VALUES (
        (SELECT recipe_id
        FROM recipes
        WHERE recipe_name = 'Vegetable Soup'),
        (SELECT ingredient_id
        FROM ingredients
        WHERE ingredient_name = 'Onion'),
        (SELECT unit_id
        FROM measurement_units
        WHERE unit_name = 'Cup'),
        2);

INSERT INTO recipe_ingredients (recipe_id, ingredient_id, unit_id, quantity) 
    VALUES (
        (SELECT recipe_id
        FROM recipes
        WHERE recipe_name = 'Vegetable Soup'),
        (SELECT ingredient_id
        FROM ingredients
        WHERE ingredient_name = 'Carrot'),
        (SELECT unit_id
        FROM measurement_units
        WHERE unit_name = 'Cup'),
        1.5);

INSERT INTO recipe_ingredients (recipe_id, ingredient_id, unit_id, quantity) 
    VALUES (
        (SELECT recipe_id
        FROM recipes
        WHERE recipe_name = 'Vegetable Soup'),
        (SELECT ingredient_id
        FROM ingredients
        WHERE ingredient_name = 'Celery'),
        (SELECT unit_id
        FROM measurement_units
        WHERE unit_name = 'Cup'),
        1.5);

INSERT INTO recipe_ingredients (recipe_id, ingredient_id, unit_id, quantity) 
    VALUES (
        (SELECT recipe_id
        FROM recipes
        WHERE recipe_name = 'Vegetable Soup'),
        (SELECT ingredient_id
        FROM ingredients
        WHERE ingredient_name = 'Tomato Paste'),
        (SELECT unit_id
        FROM measurement_units
        WHERE unit_name = 'Tbsp'),
        2);

INSERT INTO recipe_ingredients (recipe_id, ingredient_id, unit_id, quantity) 
    VALUES (
        (SELECT recipe_id
        FROM recipes
        WHERE recipe_name = 'Vegetable Soup'),
        (SELECT ingredient_id
        FROM ingredients
        WHERE ingredient_name = 'Garlic'),
        (SELECT unit_id
        FROM measurement_units
        WHERE unit_name = 'Tsp'),
        4);

INSERT INTO recipe_ingredients (recipe_id, ingredient_id, unit_id, quantity) 
    VALUES (
        (SELECT recipe_id
        FROM recipes
        WHERE recipe_name = 'Vegetable Soup'),
        (SELECT ingredient_id
        FROM ingredients
        WHERE ingredient_name = 'Ground Black Pepper'),
        (SELECT unit_id
        FROM measurement_units
        WHERE unit_name = 'Tsp'),
        0.5);

INSERT INTO recipe_ingredients (recipe_id, ingredient_id, unit_id, quantity) 
    VALUES (
        (SELECT recipe_id
        FROM recipes
        WHERE recipe_name = 'Vegetable Soup'),
        (SELECT ingredient_id
        FROM ingredients
        WHERE ingredient_name = 'Salt'),
        (SELECT unit_id
        FROM measurement_units
        WHERE unit_name = 'Tsp'),
        0.5);



INSERT INTO recipe_ingredients (recipe_id, ingredient_id, unit_id, quantity) 
    VALUES (
        (SELECT recipe_id
        FROM recipes
        WHERE recipe_name = 'Vegetable Soup'),
        (SELECT ingredient_id
        FROM ingredients
        WHERE ingredient_name = 'Crushed Red Pepper Flakes'),
        (SELECT unit_id
        FROM measurement_units
        WHERE unit_name = 'Tsp'),
        0.25);

INSERT INTO recipe_ingredients (recipe_id, ingredient_id, unit_id, quantity) 
    VALUES (
        (SELECT recipe_id
        FROM recipes
        WHERE recipe_name = 'Vegetable Soup'),
        (SELECT ingredient_id
        FROM ingredients
        WHERE ingredient_name = 'Can Diced Tomatoes'),
        (SELECT unit_id
        FROM measurement_units
        WHERE unit_name = '15 oz. Can'),
        1);

INSERT INTO recipe_ingredients (recipe_id, ingredient_id, unit_id, quantity) 
    VALUES (
        (SELECT recipe_id
        FROM recipes
        WHERE recipe_name = 'Vegetable Soup'),
        (SELECT ingredient_id
        FROM ingredients
        WHERE ingredient_name = 'Potato'),
        (SELECT unit_id
        FROM measurement_units
        WHERE unit_name = 'Cup'),
        2);

INSERT INTO recipe_ingredients (recipe_id, ingredient_id, unit_id, quantity) 
    VALUES (
        (SELECT recipe_id
        FROM recipes
        WHERE recipe_name = 'Vegetable Soup'),
        (SELECT ingredient_id
        FROM ingredients
        WHERE ingredient_name = 'Cabbage'),
        (SELECT unit_id
        FROM measurement_units
        WHERE unit_name = 'Cup'),
        3);

INSERT INTO recipe_ingredients (recipe_id, ingredient_id, unit_id, quantity) 
    VALUES (
        (SELECT recipe_id
        FROM recipes
        WHERE recipe_name = 'Vegetable Soup'),
        (SELECT ingredient_id
        FROM ingredients
        WHERE ingredient_name = 'Bay Leaves'),
        (SELECT unit_id
        FROM measurement_units
        WHERE unit_name = ''),
        2);

INSERT INTO recipe_ingredients (recipe_id, ingredient_id, unit_id, quantity) 
    VALUES (
        (SELECT recipe_id
        FROM recipes
        WHERE recipe_name = 'Vegetable Soup'),
        (SELECT ingredient_id
        FROM ingredients
        WHERE ingredient_name = 'Frozen Peas'),
        (SELECT unit_id
        FROM measurement_units
        WHERE unit_name = 'Cup'),
        1);

INSERT INTO recipe_ingredients (recipe_id, ingredient_id, unit_id, quantity) 
    VALUES (
        (SELECT recipe_id
        FROM recipes
        WHERE recipe_name = 'Vegetable Soup'),
        (SELECT ingredient_id
        FROM ingredients
        WHERE ingredient_name = 'Lemon Juice'),
        (SELECT unit_id
        FROM measurement_units
        WHERE unit_name = 'Tsp'),
        0.5);

/* Recipe instructions */
INSERT INTO recipe_instructions (recipe_id, step_number, instruction_text) 
    VALUES (
        (SELECT recipe_id
        FROM recipes
        WHERE recipe_name = 'Vegetable Soup'),
        1,
        'Heat the oil in a stockpot pot or Dutch oven over medium heat. Add the onions, carrots, celery, and tomato paste. 
        Cook, stirring often until the vegetables have softened and the onions are translucent; 8 to 10 minutes.'
    );

    INSERT INTO recipe_instructions (recipe_id, step_number, instruction_text) 
    VALUES (
        (SELECT recipe_id
        FROM recipes
        WHERE recipe_name = 'Vegetable Soup'),
        2,
        'Add the garlic, fennel, black pepper, 1/2 teaspoon of salt, and the red pepper flakes. Cook, while stirring, for one minute.'
    );

    INSERT INTO recipe_instructions (recipe_id, step_number, instruction_text) 
    VALUES (
        (SELECT recipe_id
        FROM recipes
        WHERE recipe_name = 'Vegetable Soup'),
        3,
        'Pour in the canned tomatoes and their juices as well as the stock/broth.'
    );

    INSERT INTO recipe_instructions (recipe_id, step_number, instruction_text) 
    VALUES (
        (SELECT recipe_id
        FROM recipes
        WHERE recipe_name = 'Vegetable Soup'),
        4,
        'Add the potatoes, cabbage, and bay leaves. Raise the heat to medium-high and bring the soup to a boil. 
        Partially cover the pot with a lid, and then reduce the heat to maintain a low simmer.'
    );

    INSERT INTO recipe_instructions (recipe_id, step_number, instruction_text) 
    VALUES (
        (SELECT recipe_id
        FROM recipes
        WHERE recipe_name = 'Vegetable Soup'),
        5,
        'Simmer for 20 minutes or until the potatoes, and other vegetables are tender. Add the frozen peas and cook for five more minutes.'
    );

    INSERT INTO recipe_instructions (recipe_id, step_number, instruction_text) 
    VALUES (
        (SELECT recipe_id
        FROM recipes
        WHERE recipe_name = 'Vegetable Soup'),
        6,
        'Remove the pot from the heat and remove the bay leaves. Stir in the cider vinegar (or lemon juice). 
        Taste and season with more salt, pepper or vinegar. Serve.'
    );

/* Add tags for this recipe to general tags table */
INSERT INTO tags (tag_name) VALUES ('Soup')
    ON CONFLICT DO NOTHING;

INSERT INTO tags (tag_name) VALUES ('Vegetable')
    ON CONFLICT DO NOTHING;

INSERT INTO tags (tag_name) VALUES ('Healthy')
    ON CONFLICT DO NOTHING;

INSERT INTO tags (tag_name) VALUES ('Lean')
    ON CONFLICT DO NOTHING;

/* Add tags to this recipe's tags */
INSERT INTO recipe_tags (recipe_id, tag_id) 
    VALUES (
        (SELECT recipe_id
        FROM recipes
        WHERE recipe_name = 'Vegetable Soup'),
        (SELECT tag_id
        FROM tags
        WHERE tag_name = 'Soup')
    );

INSERT INTO recipe_tags (recipe_id, tag_id) 
    VALUES (
        (SELECT recipe_id
        FROM recipes
        WHERE recipe_name = 'Vegetable Soup'),
        (SELECT tag_id
        FROM tags
        WHERE tag_name = 'Vegetable')
    );

INSERT INTO recipe_tags (recipe_id, tag_id) 
    VALUES (
        (SELECT recipe_id
        FROM recipes
        WHERE recipe_name = 'Vegetable Soup'),
        (SELECT tag_id
        FROM tags
        WHERE tag_name = 'Healthy')
    );

INSERT INTO recipe_tags (recipe_id, tag_id) 
    VALUES (
        (SELECT recipe_id
        FROM recipes
        WHERE recipe_name = 'Vegetable Soup'),
        (SELECT tag_id
        FROM tags
        WHERE tag_name = 'Lean')
    );

/* Add a couple ratings */
INSERT INTO recipe_ratings (rater_account_id, recipe_id, rating) 
    VALUES (
        (SELECT account_id
        FROM accounts
        WHERE username = 'Test Account 2'),
        (SELECT recipe_id
        FROM recipes
        WHERE recipe_name = 'Vegetable Soup'),
        5
    );

INSERT INTO recipe_ratings (rater_account_id, recipe_id, rating) 
    VALUES (
        (SELECT account_id
        FROM accounts
        WHERE username = 'Test Account 3'),
        (SELECT recipe_id
        FROM recipes
        WHERE recipe_name = 'Vegetable Soup'),
        3
    );

/* Add a couple comments */
INSERT INTO recipe_comments (commenter_account_id, recipe_id, comment_date, comment_time, comment_text) 
    VALUES (
        (SELECT account_id
        FROM accounts
        WHERE username = 'Test Account 2'),
        (SELECT recipe_id
        FROM recipes
        WHERE recipe_name = 'Vegetable Soup'),
        '2021-10-01',
        '06:44:00',
        'This is comment 1 for vegetable soup. Delicious!'
    );

INSERT INTO recipe_comments (commenter_account_id, recipe_id, comment_date, comment_time, comment_text) 
    VALUES (
        (SELECT account_id
        FROM accounts
        WHERE username = 'Test Account 3'),
        (SELECT recipe_id
        FROM recipes
        WHERE recipe_name = 'Vegetable Soup'),
        '2021-10-01',
        '17:18:00',
        'This is comment 2 for vegetable soup. the soup is okay but bland'
    );

INSERT INTO recipe_comments (commenter_account_id, recipe_id, comment_date, comment_time, comment_text) 
    VALUES (
        (SELECT account_id
        FROM accounts
        WHERE username = 'Test Account 2'),
        (SELECT recipe_id
        FROM recipes
        WHERE recipe_name = 'Vegetable Soup'),
        '2021-11-01',
        '15:42:00',
        'This is comment 3 for vegetable soup. I know I commented yesterday but I can''t stop eating this!!!'
    );
