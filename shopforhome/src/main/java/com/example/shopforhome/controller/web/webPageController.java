package com.example.shopforhome.controller.web;

import com.example.shopforhome.controller.ProductController;
import com.example.shopforhome.entity.Cart;
import com.example.shopforhome.entity.Product;
import com.example.shopforhome.entity.WishList;
import com.example.shopforhome.service.CartService;
import com.example.shopforhome.service.WishListService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Enumeration;
import java.util.List;



@Controller
public class webPageController {

    @Autowired
    private ProductController productController;

    @Autowired
    private CartService cartService;

    @Autowired
    private WishListService wishListService;

    @GetMapping("/")
    public String home(Model model, HttpSession session) {
        // Print all session attributes
        Enumeration<String> attributeNames = session.getAttributeNames();
        while (attributeNames.hasMoreElements()) {
            String attributeName = attributeNames.nextElement();
        }


        List<Product> products = productController.getAllProducts();
        model.addAttribute("products", products);

        return "/pages/home";
    }

    @GetMapping("/cart/{userId}")
    public String cart(@PathVariable Long userId, Model model) {
        Cart cart = cartService.getCartByUserId(userId);
        model.addAttribute("products", cart.getItems());
        return "./pages/cart";
    }

    @GetMapping("/product/search")
    public String searchProducts(@RequestParam(name = "query", required = false, defaultValue = "") String query, Model model, HttpSession session) {
        // Call the service to search for products based on the query
        List<Product> products = productController.searchProducts(query);

        // Add the search results to the model
        model.addAttribute("products", products);
        model.addAttribute("query", query);
        model.addAttribute("numberOfResults", products.size());
        return "/pages/home";
    }

    @GetMapping("/product")
    public ModelAndView getProductsByCategory(@RequestParam(name = "category", required = false, defaultValue = "") String category, HttpSession session) {
        System.out.println(category);
        // Fetch products based on category
        List<Product> products = productController.getProductsByCategory(category);

        // Create ModelAndView object
        ModelAndView modelAndView = new ModelAndView("/pages/home"); 

        // Add products to the model
        modelAndView.addObject("products", products);

       
        modelAndView.addObject("selectedCategory", category);

        return modelAndView;
    }

    // Get wishlist
    @GetMapping("/wishlist/{userId}")
    public String getWishlist(@PathVariable Long userId, Model model) {
        WishList wishList = wishListService.getAllItems(userId);
        model.addAttribute("products", wishList.getItems());
        return "./pages/wishlist";
    }
}

    
    

