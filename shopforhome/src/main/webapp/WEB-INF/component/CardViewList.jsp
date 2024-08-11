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
                    <%if (isLoggedIn) { %>
                    <div class="product-card-footer">
                        <a href="javascript:addToCart(<%=product.getId() %>)" class="btn btn-primary"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                    </div>
                    <div class="product-card-footer">
                        <a href="javascript:addToWishList(<%=product.getId() %>)" class="btn btn-primary mt-2">Add to Wish List</a>
                    </div>
                    <%} %>
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
        <script>
            function addToWishList(productId) {
                <%if (isLoggedIn) {%>
                    const userid = 1;
                    fetch(`/api/wishlist/add/<%=userId%>/`+productId, {
                        method: 'POST'
                    }).then(response => {
                        window.location.href = `/wishlist/<%=userId%>`;
                    });
                <%} else {%>
                    alert("Please login to add items to wish list.");
                    window.location.href = "/login";
                <%}%>
            }
            function addToCart(productId) {
                <%if (isLoggedIn) {%>
                    const userid = 1;
                    fetch(`/api/cart/<%=userId%>`, {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify({
                            quantity: 1,
                            userId: <%=userId %>,
                            productId: productId
                        })
                    }).then(response => {
                        window.location.href = `/cart/<%=userId%>`;
                    });
                <%} else {%>
                    alert("Please login to add items to cart.");
                    window.location.href = "/login";
                <%}%>
            }
        </script>
    </div>
</div>