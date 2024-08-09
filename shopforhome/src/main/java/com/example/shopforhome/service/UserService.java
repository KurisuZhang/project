package com.example.shopforhome.service;

import com.example.shopforhome.entity.User;
import com.example.shopforhome.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public void save(User user) {
        userRepository.save(user);
    }

    public Optional<User> findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Transactional
    public void deleteByUsername(String username) {
        userRepository.deleteByUsername(username);
    }

    // Method to get the role of a user by username
    public Optional<String> findRoleByUsername(String username) {
        return userRepository.findRoleByUsername(username);
    }
}
