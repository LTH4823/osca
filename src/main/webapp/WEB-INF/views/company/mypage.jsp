<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
    <title>마이페이지</title>

    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet"/>
    <link href="../../../resources/css/style.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

</head>
<body class="sb-nav-fixed">

<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <!-- Navbar Brand-->
    <a class="navbar-brand ps-3" href="index.html">O.C.S.A</a>
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
                    <a class="nav-link" href="index.html">
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                        Auction
                    </a>
                    <a class="nav-link" href="index.html">
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
                        생성한 계약
                    </a>
                    <a class="nav-link" href="">
                        <div class="sb-nav-link-icon"><i class="fas "></i></div>
                        계약 진행중
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
                    <a class="nav-link" href="">
                        <div class="sb-nav-link-icon"><i class="fas "></i></div>
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

    <div id="layoutSidenav_content">

        ${company}

        <form action="/company/modify/${company.comId}" class="modForm" method="post">
            <input type="text" name="comId" value="<c:out value="${company.comId}"/>">
            <input type="text" name="comName" value="<c:out value="${company.comName}"/>">
            <button>회원정보 수정</button>
        </form>


        <form action="/company/remove/${company.comId}}" class="delForm" method="post">
            <button>회원탈퇴</button>
        </form>

        <form action=""></form>


    </div>

</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="../../../resources/js/script.js"></script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>


<script>
    const delForm = document.querySelector(".delForm");

    delForm.addEventListener("click", (e) => {
        delForm.setAttribute("action", `/company/remove/${comId}`)
        delForm.submit()
    }, false)

</script>

</body>
</html>
