package com.example.shopforhome.service;

//import com.example.shopforhome.Repository.WishListRepository;
//import com.example.shopforhome.entity.CartItem;
//import com.example.shopforhome.entity.User;
//import com.example.shopforhome.entity.WishList;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//
//import java.util.List;
//import java.util.Optional;
//
//@Service
//public class WishListService {
//
//    @Autowired
//    private WishListRepository wishListRepository;
//
//
//    public Optional<WishList> findByUserUsername(String username) {
//        return wishListRepository.findByUserUsername(username);
//    }
//
//    public List<CartItem> getCartItemsByUsername(String username) {
//        Optional<WishList> wishList = findByUserUsername(username);
//        return wishList.get().getItems();
//    }
//}
