<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<jsp:include page="nav.jsp" />

<script>
    // Get the email attribute from the model
    var email = "${user.email}";
    if (email) {
        sessionStorage.setItem('email', email);
    }
</script>

<div class="text-5xl text-center my-12">Hello ${user.email}</div>

<!-- Add the container element here -->
<div id="product-container" class="mx-10 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 p-4">
</div>


    <script>
        document.addEventListener('DOMContentLoaded', function() {
            fetch('https://fakestoreapi.com/products')
                .then(response => response.json())
                .then(products => {
                    const container = document.getElementById('product-container');
                    products.forEach(product => {
                        const productCard = document.createElement('div');
                        productCard.className = 'bg-white rounded-lg shadow-lg p-4';

                        const productImage = document.createElement('img');
                        productImage.src = product.image;
                        productImage.alt = product.title;
                        productImage.className = 'w-full h-48 object-cover';

                        const productTitle = document.createElement('h2');
                        productTitle.className = 'text-xl mt-2';
                        productTitle.textContent = product.title;

                        const productDescription = document.createElement('p');
                        productDescription.className = 'text-gray-700 mt-2';
                        productDescription.textContent = product.description.substring(0, 60) + "....";

                        const productPrice = document.createElement('p');
                        productPrice.className = 'text-blue-600 mt-2 font-bold';
                        productPrice.textContent = "$"+ product.price;


                        // 创建 Add to cart 按钮
                        const addToCartButton = document.createElement('button');
                        addToCartButton.className = 'bg-blue-500 text-white px-4 py-2 rounded ml-4';
                        addToCartButton.textContent = 'Add to cart';
                        addToCartButton.onclick = function() {
                            alert(`Added ${product.title} to cart!`);
                        };

                        // 创建包含价格和按钮的容器
                        const priceAndButtonContainer = document.createElement('div');
                        priceAndButtonContainer.className = 'flex items-center';
                        priceAndButtonContainer.appendChild(productPrice);
                        priceAndButtonContainer.appendChild(addToCartButton);

                        productCard.appendChild(productImage);
                        productCard.appendChild(productTitle);
                        productCard.appendChild(productDescription);
                        productCard.appendChild(priceAndButtonContainer);

                        container.appendChild(productCard);
                    });
                })
                .catch(error => console.error('Error fetching products:', error));
        });
    </script>




<script src="https://cdn.jsdelivr.net/npm/flowbite@2.4.1/dist/flowbite.min.js"></script>

</body>
</html>
