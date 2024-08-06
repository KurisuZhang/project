package com.example.shopforhome.controller;

import com.example.shopforhome.config.jwt.JwtUtil;
import com.example.shopforhome.dto.LoginRequestDTO;
import com.example.shopforhome.dto.RegisterUserDTO;
import com.example.shopforhome.entity.User;
import com.example.shopforhome.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api/user")
public class UserController {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private JwtUtil jwtUtil;

    @Autowired
    private UserService userService;

    @Autowired
    public PasswordEncoder passwordEncoder;

    // post login
    @PostMapping("/login")
    public Map<String, Object> login(@RequestBody LoginRequestDTO loginRequestDTO) {

//        HashMap<String, String> returnMap = new HashMap<>();
//
//        Optional<User> optionalUser = userService.findByUsername(loginRequestDTO.getUsername());
//        if (optionalUser.isPresent()){
//            User user = optionalUser.get();
//            if (passwordEncoder.matches(loginRequestDTO.getPassword(), user.getPassword())){
//                returnMap.put("Statue", "Login Success");
//            } else {
//                returnMap.put("Statue", "Password is Wrong");
//            }
//        } else {
//            returnMap.put("statue", "User does not exist");
//        }
//        return returnMap;

        try {
            Authentication authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(loginRequestDTO.getUsername(), loginRequestDTO.getPassword())
            );

            Optional<User> user = userService.findByUsername(loginRequestDTO.getUsername());
            String role = user.get().getRole();
            HashMap<String, Object> returnMap = new HashMap<>();
            returnMap.put("Login", "Success");
            returnMap.put("jwt", jwtUtil.generateToken(loginRequestDTO.getUsername(), role));
            return returnMap;
        } catch (AuthenticationException e) {
            throw new RuntimeException("Invalid credentials");
        }


    }

    // post register
    @PostMapping("/register")
    public Map<String, String> register(@RequestBody RegisterUserDTO registerUserDTO) {

//        Map<String, String> hashMap = new HashMap<>();
//
//        User user = new User();
//        user.setUsername(registerUserDTO.getUsername());
//        user.setPassword(passwordEncoder.encode(registerUserDTO.getPassword()));
//        user.setRole(registerUserDTO.getRole());
//        userService.save(user);
//
//        hashMap.put("statue","successful register");
//        hashMap.put("userName",user.getUsername());
//        hashMap.put("role", user.getRole());
//        return hashMap;
        User user = new User();
        user.setUsername(registerUserDTO.getUsername());
        user.setPassword(passwordEncoder.encode(registerUserDTO.getPassword()));
        user.setRole(registerUserDTO.getRole());
        userService.save(user);
        Map<String, String> response = new HashMap<>();
        response.put("status", "success register");
        return response;
    }

    // post logout
    @DeleteMapping("/logout")
    public String logout() {
        return "logout success";
    }

}
