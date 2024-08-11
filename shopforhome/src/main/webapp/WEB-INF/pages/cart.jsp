<%@ page import="java.util.List" %>
<%@ page import="com.example.shopforhome.entity.CartItem" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        .product-card {
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .product-card:hover {
            transform: scale(1.03);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        .shopping-cart-title {
            color: #ff7e5f;
            text-align: center;
            margin: 40px 0;
        }
        .btn-primary {
            background-color: #ff7e5f;
            border-color: #ff7e5f;
        }
        .btn-primary:hover {
            background-color: #feb47b;
            border-color: #feb47b;
        }
        .btn-danger:hover {
            background-color: #c9302c;
            border-color: #ac2925;
        }
        .quantity-control input[type=number]::-webkit-outer-spin-button,
        .quantity-control input[type=number]::-webkit-inner-spin-button {
            -webkit-appearance: none;
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
        .discounted-total-price {
            font-size: 1.5rem;
            font-weight: bold;
            color: red;
            text-align: right;
        }
        .discounted-price {
            color: red;
            font-weight: bold;
        }
        .coupon-input-group {
            width: 100%;
            display: flex;
            justify-content: flex-end;
            margin-bottom: 1.5rem;
        }
        .coupon-input {
            max-width: 200px;
            margin-right: 0.5rem;
        }
    </style>
</head>
<body>
<%@ include file="../component/nav.jsp" %>

<div class="container">
    <h1 class="shopping-cart-title"><i class="fas fa-shopping-cart"></i> Shopping Cart</h1>
    <div class="row">
        <div class="col-12">
            <%
                List<CartItem> products = (List<CartItem>) request.getAttribute("products");
                if (products != null && !products.isEmpty()) {
                    double totalPrice = 0;
                    for (CartItem product : products) {
                        double price = product.getPrice() * product.getQuantity();
                        totalPrice += price;
            %>
            <div class="card product-card mb-3 p-3 d-flex flex-row">
                <img src="<%= product.getProduct().getImageUrl() %>" alt="Product Image" class="img-fluid rounded-start" style="width: 200px; height: 150px; object-fit: cover;">
                <div class="card-body d-flex flex-column justify-content-between">
                    <h5 class="card-title"><%= product.getProduct().getName() %></h5>
                    <p class="card-text text-muted"><%= product.getProduct().getCategory() %></p>
                    <div class="h5">
                        $<span class="price"><%= product.getPrice() %></span>
                        <div class="discounted-price" style="display:none;">$<span class="discounted-value"></span></div>
                    </div>
                    <div class="quantity-control d-flex align-items-center">
                        <button class="btn btn-secondary btn-sm btn-minus"><i class="fas fa-minus"></i></button>
                        <input type="number" class="quantity-input form-control" value="<%= product.getQuantity() %>" min="1">
                        <button class="btn btn-secondary btn-sm btn-plus"><i class="fas fa-plus"></i></button>
                    </div>
                    <div class="text-end mt-2">
                        <a href="javascript:removeCartItem(<%=product.getId() %>)" class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i> Remove</a>
                    </div>
                </div>
            </div>
            <%
                }
            %>
            <!-- Total Price and Discounted Price -->
            <div class="total-price">Total: $<span id="totalPrice"><%= totalPrice %></span></div>
            <div class="discounted-total-price" style="display: none;">Discounted Total: $<span id="discountedTotalPrice"></span></div>

            <!-- Coupon Input -->
            <div class="coupon-input-group">
                <input type="text" id="couponName" class="form-control coupon-input" placeholder="Enter coupon code">
                <button class="btn btn-outline-primary" type="button" id="applyCouponBtn">Apply Coupon</button>
            </div>

            <!-- Checkout Button -->
            <div class="text-end mt-3">
                <a href="#" class="btn btn-success btn-lg"><i class="fas fa-check"></i> Checkout</a>
            </div>
            <%
            } else {
            %>
            <div class="text-center mt-5">
                <p class="lead">Your cart is empty.</p>
                <a href="/" class="btn btn-primary"><i class="fas fa-shopping-cart"></i> Continue Shopping</a>
            </div>
            <%
                }
            %>
        </div>
        <div id="userRole" style="display:none;"><%= (String) session.getAttribute("role") %></div>
        <div id="discountCoupon" style="display:none;">1</div>
    </div>
</div>

<script>
    function removeCartItem(cartId) {
        fetch(`/api/cart/<%=userId%>/item/`+cartId, {
            method: 'POST'
        })
            .then(res => res.json())
            .then(res => {
                if (res.status === "success") {
                    location.reload();
                }
            });
    }

    document.getElementById("applyCouponBtn").addEventListener("click", function () {
        const couponName = encodeURIComponent(document.getElementById("couponName").value);
        const role = document.getElementById("userRole").innerText;

        fetch(`http://localhost:8081/coupons/discount/` + couponName + '/' + role)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Bad Request');
                }
                return response.json();
            })
            .then(data => {
                const discount = parseFloat(data);
                const div = document.getElementById("discountCoupon");
                div.innerHTML = discount.toString();

                document.querySelectorAll('.product-card').forEach(function (card) {
                    const priceElement = card.querySelector('.price');
                    const originalPrice = parseFloat(priceElement.innerText);
                    const discountedPrice = originalPrice * discount;

                    // Strike-through original price and show discounted price
                    priceElement.style.textDecoration = "line-through";

                    const discountedPriceElement = card.querySelector('.discounted-price');
                    discountedPriceElement.querySelector('.discounted-value').innerText = discountedPrice.toFixed(2);
                    discountedPriceElement.style.display = "block";

                });

                // Show discounted total price
                const totalPriceElement = document.getElementById("totalPrice");
                totalPriceElement.style.textDecoration = "line-through";
                const totalPrice = totalPriceElement.innerText;
                const discountedTotal = totalPrice*discount;
                document.getElementById("discountedTotalPrice").innerText = discountedTotal.toFixed(2);
                document.querySelector('.discounted-total-price').style.display = "block";
            })
            .catch(error => {
                alert("Invalid coupon code or role.");
            });
    });

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
                // Show discounted total price
                const discountCoupon = document.getElementById("discountCoupon").innerHTML;
                console.log("discountCoupon:" + discountCoupon);
                if (discountCoupon !== "1") {
                    const discount = parseFloat(discountCoupon)
                    const discountedTotal = totalPrice*discount;
                    document.getElementById("discountedTotalPrice").innerText = discountedTotal.toFixed(2);
                    document.querySelector('.discounted-total-price').style.display = "block";
                }

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
    });
</script>
<%@ include file="../component/footer.jsp" %>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
