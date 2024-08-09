<%
    String user = (String) session.getAttribute("user");
    String role = (String) session.getAttribute("role");
    boolean isLoggedIn = (user != null);
%>

<div class="text-end">
    <% if (!isLoggedIn) { %>
    <a href="/login" class="btn btn-outline-dark text-dark me-2">Login</a>
    <a href="/register" class="btn btn-warning me-2">Sign-up</a>
    <% } else { %>
    <span class="navbar-text text-dark me-2">Welcome, <%= user %>!</span>
    <a href="/logout" class="btn btn-outline-danger text-dark me-2">Logout</a>
    <% if ("ROLE_ADMIN".equals(role)) { %>
    <a href="/admin" class="btn btn-outline-secondary text-dark me-2">Admin</a>
    <% } %>
    <% } %>
    <a href="/cart" class="btn btn-outline-primary text-dark">Cart</a>
</div>