<%
    String user = (String) session.getAttribute("user");
    boolean isLoggedIn = (user != null);
%>

<div class="text-end">
    <% if (!isLoggedIn) { %>
        <button type="button" class="btn btn-outline-dark text-dark me-2">Login</button>
        <button type="button" class="btn btn-warning me-2">Sign-up</button>
    <% } else { %>
        <span class="navbar-text text-dark me-2">Welcome, <%= user %>!</span>
        <form action="logout" method="post" class="d-inline">
            <button type="submit" class="btn btn-outline-danger text-dark me-2">Logout</button>
        </form>
    <% } %>
    <a href="/pages/cart.jsp" class="btn btn-outline-primary text-dark">Cart</a>
</div>
