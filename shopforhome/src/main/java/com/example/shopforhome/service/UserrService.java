package com.example.shopforhome.service;

import com.example.shopforhome.entity.Userr;
import com.example.shopforhome.repository.UserrRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserrService {
    @Autowired
    private UserrRepository userRepository;

    public void signUp(Userr user) {
        userRepository.save(user);
    }

    public Userr login(String username, String password) {
        Userr user = userRepository.findById(username).orElse(null);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }

    public List<Userr> getAllUsers() {
        return userRepository.findAll();
    }

    public void deleteUser(String email) {
        userRepository.deleteById(email);
    }

    public Userr findUser(String email) {
        return userRepository.findById(email).orElse(null);
    }

    public Userr updateUser(String email, Userr updatedUser) {
        if (userRepository.existsById(email)) {
            updatedUser.setEmail(email); // Ensure the email remains unchanged
            return userRepository.save(updatedUser);
        }
        return null;
    }
}
