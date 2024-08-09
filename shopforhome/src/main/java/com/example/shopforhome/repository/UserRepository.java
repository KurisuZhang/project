package com.example.shopforhome.repository;

import com.example.shopforhome.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByUsername(String username);
    void deleteByUsername(String username); // Method to delete a user by username
    Optional<String> findRoleByUsername(String username);
}
