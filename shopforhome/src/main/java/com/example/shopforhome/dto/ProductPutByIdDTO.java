package com.example.shopforhome.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductPutByIdDTO {
    private String name;
    private String category;
    private double price;
    private int stock;
    private String imageUrl;
}
