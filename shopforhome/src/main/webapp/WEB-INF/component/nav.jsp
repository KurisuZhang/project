<nav class="navbar navbar-expand-lg py-0">
    <div class="container-fluid">
        <a class="navbar-brand fancy-brand" href="/">ShopForHome</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
                <a class="nav-link" href="/product?category=bed">Bed</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/product?category=bathroom">Bathroom</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/product?category=rug">Rug</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/product?category=pillow">Pillow</a>
            </li>
        </ul>
        
            <!-- Centered Search Form -->
            <form class="d-flex mx-auto" action="/product/search" method="get">
                <input class="form-control me-2" type="search" name="query" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success me-2" type="submit">Search</button>
            </form>
           
            <%-- Include userStatus.jsp here --%>
            <%@ include file="../util/userStatus.jsp" %>
    </div>
</nav>