package com.example.shopforhome.dto;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartItemDTO {
    private Long id;
    private Long userId;
    private Long productId;
    private int quantity;
}
