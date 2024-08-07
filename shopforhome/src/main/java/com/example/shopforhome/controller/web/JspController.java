package com.example.shopforhome.controller.web;

import com.example.shopforhome.entity.Productt;
import com.example.shopforhome.service.ProducttService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/api/page")
public class JspController {

    @GetMapping("/welcome")
    public String home(Model model) {
        RestTemplate restTemplate = new RestTemplate();
        List<Map<String, Object>> products = restTemplate.getForObject("https://fakestoreapi.com/products", List.class);
        model.addAttribute("products", products);
        return "login";
    }

    @RestController
    @RequestMapping("/api")
    public static class ProducttController {
        @Autowired
        private ProducttService productService;

        @PostMapping("/addProducts")
        public ResponseEntity<String> addProduct(@RequestBody Productt product) {
            productService.addProduct(product);
            return ResponseEntity.ok("Product added successfully");
        }

        @GetMapping("/allProducts")
        public ResponseEntity<List<Productt>> getAllProducts() {
            return ResponseEntity.ok(productService.getAllProducts());
        }

        @GetMapping("/searchProducts")
        public ResponseEntity<Productt> searchProduct(@RequestParam int id) {
            Productt product = productService.searchProductById(id);
            if (product != null) {
                return ResponseEntity.ok(product);
            }
            return ResponseEntity.status(404).body(null);
        }

        @DeleteMapping("/deleteProducts")
        public ResponseEntity<String> deleteProduct(@RequestParam int id) {
            productService.deleteProductById(id);
            return ResponseEntity.ok("Product deleted successfully");
        }

        @DeleteMapping("/deleteAllProducts")
        public ResponseEntity<String> deleteAllProducts() {
            productService.deleteAllProducts();
            return ResponseEntity.ok("All products deleted successfully");
        }

        @PutMapping("/updateProduct")
        public ResponseEntity<String> updateProduct(@RequestBody Productt product) {
            productService.updateProduct(product);
            return ResponseEntity.ok("Product updated successfully");
        }

        @GetMapping("/deleteProducts/{id}")
        public ModelAndView deleteProductByID(@PathVariable int id) {
            productService.deleteProductById(id);
            ModelAndView modelAndView = new ModelAndView();
            modelAndView.setViewName("redirect:/master");
            return modelAndView;
        }

    }
}
