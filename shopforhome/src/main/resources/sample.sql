CREATE TABLE users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL,
    role VARCHAR(20) NOT NULL
);

CREATE TABLE products (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DOUBLE NOT NULL,
    stock INT NOT NULL,
    image_url VARCHAR(255)
);

CREATE TABLE cart_items (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);


-- Cart-Products join table with quantity
CREATE TABLE cart_products (
    cart_id BIGINT,
    product_id BIGINT,
    quantity INT,
    PRIMARY KEY (cart_id, product_id),
    FOREIGN KEY (cart_id) REFERENCES carts(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Wishlist-Products join table
CREATE TABLE wishlist_products (
    wishlist_id BIGINT,
    product_id BIGINT,
    PRIMARY KEY (wishlist_id, product_id),
    FOREIGN KEY (wishlist_id) REFERENCES wishlists(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);


