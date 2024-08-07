package com.example.shopforhome.service;

import com.example.shopforhome.entity.Cart;
import com.example.shopforhome.entity.CartItem;
import com.example.shopforhome.repository.CartRepository;
import com.example.shopforhome.repository.ProductRepository;
import com.example.shopforhome.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartService {

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ProductRepository productRepository;

    public Cart getCartByUserId(Long userId) {
        return cartRepository.findByUserId(userId)
                .orElseThrow(() -> new RuntimeException("Cart not found for user id: " + userId));
    }

    public Cart addItemToCart(Long userId, CartItem cartItem) {
        Cart cart = getCartByUserId(userId);

        // Associate the cart item with the cart
        cartItem.setCart(cart);
        cart.getItems().add(cartItem);

        // Save the cart
        return cartRepository.save(cart);
    }

    public double calculateTotalPrice(Long userId) {
        Cart cart = getCartByUserId(userId);
        return cart.getItems().stream()
                .mapToDouble(item -> item.getQuantity()* item.getPrice())
                .sum();
    }

    public Cart updateQuantity(Long userId, Long productId, int quantityChange) {
        Cart cart = getCartByUserId(userId);

        if (cart != null) {
            CartItem cartItem = cart.getItems().stream()
                    .filter(item -> item.getProduct().getId().equals(productId))
                    .findFirst()
                    .orElse(null);

            if (cartItem != null) {
                int newQuantity = cartItem.getQuantity() + quantityChange;
                if (newQuantity <= 0) {
                    cart.getItems().remove(cartItem);
                } else {
                    cartItem.setQuantity(newQuantity);
                }

                return cartRepository.save(cart);
            }
        }

        return null;
    }

    public Cart clearCart(Long userId) {
        Cart cart = getCartByUserId(userId);

        if (cart != null) {
            cart.getItems().clear();
            return cartRepository.save(cart);
        }

        return null;
    }

}
