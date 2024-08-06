package com.example.shopforhome.service;

import com.example.shopforhome.dto.CartDTO;
import com.example.shopforhome.dto.CartItemDTO;
import com.example.shopforhome.entity.Cart;
import com.example.shopforhome.entity.CartItem;
import com.example.shopforhome.entity.Product;
import com.example.shopforhome.entity.User;
import com.example.shopforhome.repository.CartRepository;
import com.example.shopforhome.repository.ProductRepository;
import com.example.shopforhome.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CartService {

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ProductRepository productRepository;

    public CartDTO getCartByUserId(Long userId) {
        User user = userRepository.findById(userId).orElse(null);
        if (user == null) {
            return null;
        }

        Cart cart = cartRepository.findByUserId(userId).orElse(null);
        if (cart == null) {
            cart = new Cart();
            cart.setUser(user);
            cart.setTotalPrice(0.0);
            cart = cartRepository.save(cart);
        }

        return mapToDTO(cart);
    }

    public CartDTO addItem(Long userId, Long productId, int quantity) {
        Cart cart = cartRepository.findByUserId(userId).orElse(null);
        if (cart == null) {
            return null;
        }

        Product product = productRepository.findById(productId).orElse(null);
        if (product == null) {
            return null;
        }

        CartItem cartItem = cart.getItems().stream()
                .filter(item -> item.getProduct().getId().equals(productId))
                .findFirst()
                .orElse(new CartItem());

        if (cartItem.getId() == null) {
            cartItem.setCart(cart);
            cartItem.setProduct(product);
            cart.getItems().add(cartItem);
        }

        cartItem.setQuantity(cartItem.getQuantity() + quantity);
        cartItem.setPrice(product.getPrice().doubleValue());

        cart.setTotalPrice(cart.getTotalPrice() + product.getPrice().doubleValue() * quantity);
        cart = cartRepository.save(cart);

        return mapToDTO(cart);
    }

    public CartDTO removeItem(Long userId, Long productId) {
        Cart cart = cartRepository.findByUserId(userId).orElse(null);
        if (cart == null) {
            return null;
        }

        CartItem cartItem = cart.getItems().stream()
                .filter(item -> item.getProduct().getId().equals(productId))
                .findFirst()
                .orElse(null);

        if (cartItem == null) {
            return null;
        }

        cart.setTotalPrice(cart.getTotalPrice() - cartItem.getPrice() * cartItem.getQuantity());
        cart.getItems().remove(cartItem);
        cart = cartRepository.save(cart);

        return mapToDTO(cart);
    }

    public CartDTO updateQuantity(Long userId, Long productId, int quantity) {
        Cart cart = cartRepository.findByUserId(userId).orElse(null);
        if (cart == null) {
            return null;
        }

        CartItem cartItem = cart.getItems().stream()
                .filter(item -> item.getProduct().getId().equals(productId))
                .findFirst()
                .orElse(null);

        if (cartItem == null) {
            return null;
        }

        cart.setTotalPrice(cart.getTotalPrice() - cartItem.getPrice() * cartItem.getQuantity());
        cartItem.setQuantity(quantity);
        cart.setTotalPrice(cart.getTotalPrice() + cartItem.getPrice() * quantity);
        cart = cartRepository.save(cart);

        return mapToDTO(cart);
    }

    public double totalPrice(Long userId) {
        Cart cart = cartRepository.findByUserId(userId).orElse(null);
        if (cart == null) {
            return 0.0;
        }

        return cart.getItems().stream()
                .mapToDouble(item -> item.getPrice() * item.getQuantity())
                .sum();
    }

    public void clearCart(Long userId) {
        Cart cart = cartRepository.findByUserId(userId).orElse(null);
        if (cart != null) {
            cart.getItems().clear();
            cart.setTotalPrice(0.0);
            cartRepository.save(cart);
        }
    }

    private CartDTO mapToDTO(Cart cart) {
        List<CartItemDTO> items = cart.getItems().stream().map(this::mapToDTO).collect(Collectors.toList());
        return new CartDTO(cart.getId(), cart.getUser().getId(), items, cart.getTotalPrice());
    }

    private CartItemDTO mapToDTO(CartItem cartItem) {
        return new CartItemDTO(cartItem.getId(), cartItem.getProduct().getId(), cartItem.getQuantity(), cartItem.getPrice());
    }
}
