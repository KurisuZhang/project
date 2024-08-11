package com.example.shopforhome.controller;


import com.example.shopforhome.entity.WishList;
import com.example.shopforhome.service.WishListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/wishlist")
public class WishListController {

    @Autowired
    private WishListService wishListService;

    //get all items
    @PostMapping("/all/{userId}")
    public ResponseEntity<WishList> all(@PathVariable Long userId) {
        WishList wishList = wishListService.getAllItems(userId);
        return ResponseEntity.ok(wishList);
    }

    /**
     * Add item to wishlist
     * @param userId
     * @param productId
     * @return
     */
    @PostMapping("/add/{userId}/{productId}")
    public Map<String, String> addItem(@PathVariable Long userId, @PathVariable Long productId) {
        WishList wishList = wishListService.addItem(userId, productId);
        Map<String, String> response = new HashMap<>();
        if (wishList != null) {
            response.put("status", "success");
            response.put("message", "Item added to wishlist successfully");
        } else {
            response.put("status", "failure");
            response.put("message", "Failed to add item to wishlist");
        }
        return response;
    }

    /**
     * Delete item from wishlist
     * @param userId
     * @param wishItemId
     * @return
     */
    @PostMapping("/delete/{userId}/{wishItemId}")
    public Map<String, String> deleteItem(@PathVariable Long userId, @PathVariable Long wishItemId) {
        WishList wishList = wishListService.removeItem(userId, wishItemId);
        Map<String, String> response = new HashMap<>();
        if (wishList != null) {
            response.put("status", "success");
            response.put("message", "Item removed from wishlist successfully");
        } else {
            response.put("status", "failure");
            response.put("message", "Failed to remove item from wishlist");
        }
        return response;
    }

}
