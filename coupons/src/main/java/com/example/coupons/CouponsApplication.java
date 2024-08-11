package com.example.coupons;

import com.example.coupons.entity.Coupon;
import com.example.coupons.repository.CouponRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

@SpringBootApplication
@EnableDiscoveryClient
public class CouponsApplication implements CommandLineRunner {

	@Autowired
	private CouponRepository couponRepository;

	public static void main(String[] args) {
		SpringApplication.run(CouponsApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		Map<String, Double> discounts = new HashMap<>();
		discounts.put("DISCOUNT10%", 0.9);
		discounts.put("DISCOUNT20%", 0.8);

		Coupon coupon1 = new Coupon(1L, discounts, "ROLE_USER");
		couponRepository.save(coupon1);

		Map<String, Double> discounts1 = new HashMap<>();
		discounts.put("DISCOUNT50%", 0.5);
		discounts.put("DISCOUNT90%", 0.1);

		Coupon coupon2 = new Coupon(2L, discounts, "ROLE_ADMIN");

		couponRepository.save(coupon2);
	}

	@Bean
	@LoadBalanced
	public RestTemplate restTemplate() {
		return new RestTemplate();
	}
}
