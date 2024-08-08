<%@ page import="java.util.List" %>
<%@ page import="com.example.shopforhome.entity.Product" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product List</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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
   <nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand fancy-brand" href="/">ShopForHome</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" href="#">Furniture</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Home Decor</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Mattresses</a>
        </li>
      </ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success me-2" type="submit">Search</button>
      </form>
      <div class="text-end">
          <button type="button" class="btn btn-outline-dark text-dark me-2">Login</button>
          <button type="button" class="btn btn-warning">Sign-up</button>
        </div>
    </div>
  </div>
</nav>

    <div id="carouselExample" class="carousel slide">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://assets.wfcdn.com/im/28569277/resize-h454-w2000%5Ecompr-r85/2897/289778886/build_your_outdoor_space._fall_picks_for_less_289778886.jpg" class="d-block w-100" alt="..." height=400>
    </div>
    <div class="carousel-item">
      <img src="https://static.athome.com/image/upload/f_auto,q_auto/v1719930998/webcontent/2024/Week_24/D/FY25_WK23-26_SSSS_PileOnComfort_Comp-D.png" class="d-block w-100" alt="..." height=400>
    </div>
    <div class="carousel-item">
      <img src="https://static.athome.com/image/upload/f_auto,q_auto/v17217508673/webcontent/2024/Week_27/D/Promotional/FY25_WK27-29_GFO_Promo_FallSale_COMP_D.png" class="d-block w-100" alt="..." height=400>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>


    <main class="container my-4">
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
    </main>

    <footer class="footer text-center">
        <p>&copy; 2024 ShopForHome | <a href="#">Privacy Policy</a></p>
    </footer>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
