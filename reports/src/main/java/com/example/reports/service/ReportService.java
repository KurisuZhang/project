package com.example.reports.service;

import com.example.reports.dto.ReportDTO;
import com.example.reports.entity.Report;
import com.example.reports.repository.ReportRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ReportService {

    @Autowired
    private ReportRepository reportRepository;

    public List<Report> allReports() {
        return reportRepository.findAll();
    }


    public List<ReportDTO> getReports(String startDate, String endDate) {
        LocalDate start = LocalDate.parse(startDate);
        LocalDate end = LocalDate.parse(endDate);

        return reportRepository.findAllByGeneratedDateBetween(start, end).stream()
                .map(report -> new ReportDTO(
                        report.getId(),
                        report.getReportMessage(),
                        report.getGeneratedDate()
                ))
                .collect(Collectors.toList());
    }
}
