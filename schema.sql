DROP DATABASE ecommerce;
CREATE DATABASE ecommerce;
USE ecommerce;
CREATE TABLE `admins` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`username` varchar(255) NOT NULL,
	`password` varchar(255) NOT NULL,
	`first_name` varchar(255) NOT NULL,
	`last_name` varchar(255) NOT NULL,
	`permissions` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `customers` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`username` varchar(255) NOT NULL,
	`password` varchar(255) NOT NULL,
	`first_name` varchar(255) NOT NULL,
	`last_name` varchar(255) NOT NULL,
	`created_at` DATETIME NOT NULL DEFAULT current_timestamp,
	PRIMARY KEY (`id`)
);

CREATE TABLE `orders` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`customer_id` INT NOT NULL,
	`salesperson_id` INT NOT NULL,
	`status` varchar(255) NOT NULL,
	`created_at` DATETIME NOT NULL DEFAULT current_timestamp,
	PRIMARY KEY (`id`)
);

CREATE TABLE `salespersons` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`store_id` INT NOT NULL,
	`username` varchar(255) NOT NULL,
	`password` varchar(255) NOT NULL,
	`first_name` varchar(255) NOT NULL,
	`last_name` varchar(255) NOT NULL,
	`created_at` DATETIME NOT NULL DEFAULT current_timestamp,
	PRIMARY KEY (`id`)
);

CREATE TABLE `stores` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`address` varchar(255) NOT NULL,
	`city` varchar(255) NOT NULL,
	`region_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `region` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`region_name` varchar(255) NOT NULL,
	`region_manager_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `order_details` (
	`product_id` INT NOT NULL,
	`order_id` INT NOT NULL,
	`quantity` INT NOT NULL
);

CREATE TABLE `product` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`description` varchar(255) NOT NULL,
	`category_id` INT NOT NULL,
	`inventory_id` INT NOT NULL,
	`price` INT NOT NULL,
    `created_at` DATETIME NOT NULL DEFAULT current_timestamp,
	PRIMARY KEY (`id`)
);

CREATE TABLE `product_category` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`description` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `product_inventory` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`quantity` INT NOT NULL,
	`status` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `orders` ADD CONSTRAINT `orders_fk0` FOREIGN KEY (`customer_id`) REFERENCES `customers`(`id`);

ALTER TABLE `orders` ADD CONSTRAINT `orders_fk1` FOREIGN KEY (`salesperson_id`) REFERENCES `salespersons`(`id`);

ALTER TABLE `salespersons` ADD CONSTRAINT `salespersons_fk0` FOREIGN KEY (`store_id`) REFERENCES `stores`(`id`);

ALTER TABLE `stores` ADD CONSTRAINT `stores_fk0` FOREIGN KEY (`region_id`) REFERENCES `region`(`id`);

ALTER TABLE `region` ADD CONSTRAINT `region_fk0` FOREIGN KEY (`region_manager_id`) REFERENCES `admins`(`id`);

ALTER TABLE `order_details` ADD CONSTRAINT `order_details_fk0` FOREIGN KEY (`order_id`) REFERENCES `orders`(`id`);

ALTER TABLE `order_details` ADD CONSTRAINT `order_details_fk1` FOREIGN KEY (`product_id`) REFERENCES `product`(`id`);

ALTER TABLE `product` ADD CONSTRAINT `product_fk0` FOREIGN KEY (`category_id`) REFERENCES `product_category`(`id`);

ALTER TABLE `product` ADD CONSTRAINT `product_fk1` FOREIGN KEY (`inventory_id`) REFERENCES `product_inventory`(`id`);
