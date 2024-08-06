package com.example.shopforhome.entity;
//
//import jakarta.persistence.*;
//import lombok.AllArgsConstructor;
//import lombok.Data;
//
//import lombok.NoArgsConstructor;
//
//
//import java.util.List;
//
//@Data
//@NoArgsConstructor
//@AllArgsConstructor
//@Entity
//public class WishList {
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    private Long id;
//
//    @OneToOne
//    private User user;
//
//    @OneToMany(mappedBy = "wishList")
//    private List<CartItem> items;
//
//}
