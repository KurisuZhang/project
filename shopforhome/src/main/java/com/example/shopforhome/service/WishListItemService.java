package com.example.shopforhome.service;

import com.example.shopforhome.repository.WishListItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WishListItemService {

    @Autowired
    private WishListItemRepository wishListItemRepository;
}
