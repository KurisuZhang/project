package com.example.shopforhome.controller.web;

import com.example.shopforhome.entity.Userr;
import com.example.shopforhome.service.UserrService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;

@Controller
@RequestMapping("/api")
public class UserrController {

    @Autowired
    private UserrService userService;

    @PostMapping("/signUp")
    public ModelAndView signUp(@ModelAttribute Userr user, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        if (!user.getPassword().equals(user.getConfirmPassword())) {
            modelAndView.addObject("errorMessage", "Passwords do not match");
            modelAndView.setViewName("register");
            return modelAndView;
        }
        userService.signUp(user);
        session.setAttribute("email", user.getEmail());
        session.setAttribute("password", user.getPassword());
        session.setAttribute("role", user.getRole());
        modelAndView.setViewName("redirect:/login");
        return modelAndView;
    }

    @PostMapping("/login")
    public ModelAndView login(@ModelAttribute Userr user, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        Userr loggedInUser = userService.login(user.getEmail(), user.getPassword());
        if (loggedInUser != null) {
            modelAndView.setViewName("redirect:/welcome");
            session.setAttribute("user", loggedInUser);
        } else {
            modelAndView.addObject("errorMessage", "Invalid email or password");
            modelAndView.setViewName("login");
        }
        return modelAndView;
    }

    @GetMapping("/delete/{email}")
    public ModelAndView deleteUser(@PathVariable String email, HttpSession session) throws UnsupportedEncodingException {
        String decodedEmail = URLDecoder.decode(email, StandardCharsets.UTF_8);

        String role = (String) session.getAttribute("role");
        if (role.equals("Admin")){
            userService.deleteUser(decodedEmail);
        }

        ModelAndView modelAndView = new ModelAndView("redirect:/master");

        return modelAndView;
    }

    @GetMapping("/update/{email}")
    public ModelAndView showUpdateForm(@PathVariable String email, HttpSession session) throws UnsupportedEncodingException {

        String role = (String) session.getAttribute("role");
        ModelAndView modelAndView = new ModelAndView();

        if (role.equals("Admin")){
            String decodedEmail = URLDecoder.decode(email, StandardCharsets.UTF_8);
            Userr user = userService.findUser(decodedEmail); // Fetch user details based on email
            modelAndView.addObject("user", user);
            modelAndView.setViewName("update");
        }else {
            modelAndView.setViewName("redirect:/master");
        }
        return modelAndView;
    }

    @PostMapping("/update/{email}")
    public ModelAndView updateUser(@PathVariable String email, @ModelAttribute Userr user) throws UnsupportedEncodingException {
        String decodedEmail = URLDecoder.decode(email, StandardCharsets.UTF_8);
        userService.updateUser(decodedEmail, user);
        return new ModelAndView("redirect:/master");
    }
}



