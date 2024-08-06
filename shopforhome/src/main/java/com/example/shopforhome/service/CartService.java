package com.example.shopforhome.service;

import com.example.shopforhome.Repository.CartItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartService {

    @Autowired
    private CartItemRepository cartItemRepository;

}
