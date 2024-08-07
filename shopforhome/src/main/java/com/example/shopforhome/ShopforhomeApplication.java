package com.example.shopforhome;

import com.example.shopforhome.entity.Productt;
import com.example.shopforhome.entity.Userr;
import com.example.shopforhome.repository.ProducttRepository;
import com.example.shopforhome.repository.UserrRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ShopForHomeApplication implements CommandLineRunner {

    @Autowired
    private ProducttRepository productRepository;

    @Autowired
    private UserrRepository userRepository;

    public static void main(String[] args) {
        SpringApplication.run(ShopForHomeApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {
        // Adding sample products
        productRepository.save(new Productt("Laptop", 999.99));
        productRepository.save(new Productt("Smartphone", 499.99));
        productRepository.save(new Productt("Tablet", 299.99));
        productRepository.save(new Productt("Headphones", 79.99));
        productRepository.save(new Productt("Smartwatch", 199.99));

        // Adding sample users
        userRepository.save(new Userr("user1@example.com", "pass123", "pass123", "Admin"));
        userRepository.save(new Userr("user2@example.com", "secure456", "secure456", "Customer"));
        userRepository.save(new Userr("user3@example.com", "password789", "password789", "Employee"));
        userRepository.save(new Userr("user4@example.com", "testpass", "testpass", "Customer"));
        userRepository.save(new Userr("user5@example.com", "demo1234", "demo1234", "Employee"));
    }
}
