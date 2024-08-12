package com.example.shopforhome.controller;

import com.example.shopforhome.dto.ProductPutByIdDTO;
import com.example.shopforhome.entity.Product;
import com.example.shopforhome.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private RestTemplate restTemplate;

    @GetMapping("/all")
    public List<Product> getAllProducts() {
        return productService.getAllProducts();
    }

    @GetMapping("/{id}")
    public Map<String, String> getProductById(@PathVariable Long id) {
        HashMap<String, String> response = new HashMap<>();
        Optional<Product> product = productService.getProductById(id);

        if (product.isPresent()) {
                response.put("status", "success");
                response.put("message", "Product found");
                response.put("id", product.get().getId().toString());
                response.put("name", product.get().getName());
                response.put("category", product.get().getCategory());
                response.put("price", String.valueOf(product.get().getPrice()));
                response.put("stock", String.valueOf(product.get().getStock()));
                response.put("imageUrl", product.get().getImageUrl());
        } else {
                response.put("status", "failure");
                response.put("message", "Product with ID " + id + " not found.");
        }

            return response;
    }

    @GetMapping("/category/{category}")
    public List<Product> getProductsByCategory(String category) {
        return productService.getProductsByCategory(category);
    }

    @PostMapping("/add")
    public Map<String, String> addProduct(@RequestBody ProductPutByIdDTO ProductPutByIdDTO) {
        Product savedProduct = productService.addProduct(ProductPutByIdDTO);
        Map<String, String> response = new HashMap<>();
        response.put("status", "success");
        response.put("message", "Product added successfully");
        response.put("id", savedProduct.getId().toString());

        // Get current date
        LocalDate startDate = LocalDate.now();
        // Construct report message
        String reportMessage = "Product saved with name: " + savedProduct.getName();
        // Construct URL for Report service
        String url = "http://reports/api/reports?startDate=" + startDate + "&reportMessage=" + reportMessage;
        // Send request to Report service
        restTemplate.postForEntity(url, null, String.class);


        return response;
    }

    @PutMapping("/{id}")
    public Map<String, String> updateProduct(@PathVariable Long id, @RequestBody ProductPutByIdDTO productPutByIdDTO) {
        Map<String, String> response = new HashMap<>();
        Optional<Product> updatedProduct = productService.updateProduct(id, productPutByIdDTO);

        if (updatedProduct.isPresent()) {
            response.put("status", "success");
            response.put("message", "Product updated successfully");
        } else {
            response.put("status", "failure");
            response.put("message", "Product with ID " + id + " not found.");
        }

        // Get current date
        LocalDate startDate = LocalDate.now();
        // Construct report message
        String reportMessage = "Product update with name: " + updatedProduct.get().getName();
        // Construct URL for Report service
        String url = "http://reports/api/reports?startDate=" + startDate + "&reportMessage=" + reportMessage;
        // Send request to Report service
        restTemplate.postForEntity(url, null, String.class);

        return response;
    }


    @DeleteMapping("/{id}")
    public Map<String, String> deleteProduct(@PathVariable Long id) {
        Map<String, String> response = new HashMap<>();

        boolean isDeleted = productService.deleteProduct(id);

        if (isDeleted) {
            response.put("status", "success");
            response.put("message", "Product deleted successfully");
        } else {
            response.put("status", "failure");
            response.put("message", "Product with ID " + id + " not found.");
        }
        // Get current date
        LocalDate startDate = LocalDate.now();
        // Construct report message
        String reportMessage = "Product delete with id: " + id;;
        // Construct URL for Report service
        String url = "http://reports/api/reports?startDate=" + startDate + "&reportMessage=" + reportMessage;
        // Send request to Report service
        restTemplate.postForEntity(url, null, String.class);
        return response;
    }

    @GetMapping("/search")
    public List<Product> searchProducts(@RequestParam String name) {
        return productService.searchProducts(name);
    }

    @GetMapping("/sort")
    public List<Product> sortProducts(@RequestParam boolean ascending) {
        return productService.sortProductsByPrice(ascending);
    }

    public List<Product> findProductsWithLowStock(int num) {
        return productService.findProductsWithLowStock(num);
    }
}
