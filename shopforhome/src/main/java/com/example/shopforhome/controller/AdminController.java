package com.example.shopforhome.controller;

import com.example.shopforhome.dto.ProductPutByIdDTO;
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

@RestController
@RequestMapping("/api/admin")
public class AdminController {

    @Autowired
    private UserService userService;

    @Autowired
    private ProductService productService;

    @PostMapping("/upload")
    public Map<String, String> handleFileUpload(@RequestParam("file") MultipartFile file) {
        Map<String, String> response = new HashMap<>();

        try (BufferedReader reader = new BufferedReader(new InputStreamReader(file.getInputStream()))) {
            // Skip the header line
            String line = reader.readLine();

            while ((line = reader.readLine()) != null) {
                String[] fields = line.split(",");

                if (fields.length == 5) {
                    ProductPutByIdDTO product = new ProductPutByIdDTO();
                    product.setName(fields[0]);
                    product.setCategory(fields[1]);
                    product.setPrice(Double.parseDouble(fields[2]));
                    product.setStock(Integer.parseInt(fields[3]));
                    product.setImageUrl(fields[4]);
                    productService.addProduct(product);
                }
            }

            response.put("status", "success");
            response.put("message", "File uploaded and processed successfully.");
        } catch (IOException e) {
            response.put("status", "error");
            response.put("message", "File upload failed: " + e.getMessage());
        } catch (NumberFormatException e) {
            response.put("status", "error");
            response.put("message", "Failed to parse numerical values: " + e.getMessage());
        }

        return response;
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
