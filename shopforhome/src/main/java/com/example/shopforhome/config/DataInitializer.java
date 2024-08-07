package com.example.shopforhome.config;

import com.example.shopforhome.entity.Cart;
import com.example.shopforhome.entity.CartItem;
import com.example.shopforhome.entity.Product;
import com.example.shopforhome.entity.User;
import com.example.shopforhome.repository.CartItemRepository;
import com.example.shopforhome.repository.CartRepository;
import com.example.shopforhome.repository.ProductRepository;
import com.example.shopforhome.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.util.Arrays;

@Component
public class DataInitializer implements CommandLineRunner {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private CartItemRepository cartItemRepository;
    @Autowired
    private CartRepository cartRepository;


    @Override
    public void run(String... args) throws Exception {

        User user1 = new User();
        user1.setUsername("user1");
        user1.setPassword("123");
        user1.setRole("ROLE_USER");
        userRepository.save(user1);

        User admin = new User();
        admin.setUsername("admin");
        admin.setPassword("123");
        admin.setRole("ROLE_ADMIN");
        userRepository.save(admin);

        User user2 = new User();
        user2.setUsername("user2");
        user2.setPassword("123");
        user2.setRole("ROLE_VIP");
        userRepository.save(user2);

        Product product1 = new Product();
        product1.setName("ring");
        product1.setCategory("jewelery");
        product1.setPrice(10.99);
        product1.setStock(50);
        product1.setImageUrl("https://fakestoreapi.com/img/51UDEzMJVpL._AC_UL640_QL65_ML3_.jpg");
        productRepository.save(product1);

        Product product2 = new Product();
        product2.setName("hard disk");
        product2.setCategory("electronics");
        product2.setPrice(64.0);
        product2.setStock(100);
        product2.setImageUrl("https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg");
        productRepository.save(product2);

        Product product3 = new Product();
        product3.setName("display");
        product3.setCategory("electronics");
        product3.setPrice(599.0);
        product3.setStock(100);
        product3.setImageUrl("https://fakestoreapi.com/img/81QpkIctqPL._AC_SX679_.jpg");
        productRepository.save(product3);

        Product product4 = new Product();
        product4.setName("Mens Casual");
        product4.setCategory("men's clothing");
        product4.setPrice(22.0);
        product4.setStock(100);
        product4.setImageUrl("https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg");
        productRepository.save(product4);

        Cart cart1 = new Cart();
        cart1.setUser(user1);
        cart1.setPrice(0);
        cart1.setItems(Arrays.asList());
        cartRepository.save(cart1);

        Cart cart2 = new Cart();
        cart2.setUser(admin);
        cart2.setPrice(3);
        cart2.setItems(Arrays.asList());
        cartRepository.save(cart2);

        CartItem cartItem1 = new CartItem();
        cartItem1.setProduct(product1);
        cartItem1.setQuantity(1);
        cartItem1.setPrice(3);
        cartItem1.setCart(cart1);
        cartItemRepository.save(cartItem1);

        CartItem cartItem2 = new CartItem();
        cartItem2.setProduct(product2);
        cartItem2.setQuantity(2);
        cartItem2.setPrice(3);
        cartItem2.setCart(cart1);
        cartItemRepository.save(cartItem2);


        CartItem cartItem3 = new CartItem();
        cartItem3.setProduct(product2);
        cartItem3.setQuantity(2);
        cartItem3.setPrice(3);
        cartItem3.setCart(cart2);
        cartItemRepository.save(cartItem3);

        CartItem cartItem4 = new CartItem();
        cartItem4.setProduct(product3);
        cartItem4.setQuantity(2);
        cartItem4.setPrice(3);
        cartItem4.setCart(cart2);
        cartItemRepository.save(cartItem4);

        CartItem cartItem5 = new CartItem();
        cartItem5.setProduct(product4);
        cartItem5.setQuantity(2);
        cartItem5.setPrice(3);
        cartItem5.setCart(cart2);
        cartItemRepository.save(cartItem5);


        cart1.setItems(Arrays.asList(cartItem1,cartItem2));
        cartRepository.save(cart1);
        cart2.setItems(Arrays.asList(cartItem3,cartItem4,cartItem5));
        cartRepository.save(cart2);



    }
}
