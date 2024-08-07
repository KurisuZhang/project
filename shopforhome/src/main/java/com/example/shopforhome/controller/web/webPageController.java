package com.example.shopforhome.controller.web;

import com.example.shopforhome.entity.User;
import com.example.shopforhome.entity.Userr;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Map;


@Controller
public class webPageController {

    @GetMapping("/login")
    public String getLogin(HttpSession session, Model model) {
        // Get email and password from session and add to the model
        String email = (String) session.getAttribute("email");
        String password = (String) session.getAttribute("password");
        String role = (String) session.getAttribute("role");

        if (email != null) {
            model.addAttribute("email", email);
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
        Userr user = (Userr) session.getAttribute("user");

        if (user != null) {
            model.addAttribute("user", user);
        }
//        RestTemplate restTemplate = new RestTemplate();
//        List<Map<String, Object>> products = restTemplate.getForObject("https://fakestoreapi.com/products", List.class);
//        model.addAttribute("products", products);
        return "welcome";
    }
}


