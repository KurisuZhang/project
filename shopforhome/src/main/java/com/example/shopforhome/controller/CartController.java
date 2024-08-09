package com.example.shopforhome.controller;

import com.example.shopforhome.entity.Cart;
import com.example.shopforhome.entity.CartItem;
import com.example.shopforhome.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/cart")
public class CartController {

    @Autowired
    private CartService cartService;

    @GetMapping("/{userId}")
    public ResponseEntity<Cart> getCartByUserId(@PathVariable Long userId) {
        Cart cart = cartService.getCartByUserId(userId);
        return ResponseEntity.ok(cart);
    }

    @PutMapping("/{userId}")
    public Map<String, String> addItem(@PathVariable Long userId, @RequestBody CartItem cartItem) {
        Cart updatedCart = cartService.addItem(userId, cartItem);
        Map<String, String> response = new HashMap<>();
        response.put("status", "success");
        response.put("message", "Item added to cart successfully");
        response.put("userId", userId.toString());
        return response;
    }

    @PutMapping("/{userId}/quantity/{productId}")
    public Map<String, String> updateQuantity(@PathVariable Long userId, @PathVariable Long productId, @RequestParam int quantity) {
        Cart updatedCart = cartService.updateQuantity(userId, productId, quantity);
        Map<String, String> response = new HashMap<>();
        if (updatedCart != null) {
            response.put("status", "success");
            response.put("message", "Quantity updated successfully");
        } else {
            response.put("status", "failure");
            response.put("message", "Failed to update quantity");
        }
        return response;
    }

    @DeleteMapping("/{userId}/item/{productId}")
    public Map<String, String> removeItem(@PathVariable Long userId, @PathVariable Long productId) {
        Cart updatedCart = cartService.removeItem(userId, productId);
        Map<String, String> response = new HashMap<>();
        if (updatedCart != null) {
            response.put("status", "success");
            response.put("message", "Item removed from cart successfully");
        } else {
            response.put("status", "failure");
            response.put("message", "Failed to remove item from cart");
        }
        return response;
    }

    @GetMapping("/price/{userId}")
    public Map<String, String> totalPrice(@PathVariable Long userId) {
        double totalPrice = cartService.totalPrice(userId);
        Map<String, String> response = new HashMap<>();
        response.put("status", "success");
        response.put("totalPrice", String.valueOf(totalPrice));
        return response;
    }
}
