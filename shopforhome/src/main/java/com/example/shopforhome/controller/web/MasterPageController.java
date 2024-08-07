package com.example.shopforhome.controller.web;

import com.example.shopforhome.entity.Productt;
import com.example.shopforhome.entity.Userr;
import com.example.shopforhome.service.ProducttService;
import com.example.shopforhome.service.UserrService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class MasterPageController {

    @Autowired
    UserrService userService;
    @Autowired
    ProducttService productService;

    @GetMapping("/master")
    public ModelAndView masterModule(HttpSession session) {

        String email = (String) session.getAttribute("email");
        if (email == null) {
            return new ModelAndView("redirect:/login");
        }
        List<Userr> users = userService.getAllUsers();
        List<Productt> products = productService.getAllProducts();

        ModelAndView modelAndView = new ModelAndView("master");
        modelAndView.addObject("users", users);
        modelAndView.addObject("products", products);
        return modelAndView;
    }

}