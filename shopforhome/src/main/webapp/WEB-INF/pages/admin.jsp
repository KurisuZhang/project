<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/admin">Admin Dashboard</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/">Home</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container mt-4">
    <ul class="nav nav-tabs" id="adminTab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="user-tab" data-bs-toggle="tab" data-bs-target="#user" type="button" role="tab" aria-controls="user" aria-selected="true">User</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="product-tab" data-bs-toggle="tab" data-bs-target="#product" type="button" role="tab" aria-controls="product" aria-selected="false">Product</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="report-tab" data-bs-toggle="tab" data-bs-target="#report" type="button" role="tab" aria-controls="report" aria-selected="false">Report</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="upload-tab" data-bs-toggle="tab" data-bs-target="#upload" type="button" role="tab" aria-controls="upload" aria-selected="false">Upload</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="stock-tab" data-bs-toggle="tab" data-bs-target="#stock" type="button" role="tab" aria-controls="stock" aria-selected="false">Stock</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="coupon-tab" data-bs-toggle="tab" data-bs-target="#coupon" type="button" role="tab" aria-controls="coupon" aria-selected="false">Coupon</button>
        </li>
    </ul>
    <div class="tab-content mt-3">
        <!-- User Tab -->
        <div class="tab-pane fade show active" id="user" role="tabpanel" aria-labelledby="user-tab">
            <h3>User Management</h3>
            <form id="userForm">
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" id="username" placeholder="Enter username">
                </div>
                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" placeholder="Enter password">
                </div>
                <button type="button" class="btn btn-primary" onclick="createUser()">Create User</button>
                <button type="button" class="btn btn-secondary" onclick="updateUser()">Update User</button>
                <button type="button" class="btn btn-danger" onclick="deleteUser()">Delete User</button>
            </form>
        </div>

        <!-- Product Tab -->
        <div class="tab-pane fade" id="product" role="tabpanel" aria-labelledby="product-tab">
            <h3>Product Management</h3>
            <form id="productForm">
                <div class="mb-3">
                    <label for="productId" class="form-label">Product ID</label>
                    <input type="number" class="form-control" id="productId" placeholder="Enter productId">
                </div>
                <div class="mb-3">
                    <label for="productName" class="form-label">Product Name</label>
                    <input type="text" class="form-control" id="productName" placeholder="Enter product name">
                </div>
                <div class="mb-3">
                    <label for="productCategory" class="form-label">Product Category</label>
                    <input type="text" class="form-control" id="productCategory" placeholder="Enter Category">
                </div>
                <div class="mb-3">
                    <label for="productPrice" class="form-label">Product Price</label>
                    <input type="number" class="form-control" id="productPrice" placeholder="Enter price">
                </div>
                <div class="mb-3">
                    <label for="productStock" class="form-label">Product Stock</label>
                    <input type="number" class="form-control" id="productStock" placeholder="Enter Stock">
                </div>
                <div class="mb-3">
                    <label for="productImageUrl" class="form-label">Product ImageUrl</label>
                    <input type="text" class="form-control" id="productImageUrl" placeholder="Enter ImageUrl">
                </div>
                <button type="submit" class="btn btn-primary" onclick="addProduct()">Create Product</button>
                <button type="button" class="btn btn-secondary" onclick="updateProduct()">Update Product</button>
                <button type="button" class="btn btn-danger" onclick="deleteProduct()">Delete Product</button>
            </form>
        </div>

        <!-- Report Tab -->
        <div class="tab-pane fade" id="report" role="tabpanel" aria-labelledby="report-tab">
            <h3>Reports</h3>
            <%@ include file="../admin/salesReports.jsp" %>
        </div>

        <!-- Upload Tab -->
        <div class="tab-pane fade" id="upload" role="tabpanel" aria-labelledby="upload-tab">
            <h3>Upload</h3>
            <%@ include file="../admin/upload.jsp" %>
        </div>

        <!-- Stock Tab -->
        <div class="tab-pane fade" id="stock" role="tabpanel" aria-labelledby="stock-tab">
            <h3>Stock</h3>
            <%@ include file="../admin/stocks.jsp" %>
        </div>
        <div class="tab-pane fade" id="coupon" role="tabpanel" aria-labelledby="coupon-tab">
            <h3>Coupon</h3>
            <%@ include file="../admin/conpon.jsp" %>
        </div>
    </div>
</div>

<%@ include file="../component/footer.jsp" %>
<script>
    function createUser() {
        const url = `http://localhost:8080/api/admin/create/user/`+document.getElementById("username").value + '/' + document.getElementById("password").value;

        fetch(url)
            .then(response => response.text())
            .then(data => alert(data))
            .catch(error => alert('Error: ' + error));
    }

    function updateUser() {

        const url = '/api/admin/update/user/' + document.getElementById("username").value + '/' + document.getElementById("password").value;

        fetch(url)
            .then(response => response.text())
            .then(data => alert(data))
            .catch(error => alert('Error: ' + error));
    }

    function deleteUser() {

        const url = '/api/admin/delete/user/'+ document.getElementById("username").value;

        fetch(url)
            .then(response => response.text())
            .then(data => alert(data))
            .catch(error => alert('Error: ' + error));
    }
    function addProduct() {
        const productName = document.getElementById("productName").value;
        const productCategory = document.getElementById("productCategory").value;
        const productPrice = document.getElementById("productPrice").value;
        const productStock = document.getElementById("productStock").value;
        const productImageUrl = document.getElementById("productImageUrl").value;

        const productData = {
            name: productName,
            category: productCategory,
            price: productPrice,
            stock: productStock,
            imageUrl: productImageUrl
        };

        fetch('http://localhost:8080/api/product/add', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(productData)
        })
            .then(response => response.json())
            .then(data => {
                console.log('Product created successfully:', data);
                window.location.reload();
            })
            .catch((error) => {
                console.error('Error:', error);
            });
    }

    function updateProduct() {
        const productName = document.getElementById("productName").value;
        const productCategory = document.getElementById("productCategory").value;
        const productPrice = document.getElementById("productPrice").value;
        const productStock = document.getElementById("productStock").value;
        const productImageUrl = document.getElementById("productImageUrl").value;

        const productData = {
            name: productName,
            category: productCategory,
            price: productPrice,
            stock: productStock,
            imageUrl: productImageUrl
        };

        fetch('http://localhost:8080/api/product/' + document.getElementById("productId").value, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(productData)
        })
            .then(response => response.json())
            .then(data => {
                console.log('Product updated successfully:', data);
                alert("success");
                window.location.reload();
            })
            .catch((error) => {
                console.error('Error:', error);
                alert('Error')
            });
    }

    function deleteProduct() {

        fetch('http://localhost:8080/api/product/' + document.getElementById("productId").value, {
            method: 'DELETE'
        })
            .then(response => response.json())
            .then(data => {
                console.log('Product deleted successfully:', data);
                alert("success");
                window.location.reload();
            })
            .catch((error) => {
                console.error('Error:', error);
                alert('Error')
            });
    }
</script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>
