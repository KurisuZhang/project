

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .login-card {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .login-icon {
            font-size: 50px;
            color: #42a5f5;
            margin-bottom: 15px;
        }

        .login-title {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 20px;
        }

        .form-control {
            margin-bottom: 15px;
        }

        .login-btn,
        .register-btn {
            width: 100%;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            margin-top: 10px;
            color: white;
        }

        .register-btn {
            background-color: #1976d2;
        }
    </style>
</head>

<%@ include file="../nav.jsp" %>

<body>
<div class="login-card bg-light">
    <div class="text-center login-icon">
        <i class="fas fa-user"></i>
    </div>
    <div class="text-center login-title">Login</div>
    <form id="login-form" method="post" action="http://localhost:8080/login/Button">
        <input type="text" name="username" class="form-control" placeholder="Username" required>
        <input type="password" name="password" class="form-control" placeholder="Password" required>
        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger mt-3"><%= request.getAttribute("error") %></div>
        <% } %>
        <button type="submit" class="btn btn-primary login-btn">Login</button>
        <a href="register" class="btn register-btn">Register</a>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>

</html>



