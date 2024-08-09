package com.example.reports.controller;


import com.example.reports.dto.ReportDTO;
import com.example.reports.entity.Report;
import com.example.reports.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/reports")
public class ReportController {

    @Autowired
    private ReportService reportService;

    @GetMapping("/allReports")
    public List<Report> getAllContact() {

        return reportService.allReports();
    }

    @GetMapping
    public ResponseEntity<List<ReportDTO>> getReports(
            @RequestParam("startDate") String startDate,
            @RequestParam("endDate") String endDate
    ) {
        System.out.println("startDate");
        List<ReportDTO> reportDTOs = reportService.getReports(startDate, endDate);
        reportDTOs.stream().forEach(report -> System.out.println(report));
        return ResponseEntity.ok(reportDTOs);
    }
}
