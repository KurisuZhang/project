package com.example.shopforhome.controller.web;

import com.example.shopforhome.controller.ProductController;
import com.example.shopforhome.entity.Product;
import com.example.shopforhome.entity.User;
//import com.example.shopforhome.entity.User;
import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Map;


@Controller
public class webPageController {

    @Autowired
    private ProductController productController;

    @GetMapping("/login")
    public String getLogin(HttpSession session, Model model) {
        // Get username and password from session and add to the model
        String username = (String) session.getAttribute("username");
        String password = (String) session.getAttribute("password");
        String role = (String) session.getAttribute("role");

        if (username != null) {
            model.addAttribute("username", username);
            model.addAttribute("password", password);
            session.removeAttribute("password");
        }
        return "login";
    }

    @GetMapping("/register")
    public String getRegister(Model model) {
        return "register";
    }

    @GetMapping("/welcome")
    public String getWelcome(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");

        if (user != null) {
            model.addAttribute("user", user);
        }
//        RestTemplate restTemplate = new RestTemplate();
//        List<Map<String, Object>> products = restTemplate.getForObject("https://fakestoreapi.com/products", List.class);
//        model.addAttribute("products", products);
        return "welcome";
    }

    @GetMapping("/")
    public String home(Model model) {
        List<Product> products = productController.getAllProducts();
        model.addAttribute("products", products);
        return "home";  
    }
}


