package com.example.shopforhome.service;

import com.example.shopforhome.entity.Productt;
import com.example.shopforhome.repository.ProducttRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProducttService {
    @Autowired
    private ProducttRepository productRepository;

    public void addProduct(Productt product) {
        productRepository.save(product);
    }

    public List<Productt> getAllProducts() {
        return productRepository.findAll();
    }

    public Productt searchProductById(int id) {
        return productRepository.findById(id).orElse(null);
    }

    public void deleteProductById(int id) {
        productRepository.deleteById(id);
    }

    public void deleteAllProducts() {
        productRepository.deleteAll();
    }

    public void updateProduct(Productt product) {
        productRepository.save(product);
    }
}
