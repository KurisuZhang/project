package com.example.shopforhome.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class adminPageController {

    @GetMapping("/admin/upload")
    public String uploadPage() {
        return "admin/upload";
    }
}
