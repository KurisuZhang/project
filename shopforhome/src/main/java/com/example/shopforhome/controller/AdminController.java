package com.example.shopforhome.controller;

import com.example.shopforhome.service.ProductService;
import com.example.shopforhome.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;
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
}
