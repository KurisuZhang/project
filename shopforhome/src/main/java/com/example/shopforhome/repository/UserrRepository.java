package com.example.shopforhome.repository;

import com.example.shopforhome.entity.Userr;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserrRepository extends JpaRepository<Userr, String> {
}
