package com.example.coupons.controller;

import com.example.coupons.entity.Coupon;
import com.example.coupons.service.CouponService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/coupons")
public class CouponController {

    @Autowired
    private CouponService couponService;

    @PostMapping("/discount")
    public ResponseEntity<Double> getDiscount(@RequestParam String couponName, @RequestParam String userRole) {
        Optional<Double> discount = couponService.getDiscountByCouponNameAndUserRole(couponName, userRole);
        if (discount.isPresent()) {
            return ResponseEntity.ok(discount.get());
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping("/set/{userRole}/{couponName}/{couponValue}")
    public ResponseEntity<String> setCoupon(@PathVariable String userRole,
                                            @PathVariable String couponName,
                                            @PathVariable double couponValue) {
        boolean updated = couponService.updateCoupon(userRole, couponName, couponValue);
        if (updated) {
            return ResponseEntity.ok("Coupon updated successfully");
        } else {
            return ResponseEntity.badRequest().body("Coupon update failed");
        }
    }

    @GetMapping("/all/{userRole}")
    public ResponseEntity<List<Coupon>> getAllCouponsByUserRole(@PathVariable String userRole) {
        List<Coupon> coupons = couponService.getAllCouponsByUserRole(userRole);
        if (coupons.isEmpty()) {
            return ResponseEntity.notFound().build();
        } else {
            return ResponseEntity.ok(coupons);
        }
    }
}
