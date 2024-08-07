package com.example.shopforhome.controller;

import com.example.shopforhome.entity.Cart;
import com.example.shopforhome.entity.CartItem;
import com.example.shopforhome.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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
    public ResponseEntity<Cart> addItemToCart(@PathVariable Long userId, @RequestBody CartItem cartItem) {
        Cart updatedCart = cartService.addItemToCart(userId, cartItem);
        return ResponseEntity.ok(updatedCart);
    }

    @GetMapping("/price/{userId}")
    public ResponseEntity<Double> calculateTotalPrice(@PathVariable Long userId) {
        double totalPrice = cartService.calculateTotalPrice(userId);
        return ResponseEntity.ok(totalPrice);
    }

    @PutMapping("/{userId}/quantity/{productId}")
    public ResponseEntity<Cart> updateQuantity(@PathVariable Long userId, @PathVariable Long productId, @RequestParam int quantityChange) {
        Cart updatedCart = cartService.updateQuantity(userId, productId, quantityChange);
        if (updatedCart != null) {
            return ResponseEntity.ok(updatedCart);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{userId}/clear")
    public ResponseEntity<Cart> clearCart(@PathVariable Long userId) {
        Cart clearedCart = cartService.clearCart(userId);
        if (clearedCart != null) {
            return ResponseEntity.ok(clearedCart);
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}
