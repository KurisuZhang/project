<%@ page import="java.util.List" %>
<%@ page import="com.example.shopforhome.entity.Product" %>
 <div class="container mt-4 content">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Category</th>
                <th>Price</th>
                <th>Stock</th>
                <th>Image</th>
            </tr>
        </thead>
        <tbody>
            <%-- Retrieve the products list from the request scope --%>
            <%
                List<Product> products = (List<Product>) session.getAttribute("products");
                if (products != null) {
                    for (Product product : products) {
            %>
            <tr>
                <td><%= product.getId() %></td>
                <td><%= product.getName() %></td>
                <td><%= product.getCategory() %></td>
                <td><%= product.getPrice() %></td>
                <td><%= product.getStock() %></td>
                <td><img src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>" style="width: 100px;"></td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>

</div>

<div class="container mt-4 content">
    <!-- Container for the low stock table -->
        <%
            List<Product> lowStockProducts = (List<Product>) session.getAttribute("lowStockProducts");
            if (lowStockProducts != null && !lowStockProducts.isEmpty()) {
        %>
        <table class="table table-bordered mt-4">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Stock</th>
                    <th>Image</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Product product : lowStockProducts) {
                %>
                <tr>
                    <td><%= product.getId() %></td>
                    <td><%= product.getName() %></td>
                    <td><%= product.getCategory() %></td>
                    <td><%= product.getPrice() %></td>
                    <td><%= product.getStock() %></td>
                    <td><img src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>" style="width: 100px;"></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <% } else{%>
         <!-- Button to check low stock -->
        <a href="/admin/stocks/checkLowStock" class="btn btn-warning">Check Low Stock</a>
        <% } %>

 </div>

