package com.example.shopforhome.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
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

    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonIgnore
    private List<CartItem> cartItems;

    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonIgnore
    private List<WishListItem> wishListItems;

    @Override
    public String toString() {
        return "Product{" +
               "id=" + id +
               ", name='" + name + '\'' +
               ", category='" + category + '\'' +
               ", price=" + price +
               ", stock=" + stock +
               ", imageUrl='" + imageUrl + '\'' +
               '}';
    }

}

