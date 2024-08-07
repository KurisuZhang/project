<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header text-center">
                    <h3>Login</h3>
                </div>
                <div class="card-body">
                    <form method="post" action="/api/login">
                        <div class="form-group">
                            <label for="email">Email address</label>
                            <%-- Session--%>
                            <input type="email" class="form-control" id="email" name="email" value="${email}" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" id="password" name="password" value="${password}" required>
                        </div>
                        <%--ModelAndView--%>
                        <% if (request.getAttribute("errorMessage") != null) { %>
                        <div class="alert alert-danger mt-3"><%= request.getAttribute("errorMessage") %></div>
                        <% } %>
                        <button type="submit" class="btn btn-primary btn-block">Login</button>
                    </form>

                    <div class="text-center mt-3">
                        <button onclick="window.location.href='/register'" class="btn btn-secondary btn-block">Register</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

