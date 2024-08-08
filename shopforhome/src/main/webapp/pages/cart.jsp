<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.shopforhome.entity.Product" %>
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
    <%@ include file="../WEB-INF/nav.jsp" %>

    <div class="container">
        <h1 class="shopping-cart-title"><i class="fas fa-shopping-cart"></i>Shopping Cart</h1>
        <div class="row">
            <div class="col-12">
                <%
                    List<Product> products = new ArrayList<>();
                    products.add(new Product(1L, "ring", "jewelery", 10.99, 10, "https://via.placeholder.com/200", null, null));
                    products.add(new Product(2L, "hard disk", "electronics", 64.00, 5, "https://via.placeholder.com/200", null, null));
                    products.add(new Product(3L, "display", "electronics", 599.00, 8, "https://via.placeholder.com/200", null, null));
                    products.add(new Product(4L, "Mens Casual", "men's clothing", 22.00, 3, "https://via.placeholder.com/200", null, null));

                    if (products != null && !products.isEmpty()) {
                        double totalPrice = 0;
                        for (Product product : products) {
                            int quantity = 1;
                            double price = product.getPrice() * quantity;
                            totalPrice += price;
                %>
                <div class="card product-card">
                    <img src="<%= product.getImageUrl() %>" alt="Product Image">
                    <div class="product-card-body">
                        <h5 class="product-card-title"><%= product.getName() %></h5>
                        <p class="product-card-text"><%= product.getCategory() %></p>
                        <div class="product-card-price">$<span class="price"><%= product.getPrice() %></span></div>
                        <div class="quantity-control">
                            <button class="btn btn-secondary btn-sm btn-minus"><i class="fas fa-minus"></i></button>
                            <input type="number" class="quantity-input" value="<%= quantity %>" min="1">
                            <button class="btn btn-secondary btn-sm btn-plus"><i class="fas fa-plus"></i></button>
                        </div>
                        <div class="product-card-footer">
                            <a href="#" class="btn btn-danger btn-remove"><i class="fas fa-trash-alt"></i> Remove</a>
                        </div>
                    </div>
                </div>
                <%
                        }
                %>
                <div class="total-price">Total: $<span id="totalPrice"><%= totalPrice %></span></div>
                <div class="text-right mt-3">
                    <a href="#" class="btn btn-success btn-lg"><i class="fas fa-check"></i> Checkout</a>
                </div>
                <%
                    } else {
                %>
                <div class="empty-cart-message">
                    <p class="lead">Your cart is empty.</p>
                    <a href="/" class="btn btn-primary"><i class="fas fa-shopping-cart"></i> Continue Shopping</a>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>

    <%@ include file="../WEB-INF/footer.jsp" %>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let totalPrice = parseFloat(document.getElementById("totalPrice").innerText);

            document.querySelectorAll('.quantity-control').forEach(function (control) {
                const minusButton = control.querySelector('.btn-minus');
                const plusButton = control.querySelector('.btn-plus');
                const quantityInput = control.querySelector('.quantity-input');
                const priceDisplay = control.closest('.product-card').querySelector('.price');
                const unitPrice = parseFloat(priceDisplay.innerText);

                function updateTotalPrice(newQuantity, oldQuantity) {
                    totalPrice += unitPrice * (newQuantity - oldQuantity);
                    document.getElementById("totalPrice").innerText = totalPrice.toFixed(2);
                }

                minusButton.addEventListener('click', function () {
                    let quantity = parseInt(quantityInput.value);
                    if (quantity > 1) {
                        updateTotalPrice(quantity - 1, quantity);
                        quantityInput.value = quantity - 1;
                    }
                });

                plusButton.addEventListener('click', function () {
                    let quantity = parseInt(quantityInput.value);
                    updateTotalPrice(quantity + 1, quantity);
                    quantityInput.value = quantity + 1;
                });

                quantityInput.addEventListener('input', function () {
                    let quantity = parseInt(quantityInput.value);
                    if (!isNaN(quantity) && quantity > 0) {
                        updateTotalPrice(quantity, parseInt(quantityInput.getAttribute('data-old-value') || quantity));
                        quantityInput.setAttribute('data-old-value', quantity);
                    } else {
                        quantityInput.value = 1;
                    }
                });

                quantityInput.setAttribute('data-old-value', quantityInput.value);
            });

            document.querySelectorAll('.btn-remove').forEach(function (removeButton) {
                removeButton.addEventListener('click', function (event) {
                    event.preventDefault();
                    const productCard = removeButton.closest('.product-card');
                    const quantityInput = productCard.querySelector('.quantity-input');
                    const quantity = parseInt(quantityInput.value);
                    const priceDisplay = productCard.querySelector('.price');
                    const unitPrice = parseFloat(priceDisplay.innerText);

                    totalPrice -= unitPrice * quantity;
                    document.getElementById("totalPrice").innerText = totalPrice.toFixed(2);

                    productCard.remove();
                });
            });
        });
    </script>
</body>
</html>
