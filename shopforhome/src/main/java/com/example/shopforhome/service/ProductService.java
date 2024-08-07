package com.example.shopforhome.service;

import com.example.shopforhome.Repository.ProductRepository;
import com.example.shopforhome.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.GsonBuilderUtils;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;
import java.util.Optional;

@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    public Optional<Product> getProductById(Long id) {
        return productRepository.findById(id);
    }

    public List<Product> getProductsByCategory(String category) {
        return productRepository.findByCategory(category);
    }

    public Product addProduct(Product product) {
        return productRepository.save(product);
    }

    public Optional<Product> updateProduct(Long id, Product productDetails) {
        return productRepository.findById(id).map(product -> {
            product.setName(productDetails.getName());
            product.setCategory(productDetails.getCategory());
            product.setPrice(productDetails.getPrice());
            product.setStock(productDetails.getStock());
            product.setImageUrl(productDetails.getImageUrl());
            return productRepository.save(product);
        });
    }

    public boolean deleteProduct(Long id) {
         if(productRepository.existsById(id)) {
             productRepository.deleteById(id);
             System.out.println("inside service true.");
             return true;
         }
        return false;
    }

    public List<Product> searchProducts(String name) {
        return productRepository.findByNameContaining(name);
    }

    public List<Product> sortProductsByPrice(boolean ascending) {
        List<Product> products = productRepository.findAll();
        Comparator<Product> comparator = Comparator.comparing(Product::getPrice, Comparator.nullsFirst(Double::compareTo));
        products.sort(ascending ? comparator : comparator.reversed());
        return products;
    }
}

