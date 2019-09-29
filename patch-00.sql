CREATE TYPE recipe_category AS ENUM (
  'starter', 'main dish', 'dessert', 'salad', 'beverage', 'drink'
);

CREATE TABLE recipes (
  id SERIAL PRIMARY KEY,
  name CHAR(20),
  ingredients TEXT [],
  how_to TEXT,
  metadata JSON,
  category recipe_category
);
