package com.example.shopforhome.dto;

import java.time.LocalDate;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReportDTO {
    private Long id;
    private String reportMessage;
    private LocalDate generatedDate;
}
