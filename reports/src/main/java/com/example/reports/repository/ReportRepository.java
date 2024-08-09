package com.example.reports.repository;

import com.example.reports.entity.Report;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.Collection;

@Repository
public interface ReportRepository extends JpaRepository<Report, Long> {

    Collection<Report> findAllByGeneratedDateBetween(LocalDate start, LocalDate end);
}
