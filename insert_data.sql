USE ecommerce;

-- admins data
INSERT INTO admins (username, password, first_name, last_name, permissions) VALUES ("thomas_h", "tspassword", "Thomas", "Hsieh", "Full");
INSERT INTO admins (username, password, first_name, last_name, permissions) VALUES ("Rich_h", "rspassword", "Rick", "Hsu", "Manage");

-- region data
INSERT INTO region (region_name, region_manager_id) VALUES ("Pittsburgh", 1);
INSERT INTO region (region_name, region_manager_id) VALUES ("cleveland", 2);
INSERT INTO region (region_name, region_manager_id) VALUES ("columbus", 1);

-- stores data
INSERT INTO stores (address, city, region_id) VALUES ("6726 McPherson Blvd", "Pittsburgh", 1);
INSERT INTO stores (address, city, region_id) VALUES ("230 N craig St", "Pittsburgh", 1);
INSERT INTO stores (address, city, region_id) VALUES ("2401 Ontario St", "Pittsburgh", 2);
INSERT INTO stores (address, city, region_id) VALUES ("1390 W. 5th Ave", "Columbus", 2);

--  salespersons data
INSERT INTO salespersons (store_id, username, password, first_name, last_name) VALUES (1, "selena_c", "scpassword", "Selena", "Chen");
INSERT INTO salespersons (store_id, username, password, first_name, last_name) VALUES (2, "ruby_l", "rlpassword", "Ruby", "Lai");
INSERT INTO salespersons (store_id, username, password, first_name, last_name) VALUES (3, "Charlie_h", "chpassword", "Charlie", "Hsu");
INSERT INTO salespersons (store_id, username, password, first_name, last_name) VALUES (4, "Atina_c", "ccpassword", "Atina", "Chen");
INSERT INTO salespersons (store_id, username, password, first_name, last_name) VALUES (1, "Barry_c", "bcpassword", "Barry", "Chun");

-- customers data
INSERT INTO customers (username, password, first_name, last_name) VALUES ("jeffcheng", "jcpassword", "Jeff", "Cheng");
INSERT INTO customers (username, password, first_name, last_name) VALUES ("arielchen", "acpassword", "Ariel", "Chen");
INSERT INTO customers (username, password, first_name, last_name) VALUES ("sophiawang", "swpassword", "Sophia", "Wang");

-- orders data
INSERT INTO orders (customer_id, salesperson_id, status) VALUES (1, 5, "picked_up");
INSERT INTO orders (customer_id, salesperson_id, status) VALUES (2, 1, "delivery");
INSERT INTO orders (customer_id, salesperson_id, status) VALUES (3, 2, "picked_up");
INSERT INTO orders (customer_id, salesperson_id, status) VALUES (1, 5, "picked_up");

-- order_details data
INSERT INTO order_details (product_id, order_id, quantity) VALUES ()

INSERT INTO product_category (name, description) VALUES ("grocery", "daily stuff");

