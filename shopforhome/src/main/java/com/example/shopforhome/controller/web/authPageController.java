package com.example.shopforhome.controller.web;

import com.example.shopforhome.controller.UserController;
import com.example.shopforhome.dto.LoginRequestDTO;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Objects;

@Controller
public class authPageController {

    @Autowired
    UserController userController;

    @GetMapping("/login")
    public String login() {
        return "./auth/login";
    }

    @PostMapping("/login/Button")
    public ModelAndView loginButton(@ModelAttribute LoginRequestDTO loginRequestDTO, HttpSession session) {

        ModelAndView modelAndView = new ModelAndView();
        ResponseEntity<String> login = userController.login(loginRequestDTO);

        if (login.getStatusCode() == HttpStatus.OK){
            String[] split = Objects.requireNonNull(login.getBody()).split("`");
            session.setAttribute("user",split[0]);
            session.setAttribute("role",split[1]);
            session.setAttribute("userId",split[2]); // user id
            modelAndView.setViewName("redirect:/");
        }else {
            modelAndView.setViewName("/auth/login");
            String script = "Invalid username or password";
            modelAndView.addObject("error", script);
        }
        return modelAndView;
    }

    @GetMapping("/register")
    public String register() {
        return "./auth/register";
    }

    @GetMapping("/logout")
    public ModelAndView logout(HttpSession session) {
        session.invalidate();
        return new ModelAndView("redirect:/login");
    }

}
