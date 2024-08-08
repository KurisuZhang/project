package com.example.shopforhome.controller.web;

import com.example.shopforhome.controller.ProductController;
import com.example.shopforhome.entity.Product;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Enumeration;
import java.util.List;


@Controller
public class webPageController {

    @Autowired
    private ProductController productController;

    @GetMapping("/")
    public String home(Model model, HttpSession session) {
        // Print all session attributes
        Enumeration<String> attributeNames = session.getAttributeNames();
        while (attributeNames.hasMoreElements()) {
            String attributeName = attributeNames.nextElement();
            System.out.println("Session Attribute - Name: " + attributeName + ", Value: " + session.getAttribute(attributeName));
        }

        // Your existing code
        List<Product> products = productController.getAllProducts();
        model.addAttribute("products", products);

        return "/pages/home";
    }

    @GetMapping("/cart")
    public String cart(Model model) {
        List<Product> products = productController.getAllProducts();
        model.addAttribute("products", products);
        return "./pages/cart";
    }


}


