<%@ page import="com.example.shopforhome.entity.Product" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product List</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        .fancy-brand {
            font-family: 'Brush Script MT', cursive;
            font-size: 2rem;
            font-weight: bold;
            background: linear-gradient(to right, #ff7e5f, #feb47b);
            -webkit-background-clip: text;
            color: transparent;
        }
        .product-card {
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            transition: transform 0.2s, box-shadow 0.2s;
            display: flex;
            flex-direction: column;
            height: 100%;
        }
        .product-card:hover {
            transform: scale(1.03);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        .product-card img {
            border-bottom: 1px solid #e0e0e0;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
            object-fit: cover;
            height: 200px; /* Adjust height as needed */
        }
        .product-card-body {
            padding: 1.25rem;
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            text-align: center;
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
            text-align: center;
        }
       
        .footer {
            background-color: #343a40;
            color: #fff;
            padding: 1rem 0;
        }
        .footer a {
            color: #fff;
            text-decoration: none;
        }
        .footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <%@ include file="nav.jsp" %>
    <%@ include file="banner.jsp" %>
    <%@ include file="CardViewList.jsp" %>
    <%@ include file="footer.jsp" %>


    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>
