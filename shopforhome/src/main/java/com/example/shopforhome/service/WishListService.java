package com.example.shopforhome.service;


import com.example.shopforhome.entity.User;
import com.example.shopforhome.entity.WishList;
import com.example.shopforhome.entity.WishListItem;
import com.example.shopforhome.repository.ProductRepository;
import com.example.shopforhome.repository.UserRepository;
import com.example.shopforhome.repository.WishListRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class WishListService {

    @Autowired
    private WishListRepository wishListRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ProductRepository productRepository;

    /**
     * Get all items in wish list
     * @param userId
     * @return
     */
    public WishList getAllItems(Long userId) {
        return wishListRepository.findByUserId(userId)
                .orElseGet(() -> {
                    User user = userRepository.findById(userId)
                            .orElseThrow(() -> new RuntimeException("User not found"));
                    WishList newWishList = new WishList();
                    newWishList.setUser(user);
                    return wishListRepository.save(newWishList);
                });
    }

    /**
     * Add item to wish list
     * @param userId
     * @param productId
     * @return
     */
    public WishList addItem(Long userId, Long productId) {
        WishList wishList = getAllItems(userId);

        Optional<WishListItem> existingItem = wishList.getItems().stream()
                .filter(item -> item.getProduct().getId().equals(productId))
                .findFirst();

        if (existingItem.isPresent()) {
            return wishList;
        } else {
            WishListItem item = new WishListItem();
            item.setProduct(productRepository.findById(productId)
                    .orElseThrow(() -> new RuntimeException("Product not found")));
            item.setWishList(wishList);
            wishList.getItems().add(item);
        }

        return wishListRepository.save(wishList);
    }

    /**
     * Remove item from wish list
     * @param userId
     * @param wishItemId
     * @return
     */
    public WishList removeItem(Long userId, Long wishItemId) {
        WishList wishList = getAllItems(userId);
        wishList.getItems().removeIf(item -> item.getId().equals(wishItemId));
        return wishListRepository.save(wishList);
    }
}
