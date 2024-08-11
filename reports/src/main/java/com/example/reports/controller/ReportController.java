package com.example.reports.controller;


import com.example.reports.dto.ReportDTO;
import com.example.reports.entity.Report;
import com.example.reports.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
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

    @PostMapping
    public ResponseEntity<String> createReport(@RequestParam LocalDate startDate,
                                               @RequestParam String reportMessage) {
        Report report = new Report();
        report.setGeneratedDate(startDate);
        report.setReportMessage(reportMessage);

        reportService.save(report);

        return ResponseEntity.status(HttpStatus.CREATED).body("Report saved successfully");
    }
}
