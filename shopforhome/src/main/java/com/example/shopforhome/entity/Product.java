package com.example.shopforhome.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String category;
    private double price;
    private int stock;
    private String imageUrl;

//    @ManyToMany(mappedBy = "cart")
//    private Set<Cart> carts;

//    @ManyToMany(mappedBy = "wishlist")
//    private Set<Wishlist> usersInWishlist;
}
