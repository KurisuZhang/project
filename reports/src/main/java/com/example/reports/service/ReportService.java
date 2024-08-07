package com.example.reports.service;

import com.example.reports.entity.Report;
import com.example.reports.repository.ReportRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReportService {

    @Autowired
    private ReportRepository reportRepository;

    public List<Report> allReports() {
        return reportRepository.findAll();
    }
}
