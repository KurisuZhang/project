package com.example.coupons.service;

import com.example.coupons.entity.Coupon;
import com.example.coupons.repository.CouponRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class CouponService {

    @Autowired
    private CouponRepository couponRepository;

    public Optional<Double> getDiscountByCouponNameAndUserRole(String couponName, String userRole) {
        Optional<Coupon> coupon = couponRepository.findByUserRole(userRole);
        Optional<Double> v = coupon.map(c -> c.getDiscounts().get(couponName));
        return v;
    }

    public boolean updateCoupon(String userRole, String couponName, double couponValue) {
        Optional<Coupon> optionalCoupon = couponRepository.findByUserRole(userRole);
        if (optionalCoupon.isPresent()) {
            Coupon coupon = optionalCoupon.get();
            coupon.getDiscounts().put(couponName, couponValue);
            couponRepository.save(coupon);
            return true;
        } else {
            return false;
        }
    }

    public List<Coupon> getAllCouponsByUserRole(String userRole) {
        return couponRepository.findByUserRole(userRole).stream().collect(Collectors.toList());
    }
}