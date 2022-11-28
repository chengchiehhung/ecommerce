USE ecommerce;
INSERT INTO admins (username, password, first_name, last_name, permissions) VALUES ("jeffc", "jcpassword", "Jeff", "Cheng", "Full");

INSERT INTO product_category (name, description) VALUES ("grocery", "daily stuff");
INSERT INTO product_category (name, description) VALUES ("clothing", "for waering");
INSERT INTO product_category (name, description) VALUES ("holiday stuff", "Christmas is comimg");

INSERT INTO product_inventory (quantity, status) VALUES ("50", "in stock");
INSERT INTO product_inventory (quantity, stutas) VALUES ("18", "in stock");
INSERT INTO product_inventory (quantity, stutas) VALUES ("0", "out of stock");

INSERT INTO product (name, description, category_id, inventory_id, price)
    VALUES ("apple", "a kind of fruit", "1", "1", "0.99");
INSERT INTO product (name, description, category_id, inventory_id, price)
    VALUES ("hoodie", "a kind of sweatshirt with hood", "2", "2", "29.99");
INSERT INTO product (name, description, category_id, inventory_id, price)
    VALUES ("Christmas tree", "stuff for Christmas", "3", "3", "99.99");
