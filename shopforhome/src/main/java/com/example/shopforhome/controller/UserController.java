package com.example.shopforhome.controller;

import com.example.shopforhome.dto.LoginRequestDTO;
import com.example.shopforhome.dto.RegisterUserDTO;
import com.example.shopforhome.entity.User;
import com.example.shopforhome.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api/user")
public class UserController {

    @Autowired
    private UserService userService;


    // post login
    @PostMapping("/login")
    public ResponseEntity<String> login(@RequestBody LoginRequestDTO loginRequestDTO) {

        Optional<User> optionalUser = userService.findByUsername(loginRequestDTO.getUsername());
        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            if (loginRequestDTO.getPassword().equals(user.getPassword())) {
                return ResponseEntity.ok(user.getUsername()+"`"+user.getRole());
            } else {
                return ResponseEntity.status(401).body("Statue\", \"Password is Wrong\""); // Unauthorized
            }
        } else {
            return ResponseEntity.status(404).body("Statue\", \"User does not exist"); // Not Found
        }
    }

    // post register
    @PostMapping("/register")
    public Map<String, String> register(@RequestBody RegisterUserDTO registerUserDTO) {

        Map<String, String> hashMap = new HashMap<>();

        User user = new User();
        user.setUsername(registerUserDTO.getUsername());
        user.setPassword(registerUserDTO.getPassword());
        user.setRole(registerUserDTO.getRole());
        userService.save(user);

        hashMap.put("statue","successful register");
        hashMap.put("userName",user.getUsername());
        hashMap.put("role", user.getRole());
        return hashMap;
    }

}
