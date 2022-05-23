<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Main</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/resources/css/reset.css" rel="stylesheet">
    <link href="/resources/css/style.css" rel="stylesheet" />
    <link href="/resources/css/customStyle.css" rel="stylesheet" />
</head>

<body>

<nav class=" navbar customNavbar navbar-expand-lg navbar-light  border-bottom">
    <div class="navbarBody container-fluid">

        <a class="navbarTitle btn fs-2" id="sidebarToggle">
            O.S.C.A</a>

        <div class="navbarToggleBtn ">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation"><span
                    class="navbarToggle navbar-toggler-icon"></span></button>
        </div>
        <div class="navbarToggleArea collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                <li class="nav-item"><a class="nav-link " href="/">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="/company/auction/">Auction</a></li>
                <li class="nav-item"><a class="nav-link" href="/company/workers/">Workers</a></li>

                <sec:authorize access="isAuthenticated()">
                <li class="nav-item"><a class="nav-link" href="/company/mypage/${companyDTO.comId}">MyPage</a></li>
                </sec:authorize>

                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item"><a class="nav-link"><sec:authentication property="principal.comId"></sec:authentication></a></li>
                </sec:authorize>

                <sec:authorize access="isAnonymous()">
                    <li class="nav-item"><a class="nav-link" href="/customLogin">Login</a></li>
                </sec:authorize>

                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
                </sec:authorize>


            </ul>
        </div>
    </div>
</nav>

<!-- Header-->
<header class="bg-secondary bg-gradient py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="mainLogo text-center text-white">
            <h1 class="display-4 fw-bolder">OSCA</h1>
            <p class="lead fw-normal text-white-50 mb-0">체납 걱정 No! 찾는 수고 No!! 믿을 수 있는 계약 Yes!!!</p>
        </div>
    </div>
</header>
<!-- Section-->
<section class="py-5 customFlexColumn">

<%--    <nav class="navbar navbar-expand-lg card workersSelect navbar-light w-50 ">--%>
<%--        <div class="container-fluid">--%>
<%--            <a class="navbar-brand" href="#">Navbar</a>--%>
<%--            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"--%>
<%--                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"--%>
<%--                    aria-expanded="false" aria-label="Toggle navigation">--%>
<%--                <span class="navbar-toggler-icon"></span>--%>
<%--            </button>--%>
<%--            <div class="collapse navbar-collapse" id="">--%>
<%--                <ul class="navbar-nav me-auto mb-2 mb-lg-0">--%>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link active" aria-current="page" href="#">Home</a>--%>
<%--                    </li>--%>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link" href="#">Link</a>--%>
<%--                    </li>--%>
<%--                    <li class="nav-item dropdown">--%>
<%--                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"--%>
<%--                           data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--                            Dropdown--%>
<%--                        </a>--%>
<%--                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">--%>
<%--                            <li><a class="dropdown-item" href="#">Action</a></li>--%>
<%--                            <li><a class="dropdown-item" href="#">Another action</a></li>--%>
<%--                            <li>--%>
<%--                                <hr class="dropdown-divider">--%>
<%--                            </li>--%>
<%--                            <li><a class="dropdown-item" href="#">Something else here</a></li>--%>
<%--                        </ul>--%>
<%--                    </li>--%>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--                <form class="d-flex">--%>
<%--                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">--%>
<%--                    <button class="btn btn-outline-success" type="submit">Search</button>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </nav>--%>
<%--    <div class="container px-4 px-lg-5 mt-5">--%>
<%--        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">--%>
<%--            <div class="col mb-5">--%>
<%--                <div class="card h-100">--%>
<%--                    <!-- Product image-->--%>
<%--                    <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />--%>
<%--                    <!-- Product details-->--%>
<%--                    <div class="card-body p-4">--%>
<%--                        <div class="text-center">--%>
<%--                            <!-- Product name-->--%>
<%--                            <h5 class="fw-bolder">Fancy Product</h5>--%>
<%--                            <!-- Product price-->--%>
<%--                            $40.00 - $80.00--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- Product actions-->--%>
<%--                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">--%>
<%--                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col mb-5">--%>
<%--                <div class="card h-100">--%>
<%--                    <!-- Sale badge-->--%>
<%--                    <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale--%>
<%--                    </div>--%>
<%--                    <!-- Product image-->--%>
<%--                    <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />--%>
<%--                    <!-- Product details-->--%>
<%--                    <div class="card-body p-4">--%>
<%--                        <div class="text-center">--%>
<%--                            <!-- Product name-->--%>
<%--                            <h5 class="fw-bolder">Special Item</h5>--%>
<%--                            <!-- Product reviews-->--%>
<%--                            <div class="d-flex justify-content-center small text-warning mb-2">--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                            </div>--%>
<%--                            <!-- Product price-->--%>
<%--                            <span class="text-muted text-decoration-line-through">$20.00</span>--%>
<%--                            $18.00--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- Product actions-->--%>
<%--                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">--%>
<%--                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col mb-5">--%>
<%--                <div class="card h-100">--%>
<%--                    <!-- Sale badge-->--%>
<%--                    <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale--%>
<%--                    </div>--%>
<%--                    <!-- Product image-->--%>
<%--                    <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />--%>
<%--                    <!-- Product details-->--%>
<%--                    <div class="card-body p-4">--%>
<%--                        <div class="text-center">--%>
<%--                            <!-- Product name-->--%>
<%--                            <h5 class="fw-bolder">Sale Item</h5>--%>
<%--                            <!-- Product price-->--%>
<%--                            <span class="text-muted text-decoration-line-through">$50.00</span>--%>
<%--                            $25.00--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- Product actions-->--%>
<%--                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">--%>
<%--                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col mb-5">--%>
<%--                <div class="card h-100">--%>
<%--                    <!-- Product image-->--%>
<%--                    <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />--%>
<%--                    <!-- Product details-->--%>
<%--                    <div class="card-body p-4">--%>
<%--                        <div class="text-center">--%>
<%--                            <!-- Product name-->--%>
<%--                            <h5 class="fw-bolder">Popular Item</h5>--%>
<%--                            <!-- Product reviews-->--%>
<%--                            <div class="d-flex justify-content-center small text-warning mb-2">--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                            </div>--%>
<%--                            <!-- Product price-->--%>
<%--                            $40.00--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- Product actions-->--%>
<%--                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">--%>
<%--                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col mb-5">--%>
<%--                <div class="card h-100">--%>
<%--                    <!-- Sale badge-->--%>
<%--                    <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale--%>
<%--                    </div>--%>
<%--                    <!-- Product image-->--%>
<%--                    <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />--%>
<%--                    <!-- Product details-->--%>
<%--                    <div class="card-body p-4">--%>
<%--                        <div class="text-center">--%>
<%--                            <!-- Product name-->--%>
<%--                            <h5 class="fw-bolder">Sale Item</h5>--%>
<%--                            <!-- Product price-->--%>
<%--                            <span class="text-muted text-decoration-line-through">$50.00</span>--%>
<%--                            $25.00--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- Product actions-->--%>
<%--                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">--%>
<%--                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col mb-5">--%>
<%--                <div class="card h-100">--%>
<%--                    <!-- Product image-->--%>
<%--                    <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />--%>
<%--                    <!-- Product details-->--%>
<%--                    <div class="card-body p-4">--%>
<%--                        <div class="text-center">--%>
<%--                            <!-- Product name-->--%>
<%--                            <h5 class="fw-bolder">Fancy Product</h5>--%>
<%--                            <!-- Product price-->--%>
<%--                            $120.00 - $280.00--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- Product actions-->--%>
<%--                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">--%>
<%--                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col mb-5">--%>
<%--                <div class="card h-100">--%>
<%--                    <!-- Sale badge-->--%>
<%--                    <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale--%>
<%--                    </div>--%>
<%--                    <!-- Product image-->--%>
<%--                    <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />--%>
<%--                    <!-- Product details-->--%>
<%--                    <div class="card-body p-4">--%>
<%--                        <div class="text-center">--%>
<%--                            <!-- Product name-->--%>
<%--                            <h5 class="fw-bolder">Special Item</h5>--%>
<%--                            <!-- Product reviews-->--%>
<%--                            <div class="d-flex justify-content-center small text-warning mb-2">--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                            </div>--%>
<%--                            <!-- Product price-->--%>
<%--                            <span class="text-muted text-decoration-line-through">$20.00</span>--%>
<%--                            $18.00--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- Product actions-->--%>
<%--                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">--%>
<%--                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col mb-5">--%>
<%--                <div class="card h-100">--%>
<%--                    <!-- Product image-->--%>
<%--                    <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />--%>
<%--                    <!-- Product details-->--%>
<%--                    <div class="card-body p-4">--%>
<%--                        <div class="text-center">--%>
<%--                            <!-- Product name-->--%>
<%--                            <h5 class="fw-bolder">Popular Item</h5>--%>
<%--                            <!-- Product reviews-->--%>
<%--                            <div class="d-flex justify-content-center small text-warning mb-2">--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                            </div>--%>
<%--                            <!-- Product price-->--%>
<%--                            $40.00--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- Product actions-->--%>
<%--                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">--%>
<%--                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <nav aria-label="Page navigation customPagination">--%>
<%--        <ul class="pagination">--%>
<%--            <li class="page-item">--%>
<%--                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">이전</a>--%>
<%--            </li>--%>
<%--            <li class="page-item"><a class="page-link" href="#">1</a></li>--%>


<%--            <li class="page-item">--%>
<%--                <a class="page-link" href="#">다음</a>--%>
<%--            </li>--%>
<%--        </ul>--%>
<%--    </nav>--%>

</section>
<!-- Footer-->
<!-- <footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p>
    </div>
</footer> -->
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/resources/js/script.js"></script>
</body>

</html>