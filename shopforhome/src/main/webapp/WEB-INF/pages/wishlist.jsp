<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.shopforhome.entity.Product" %>
<%@ page import="com.example.shopforhome.entity.WishListItem" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .container {
            flex: 1;
        }
        .fancy-brand {
            font-family: 'Brush Script MT', cursive;
            font-size: 2rem;
            font-weight: bold;
            background: linear-gradient(to right, #ff7e5f, #feb47b);
            -webkit-background-clip: text;
            color: transparent;
        }
        .navbar-brand {
            color: #ff7e5f;
        }
        .product-card {
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            transition: transform 0.2s, box-shadow 0.2s;
            display: flex;
            flex-direction: row;
            margin-bottom: 20px;
            padding: 15px;
        }
        .product-card:hover {
            transform: scale(1.03);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        .product-card img {
            border-bottom-left-radius: 8px;
            border-top-left-radius: 8px;
            object-fit: cover;
            width: 200px;
            height: 150px;
        }
        .product-card-body {
            padding: 1.25rem;
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .product-card-title {
            font-size: 1.25rem;
            margin-bottom: 0.5rem;
        }
        .product-card-text {
            color: #777;
        }
        .product-card-price {
            font-size: 1.5rem;
            font-weight: bold;
            margin: 0.5rem 0;
        }
        .product-card-footer {
            text-align: right;
        }
        .empty-cart-message {
            text-align: center;
            margin-top: 50px;
        }
        .btn-primary {
            background-color: #ff7e5f;
            border-color: #ff7e5f;
        }
        .btn-primary:hover {
            background-color: #feb47b;
            border-color: #feb47b;
        }
        .btn-danger {
            background-color: #d9534f;
            border-color: #d9534f;
        }
        .btn-danger:hover {
            background-color: #c9302c;
            border-color: #ac2925;
        }
        .footer {
            background-color: #343a40;
            color: #fff;
            padding: 1rem 0;
            text-align: center;
        }
        .footer a {
            color: #fff;
            text-decoration: none;
        }
        .footer a:hover {
            text-decoration: underline;
        }
        .shopping-cart-title {
            font-family: 'Brush Script MT', cursive;
            font-size: 3rem;
            color: #ff7e5f;
            text-align: center;
            margin: 40px 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .shopping-cart-title i {
            margin-right: 10px;
        }
        .quantity-control {
            display: flex;
            align-items: center;
        }
        .quantity-control input[type=number]::-webkit-outer-spin-button,
        .quantity-control input[type=number]::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        .quantity-control input[type=number] {
            -moz-appearance: textfield;
            width: 60px;
            text-align: center;
            margin: 0 10px;
        }
        .total-price {
            font-size: 1.5rem;
            font-weight: bold;
            text-align: right;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<%@ include file="../component/nav.jsp" %>
    <div class="container">
        <h1 class="shopping-cart-title"><i class="fas fa-shopping-cart"></i>Wish List</h1>
        <div class="row">
            <div class="col-12">
                <%
                     List<WishListItem> products = (List<WishListItem>) request.getAttribute("products");
                    if (products != null && !products.isEmpty()) {
                        for (WishListItem product : products) {
                %>
                    <div class="card product-card">
                        <img src="<%= product.getProduct().getImageUrl() %>" alt="Product Image">
                        <div class="product-card-body">
                            <h5 class="product-card-title"><%= product.getProduct().getName() %></h5>
                            <p class="product-card-text"><%= product.getProduct().getCategory() %></p>
                            <div class="product-card-price">$<span class="price"><%= product.getProduct().getPrice() %></span></div>
                            <div class="product-card-footer">
                                <a href="javascript:removeWishListItem(<%=product.getId() %>)" class="btn btn-danger btn-remove"><i class="fas fa-trash-alt"></i> Remove</a>
                            </div>
                        </div>
                    </div>
                <%
                        }
                %>
                <%
                    } else {
                %>
                <div class="empty-cart-message">
                    <p class="lead">Your cart is empty.</p>
                    <a href="/" class="btn btn-primary"><i class="fas fa-shopping-cart"></i> Continue Add to WishList</a>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>
    <script>
    <!-- This script is used to remove an item from the wish list -->
    function removeWishListItem(itemId) {
        const url = `/api/wishlist/delete/<%=userId%>/` + itemId;
        fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then(response => {
            if (response.ok) {
                location.reload();
            }
        });
    }
    </script>
    <%@ include file="../component/footer.jsp" %>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
