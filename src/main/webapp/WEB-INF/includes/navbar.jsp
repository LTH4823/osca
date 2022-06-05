<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


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
            <li class="nav-item"><a class="nav-link"><sec:authentication property="principal.comId"></sec:authentication></a></li>
        </sec:authorize>

        <sec:authorize access="isAnonymous()">
            <li class="nav-item"><a class="nav-link" href="/customLogin">Login</a></li>
        </sec:authorize>

        <sec:authorize access="isAuthenticated()">
            <li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
        </sec:authorize>


    </ul>
</nav>
<div id="layoutSidenav">
    <div id="layoutSidenav_nav">

        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <div class="navSide sb-sidenav-menu border-end">
                <div class="nav">
                    <div class="sideTitle sb-sidenav-menu-heading border-bottom" ><i class="sideIcon fas fa-tachometer-alt"></i><span>서비스</span></div>
                    <a class="nav-link border-bottom" href="/mypage/">
                        <div class="sb-nav-link-icon"><i class="fas "></i></div>
                        <span class="">Mypage</span>
                    </a>
                    <a class="nav-link border-bottom" href="/auction/">
                        <div class="sb-nav-link-icon"><i class="fas "></i></div>
                        <span class="">Auction</span>
                    </a>
                    <a class="nav-link border-bottom" href="/workers/">
                        <div class="sb-nav-link-icon"><i class="fas "></i></div>
                        <span class="">Workers</span>
                    </a>

                    <div class="sideTitle sb-sidenav-menu-heading border-bottom"><i class="sideIcon fa-solid fa-table-list"></i><span>계약목록</span></div>
                    <%--                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"--%>
                    <%--                       data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">--%>
                    <%--                        <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>--%>
                    <%--                        Layouts--%>
                    <%--                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>--%>
                    <%--                    </a>--%>
                    <a class="nav-link border-bottom" href="/contract/add/list">
                        <div class="sb-nav-link-icon"><i class="fas "></i></div>
                        <span class="">생성 계약</span>
                    </a>
                    <a class="nav-link border-bottom" href="/contract/nego/list">
                        <div class="sb-nav-link-icon"><i class="fas "></i></div>
                        <span class="">계약 협상</span>
                    </a>
                    <a class="nav-link border-bottom" href="/contract/progress/list">
                        <div class="sb-nav-link-icon"><i class="fas "></i></div>
                        <span class="">계약 현황</span>
                    </a>
                    <%--                    <a class="nav-link" href="">--%>
                    <%--                        <div class="sb-nav-link-icon"><i class="fas "></i></div>--%>
                    <%--                        계약 완료--%>
                    <%--                    </a> <a class="nav-link" href="">--%>
                    <%--                    <div class="sb-nav-link-icon"><i class="fas "></i></div>--%>
                    <%--                    계약 파기--%>
                    <%--                </a>--%>

                </div>
            </div>
            <div class="sb-sidenav-footer">
                <div class="small">궁금하다면?</div>
                <a>ChatBot line</a>
            </div>
        </nav>
    </div>