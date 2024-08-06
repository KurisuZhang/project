package com.example.shopforhome.Repository;

import com.example.shopforhome.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Long> {
}
