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
        product1.setName("Blue Pillow");
        product1.setCategory("pillow");
        product1.setPrice(10.99);
        product1.setStock(50);
        product1.setImageUrl("https://m.media-amazon.com/images/G/01/DiscoTec/2024/HomeLifestyle/HomeSummerFlip/Browse/Home_Flip_Summer_2024_1_Onsite_Bedding_NewNow_D_333x509._CB557801672_.jpg");
        productRepository.save(product1);

        Product product2 = new Product();
        product2.setName("Hillsby Oriental Indoor Rug");
        product2.setCategory("rug");
        product2.setPrice(64.0);
        product2.setStock(100);
        product2.setImageUrl("https://assets.wfcdn.com/im/21228098/resize-h416-w416%5Ecompr-r85/1714/171459248/Hillsby+Oriental+Indoor+Rug.jpg");
        productRepository.save(product2);

        Product product3 = new Product();
        product3.setName("Albion Oriental Indoor Rug");
        product3.setCategory("rug");
        product3.setPrice(599.0);
        product3.setStock(100);
        product3.setImageUrl("https://assets.wfcdn.com/im/97188764/resize-h416-w416%5Ecompr-r85/2212/221290429/Albion+Oriental+Indoor+Rug.jpg");
        productRepository.save(product3);

        Product product4 = new Product();
        product4.setName("Saur Bathroom Vanity");
        product4.setCategory("bathroom");
        product4.setPrice(1480.0);
        product4.setStock(100);
        product4.setImageUrl("https://assets.wfcdn.com/im/94870443/c_crop_resize_zoom-h624-w900%5Ecompr-r85/2271/227100581/default_name.jpg");
        productRepository.save(product4);

        Product product5 = new Product();
        product5.setName("Angelissa Bathroom Vanity");
        product5.setCategory("bathroom");
        product5.setPrice(1480.0);
        product5.setStock(100);
        product5.setImageUrl("https://assets.wfcdn.com/im/18832593/resize-h400-w400%5Ecompr-r85/2221/222161398/default_name.jpg");
        productRepository.save(product5);

        Product product6 = new Product();
        product6.setName("Braya Hydraulic Lift Up Storage Platform Bed");
        product6.setCategory("bed");
        product6.setPrice(3488.4);
        product6.setStock(20);
        product6.setImageUrl("https://assets.wfcdn.com/im/79121098/resize-h500-w500%5Ecompr-r85/2368/236866675/Braya+Hydraulic+Lift+Up+Storage+Upholstered+Platform+Bed.jpg");
        productRepository.save(product6);

        Product product7 = new Product();
        product7.setName("Alamar Tufted Storage Platform Bed");
        product7.setCategory("bed");
        product7.setPrice(2488.4);
        product7.setStock(60);
        product7.setImageUrl("https://assets.wfcdn.com/im/18342698/resize-h500-w500%5Ecompr-r85/7256/72561549/Alamar+Tufted+Upholstered+Storage+Platform+Bed.jpg");
        productRepository.save(product7);

        Product product8 = new Product();
        product8.setName("Rizzy Home Fringed Throw Pillow");
        product8.setCategory("pillow");
        product8.setPrice(48.9);
        product8.setStock(6);
        product8.setImageUrl("https://assets.wfcdn.com/im/88722670/resize-h755-w755%5Ecompr-r85/2321/232179326/Fringed+Throw+Pillow.jpg");
        productRepository.save(product8);

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
