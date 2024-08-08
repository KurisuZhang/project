<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .register-card {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .register-icon {
            font-size: 50px;
            color: #42a5f5;
            margin-bottom: 15px;
        }

        .register-title {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 20px;
        }

        .form-control {
            margin-bottom: 15px;
        }

        .register-btn,
        .login-btn {
            width: 100%;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            margin-top: 10px;
            color: white;
        }

        .login-btn {
            background-color: #1976d2;
        }
    </style>
</head>

<%@ include file="../nav.jsp" %>

<body>
<div class="register-card bg-light">
    <div class="text-center register-icon">
        <i class="fas fa-user-plus"></i>
    </div>
    <div class="text-center register-title">Register</div>
    <form id="register-form">
        <input type="text" id="reg-username" class="form-control" placeholder="Username" required>
        <input type="password" id="reg-password" class="form-control" placeholder="Password" required>
        <input type="password" id="confirm-password" class="form-control" placeholder="Confirm Password" required>
        <select id="user-group" class="form-control">
            <option value="Guest">GUEST</option>
            <option value="Customer">CUSTOMER</option>
            <option value="VIP">VIP</option>
        </select>
        <button type="submit" class="btn btn-primary register-btn">Register</button>
        <a href="login" class="btn login-btn">Login</a>
    </form>
</div>

<!-- JavaScript to handle registration -->



<script>
    document.getElementById('register-form').addEventListener('submit', function (event) {
        event.preventDefault();

        const username = document.getElementById('reg-username').value;
        const password = document.getElementById('reg-password').value;
        const confirmPassword = document.getElementById('confirm-password').value;
        const role = "ROLE_" + document.getElementById('user-group').value;

        if (password !== confirmPassword) {
            alert('Passwords do not match!');
            return;
        }

        fetch('http://localhost:8080/api/user/register', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ username, password, role })
        })
            .then(response => {
                if (response.ok) {
                    alert('Registration successful!');
                    window.location.href = '/login';
                } else {
                    alert('Registration failed! Please try again.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('An error occurred. Please try again later.');
            });
    });
</script>
</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</html>
