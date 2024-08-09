package com.example.shopforhome.controller.web;

import com.example.shopforhome.dto.ReportDTO;
import com.example.shopforhome.entity.Product;
import com.example.shopforhome.service.ProductService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class adminPageController {

    @Autowired
    private ProductService productService;

    @Autowired
    private RestTemplate restTemplate;

    @GetMapping("/admin")
    public String adminPage(HttpSession session) {
        List<Product> products = productService.getAllProducts();
        session.setAttribute("products", products);
        return "pages/admin";
    }


    @GetMapping("/admin/stocks")
    public String viewStocks(Model model) {
        List<Product> products = productService.getAllProducts();
        model.addAttribute("products", products);
        return "admin/stocks";
    }

    @GetMapping("/admin/salesReports")
    public ModelAndView viewSalesReports(
            @RequestParam(name = "startDate", required = false) String startDate,
            @RequestParam(name = "endDate", required = false) String endDate
    ) {
        ModelAndView modelAndView = new ModelAndView("pages/admin");

        if (startDate != null && endDate != null) {
            try {
                String url = "http://reports/api/reports?startDate=" + startDate + "&endDate=" + endDate;

                ResponseEntity<List<ReportDTO>> response = restTemplate.exchange(
                        url,
                        HttpMethod.GET,
                        null,
                        new ParameterizedTypeReference<List<ReportDTO>>() {}
                );
                List<ReportDTO> reports = response.getBody();
                modelAndView.addObject("startDate", startDate);
                modelAndView.addObject("endDate", endDate);
                modelAndView.addObject("reports", reports != null ? reports : List.of());
            } catch (Exception e) {
                // Handle error
                modelAndView.addObject("error", "Error retrieving reports: " + e.getMessage());
            }
        } else {
            modelAndView.addObject("error", "Please provide both start and end dates.");
        }

        return modelAndView;
    }

}
