package com.example.reports.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
@AllArgsConstructor
public class ReportDTO {
    private Long id;
    private String reportMessage;
    private LocalDate generatedDate;

}
