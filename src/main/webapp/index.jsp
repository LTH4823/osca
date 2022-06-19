<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Main</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico"/>
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/resources/css/reset.css" rel="stylesheet">
    <link href="/resources/css/style.css" rel="stylesheet"/>
    <link href="/resources/css/custom.css" rel="stylesheet"/>
</head>

<body class="container-fluid w-100 h-100">


    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-primary bg-gradient shadow-sm">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="/index.jsp"><span style="margin: 0em 0em 0em 1em ">O.S.C.A</span></a>
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
                class="fas fa-bars"></i></button>
        <!-- Navbar-->
        <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
            <li class="nav-item"><a class="nav-link " href="/">Home</a></li>

            <%--        <sec:authorize access="isAuthenticated()">--%>
            <%--            <li class="nav-item"><a class="nav-link"><sec:authentication property="principal.comId"></sec:authentication></a></li>--%>
            <%--        </sec:authorize>--%>

            <sec:authorize access="isAuthenticated()">
                <li class="nav-item"><a class="nav-link"><sec:authentication
                        property="principal.comId"></sec:authentication></a></li>
            </sec:authorize>

            <sec:authorize access="isAnonymous()">
                <li class="nav-item"><a class="nav-link" href="/customLogin">Login</a></li>
            </sec:authorize>

            <sec:authorize access="isAuthenticated()">
                <li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
            </sec:authorize>


        </ul>
    </nav>

    <!-- Header-->
    <header class="masthead ">
        <div class="container h-100 customFlexColumn">
            <div class="mainTile w-75 text-center customFlexColumnAround">
                <div class="masthead-heading text-uppercase mt-4">O.S.C.A</div>
                <!-- <div class="masthead-subheading">믿을 수 없는 공사 입찰 견적에 대한 안정성 있는 계약 서비스</div> -->
                <div class="subheading h3 md-4">안전한 인테리어 계약 한 번의 낙찰로 시작하세요.</div>
            </div>
        </div>
    </header>



<section class="page-section h-25" id="services" style="padding: 0em;">
    <div class="customFlexColumnAround row-cols-xl-1 row-cols-sm-1 row-cols-md-1 row-cols-lg-1 h-100">

        <div class="subArea col-lg-6 col-xxl-4 h-100 w-50">
            <a style="text-decoration: none" href="/auction/">
            <div class="bg-light border-0 h-100">
                <div class="subCard subCard-auction text-center customFlexColumn text-white">
                    <div class="subTitle"><h1 class="text-center fs-4 fw-bold text-uppercase">Auction</h1></div>
                </div>
            </div>
            </a>
        </div>

        <div class="subArea col-lg-6 col-xxl-4 h-100 w-50">
            <a style="text-decoration: none" href="/workers/">
            <div class="bg-light border-0 h-100">
                <div class="subCard subCard-workers customFlexColumn text-white">
                     <div class="subTitle"><h1 class="text-center fs-4 fw-bold text-uppercase">Workers</h1></div>
                </div>
            </div>
            </a>
        </div>

        <%--        <div class="col-lg-6 col-xxl-4 h-100">--%>
        <%--            <div class="bg-light border-0 h-100">--%>
        <%--                <div class="text-center subCard subCard-question text-center customFlexColumn">--%>
        <%--                    <h1 class="fs-4 fw-bold">Q&A</h1>--%>
        <%--                    <p class="mb-0">We keep our dependencies up to date and squash bugs as they come!</p>--%>
        <%--                </div>--%>
        <%--            </div>--%>
        <%--        </div>--%>
    </div>
</section>
<!-- Footer-->
<footer class="py-3 bg-info">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; O.S.C.A 2022</p>
    </div>
</footer>

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/resources/js/script.js"></script>
</body>

</html>