<%@ page import="java.util.List" %>
<%@ page import="com.example.shopforhome.entity.Product" %>
<div class="container my-4">
    
    <div class="row">
        <%
            List<Product> products = (List<Product>) request.getAttribute("products");
        
            //Conditionally display search results
        
            String searchQuery = (String) request.getAttribute("query");

            Integer attribute =  (Integer)request.getAttribute("numberOfResults");
            int numberOfResults = 0;
            if(attribute!=null){
                numberOfResults = attribute;
            }
            //Display the number of results matches the query
            if (searchQuery != null && !searchQuery.trim().isEmpty()) {
        %>
            <p>Search results for "<%= searchQuery %>", <%= numberOfResults %> result(s) found</p>
        
            
        <%}else if(request.getAttribute("selectedCategory")!=null){
            //Display the selected Category Message
            String selectedCategory = (String)request.getAttribute("selectedCategory");
        %>
            <h3> <%= selectedCategory %> </h3>
        <%
            }else{
         %>
            <h5 class="mb-4">Discover Our Latest Home Decor</h5>  
        <%
            }
        %>
        <%
            if (products != null && !products.isEmpty()) {
                for (Product product : products) {
        %>
        <div class="col-md-3 mb-2">
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