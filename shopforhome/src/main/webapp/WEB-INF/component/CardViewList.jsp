<%@ page import="java.util.List" %>
<%@ page import="com.example.shopforhome.entity.Product" %>
<div class="container my-4">
    <h2 class="mb-4">Product List</h2>
    <div class="row">
        <%
            List<Product> products = (List<Product>) request.getAttribute("products");

            if (products != null && !products.isEmpty()) {
                for (Product product : products) {
        %>
        <div class="col-md-4 mb-4">
            <div class="product-card card">
                <img src="<%= product.getImageUrl() %>" class="card-img-top" alt="<%= product.getName() %>">
                <div class="product-card-body card-body">
                    <h5 class="product-card-title card-title"><%= product.getName() %></h5>
                    <p class="product-card-text">Category: <%= product.getCategory() %></p>
                    <p class="product-card-price">$<%= product.getPrice() %></p>
                    <div class="product-card-footer">
                        <a href="#" class="btn btn-primary"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <div class="col-12">
            <p class="text-center">No products available.</p>
        </div>
        <%
            }
        %>
    </div>
</div>