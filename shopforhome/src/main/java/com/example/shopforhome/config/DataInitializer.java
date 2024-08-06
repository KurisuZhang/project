package com.example.shopforhome.config;

import com.example.shopforhome.Repository.CartItemRepository;
import com.example.shopforhome.Repository.ProductRepository;
import com.example.shopforhome.Repository.UserRepository;
import com.example.shopforhome.entity.CartItem;
import com.example.shopforhome.entity.Product;
import com.example.shopforhome.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class DataInitializer implements CommandLineRunner {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private CartItemRepository cartItemRepository;


    @Override
    public void run(String... args) throws Exception {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        User user1 = new User();
        user1.setUsername("user1");
        user1.setPassword(encoder.encode("password1"));
        user1.setRole("USER");
        userRepository.save(user1);

        User admin = new User();
        admin.setUsername("admin");
        admin.setPassword(encoder.encode("adminpass"));
        admin.setRole("ADMIN");
        userRepository.save(admin);

        Product product1 = new Product();
        product1.setName("Laptop");
        product1.setCategory("Electronics");
        product1.setPrice(1000.0);
        product1.setStock(50);
        productRepository.save(product1);

        Product product2 = new Product();
        product2.setName("Phone");
        product2.setCategory("Electronics");
        product2.setPrice(700.0);
        product2.setStock(100);
        productRepository.save(product2);

        CartItem cartItem1 = new CartItem();
        cartItem1.setUser(user1);
        cartItem1.setProduct(product1);
        cartItem1.setQuantity(1);
        cartItemRepository.save(cartItem1);

        CartItem cartItem2 = new CartItem();
        cartItem2.setUser(user1);
        cartItem2.setProduct(product2);
        cartItem2.setQuantity(2);
        cartItemRepository.save(cartItem2);
    }
}
