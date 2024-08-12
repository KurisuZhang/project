package com.example.shopforhome.service;

import com.example.shopforhome.dto.ProductPutByIdDTO;
import com.example.shopforhome.entity.Product;
import com.example.shopforhome.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
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

    public Product addProduct(ProductPutByIdDTO ProductPutByIdDTO) {
        Product product = new Product();
        product.setName(ProductPutByIdDTO.getName());
        product.setPrice(ProductPutByIdDTO.getPrice());
        product.setCategory(ProductPutByIdDTO.getCategory());
        product.setStock(ProductPutByIdDTO.getStock());
        product.setImageUrl(ProductPutByIdDTO.getImageUrl());
        return productRepository.save(product);
    }

    public Optional<Product> updateProduct(Long id, ProductPutByIdDTO productPutByIdDTO) {
        return productRepository.findById(id).map(product -> {
            product.setName(productPutByIdDTO.getName());
            product.setCategory(productPutByIdDTO.getCategory());
            product.setPrice(productPutByIdDTO.getPrice());
            product.setStock(productPutByIdDTO.getStock());
            product.setImageUrl(productPutByIdDTO.getImageUrl());
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
        return productRepository.findByNameContainingIgnoreCase(name);
    }

    public List<Product> sortProductsByPrice(boolean ascending) {
        List<Product> products = productRepository.findAll();
        Comparator<Product> comparator = Comparator.comparing(Product::getPrice, Comparator.nullsFirst(Double::compareTo));
        products.sort(ascending ? comparator : comparator.reversed());
        return products;
    }

    public List<Product> findProductsWithLowStock(int num) {
        List<Product> res =productRepository.findByStockLessThan(num);
        return res;
    }

}

