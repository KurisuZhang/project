package com.example.reports.controller;


import com.example.reports.entity.Report;
import com.example.reports.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/report/")
public class ReportController {

    @Autowired
    private ReportService reportService;

    @GetMapping("/allReports")
    public List<Report> getAllContact() {

        return reportService.allReports();
    }
}
