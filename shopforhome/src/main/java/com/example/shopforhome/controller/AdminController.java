package com.example.shopforhome.controller;

import com.example.shopforhome.entity.User;
import com.example.shopforhome.service.ProductService;
import com.example.shopforhome.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/admin")
public class AdminController {

    @Autowired
    private UserService userService;

    @Autowired
    private ProductService productService;

    @PostMapping("/upload")
    public Map<String, String> handleFileUpload(@RequestParam("file") MultipartFile file) {

        Map<String, String> hashMap = new HashMap();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(file.getInputStream()))) {
            String fileContent = reader.lines().collect(Collectors.joining("\n"));
            hashMap.put("data",fileContent);
        } catch (IOException e) {
            hashMap.put("data","failed");
            return hashMap;
        }
        return hashMap;
    }

    @GetMapping("/create/user/{username}/{password}")
    public String handleCreateUser(@PathVariable("username") String username, @PathVariable("password") String password) {
        Optional<User> byUsername = userService.findByUsername(username);
        if (byUsername.isPresent()){
            return "username already exist";
        }else{
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            userService.save(user);
            return "success";
        }
    }

    @GetMapping("/update/user/{username}/{password}")
    public String handleUpdateUser(@PathVariable("username") String username, @PathVariable("password") String password) {

        Optional<User> byUsername = userService.findByUsername(username);
        if (byUsername.isPresent()){
            userService.deleteByUsername(username);
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            userService.save(user);
            return "success";
        }else {
            return "username not found";
        }

    }

    @GetMapping("/delete/user/{username}")
    public String handleDeleteUser(@PathVariable("username") String username) {

        Optional<User> byUsername = userService.findByUsername(username);
        if (byUsername.isPresent()){
            userService.deleteByUsername(username);
            return "success";
        }else {
            return "username not found";
        }
    }

}
