package com.example.shopforhome.repository;

import com.example.shopforhome.entity.WishList;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface WishListRepository extends JpaRepository<WishList, Long> {
    /**
     * Find wish list by user id
     * @param userId
     * @return
     */
    Optional<WishList> findByUserId(Long userId);
}