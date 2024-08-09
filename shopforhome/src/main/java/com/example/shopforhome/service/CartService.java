package com.example.shopforhome.service;

import com.example.shopforhome.entity.Cart;
import com.example.shopforhome.entity.CartItem;
import com.example.shopforhome.entity.User;
import com.example.shopforhome.repository.CartRepository;
import com.example.shopforhome.repository.ProductRepository;
import com.example.shopforhome.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class CartService {

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private UserRepository userRepository;

    public Cart getCartByUserId(Long userId) {
        return cartRepository.findByUserId(userId)
                .orElseGet(() -> {
                    User user = userRepository.findById(userId)
                            .orElseThrow(() -> new RuntimeException("User not found"));

                    Cart newCart = new Cart();
                    newCart.setUser(user);
                    newCart.setPrice(0.0);

                    return cartRepository.save(newCart);
                });
    }

    public Cart addItem(Long userId, CartItem cartItem) {
        Cart cart = getCartByUserId(userId);

        Optional<CartItem> existingCartItem = cart.getItems().stream()
                .filter(item -> item.getProduct().getId().equals(cartItem.getProduct().getId()))
                .findFirst();

        if (existingCartItem.isPresent()) {
            CartItem item = existingCartItem.get();
            item.setQuantity(item.getQuantity() + cartItem.getQuantity());
            item.setPrice(item.getProduct().getPrice() * item.getQuantity());
        } else {
            cartItem.setCart(cart);
            cartItem.setPrice(cartItem.getProduct().getPrice() * cartItem.getQuantity());
            cart.getItems().add(cartItem);
        }

        cart.setPrice(cart.getItems().stream()
                .mapToDouble(CartItem::getPrice)
                .sum());

        return cartRepository.save(cart);
    }

    public Cart updateQuantity(Long userId, Long productId, int quantity) {
        Cart cart = getCartByUserId(userId);

        cart.getItems().stream()
                .filter(item -> item.getProduct().getId().equals(productId))
                .findFirst()
                .ifPresent(item -> {
                    item.setQuantity(quantity);
                    item.setPrice(item.getProduct().getPrice() * quantity);
                    if (quantity <= 0) {
                        cart.getItems().remove(item);
                    }
                });

        cart.setPrice(cart.getItems().stream()
                .mapToDouble(CartItem::getPrice)
                .sum());

        return cartRepository.save(cart);
    }

    public Cart removeItem(Long userId, Long productId) {
        Cart cart = getCartByUserId(userId);

        cart.getItems().removeIf(item -> item.getProduct().getId().equals(productId));

        cart.setPrice(cart.getItems().stream()
                .mapToDouble(CartItem::getPrice)
                .sum());

        return cartRepository.save(cart);
    }

    public double totalPrice(Long userId) {
        Cart cart = getCartByUserId(userId);

        return cart.getItems().stream()
                .mapToDouble(item -> item.getProduct().getPrice() * item.getQuantity())
                .sum();
    }
}
