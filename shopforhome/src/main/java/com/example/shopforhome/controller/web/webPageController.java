package com.example.shopforhome.controller.web;

import com.example.shopforhome.controller.ProductController;
import com.example.shopforhome.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;


@Controller
public class webPageController {

    @Autowired
    private ProductController productController;

    @GetMapping("/")
    public String home(Model model) {
        List<Product> products = productController.getAllProducts();
        model.addAttribute("products", products);
        return "home";
    }


}


