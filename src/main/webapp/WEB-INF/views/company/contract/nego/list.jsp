<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <li nk href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet"/>
    <link href="../../../../../resources/css/style.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">

<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <!-- Navbar Brand-->
    <a class="navbar-brand ps-3" href="index.html"><span style="margin: 0em 0em 0em 1em ">O.S.C.A</span></a>
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
            <li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
        </sec:authorize>


    </ul>
</nav>
<div id="layoutSidenav">
    <div id="layoutSidenav_nav">

        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <div class="sb-sidenav-menu">
                <div class="nav">
                    <div class="sb-sidenav-menu-heading">서비스</div>
                    <a class="nav-link" href="/company/mypage/">
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                        Mypage
                    </a>
                    <a class="nav-link" href="/company/auction/">
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                        Auction
                    </a>
                    <a class="nav-link" href="/company/workers/">
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                        Workers
                    </a>

                    <div class="sb-sidenav-menu-heading">계약목록</div>
                    <%--                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"--%>
                    <%--                       data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">--%>
                    <%--                        <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>--%>
                    <%--                        Layouts--%>
                    <%--                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>--%>
                    <%--                    </a>--%>
                    <a class="nav-link" href="">
                        <div class="sb-nav-link-icon"><i class="fas "></i></div>
                        생성 계약
                    </a>
                    <a class="nav-link" href="">
                        <div class="sb-nav-link-icon"><i class="fas "></i></div>
                        계약 협상
                    </a>
                    <a class="nav-link" href="">
                        <div class="sb-nav-link-icon"><i class="fas "></i></div>
                        계약 진행
                    </a>
                    <a class="nav-link" href="">
                        <div class="sb-nav-link-icon"><i class="fas "></i></div>
                        계약 완료
                    </a> <a class="nav-link" href="">
                    <div class="sb-nav-link-icon"><i class="fas "></i></div>
                    계약 파기
                </a>
                    <div class="sb-sidenav-menu-heading">회원정보</div>
                    <a class="nav-link" href="">
                        <div class="sb-nav-link-icon"><i class="fas "></i></div>
                        회원정보 수정
                    </a>
                    <a class="nav-link" data-bs-toggle="modal" data-bs-target="#exampleModal" href="">
                        <div class="sb-nav-link-icon"><i class="fas"></i></div>
                        회원탈퇴
                    </a>
                </div>
            </div>
            <div class="sb-sidenav-footer">
                <div class="small">궁금하다면?</div>
                <a>ChatBot line</a>
            </div>
        </nav>





    </div>
</div>

<%@ include file="/WEB-INF/includes/footer.jsp" %>
</body>
</html>
