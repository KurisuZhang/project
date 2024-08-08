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
            <%-- Include userStatus.jsp here --%>
            <%@ include file="../util/userStatus.jsp" %>
        </div>
    </div>
</nav>