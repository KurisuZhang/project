package com.example.shopforhome.repository;

import com.example.shopforhome.entity.Productt;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProducttRepository extends JpaRepository<Productt, Integer> {
}
