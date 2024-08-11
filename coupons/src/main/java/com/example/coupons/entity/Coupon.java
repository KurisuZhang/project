package com.example.coupons.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.HashMap;
import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Coupon {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ElementCollection
    @CollectionTable(name = "coupon_discounts", joinColumns = @JoinColumn(name = "coupon_id"))
    @MapKeyColumn(name = "coupon_name")
    @Column(name = "discount_percentage")
    private Map<String, Double> discounts = new HashMap<>();

    private String userRole;

    // Constructors, Getters and Setters

}
