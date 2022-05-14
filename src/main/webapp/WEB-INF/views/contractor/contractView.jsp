<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Small Business - Start Bootstrap Template</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../css/styles.css" rel="stylesheet" />
    <link href="../css/customStyle.css" rel="stylesheet">
</head>

<body>
<!-- Responsive navbar-->
<!-- Top navigation-->
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
                <li class="nav-item"><a class="nav-link " href="#!">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">Auction</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">Workers</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">MyRoom</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">Logout</a></li>

            </ul>
        </div>
    </div>
</nav>
<!-- Page Content-->
<div class="container ">
    <!-- Heading Row-->
    <div class="row gx-4 gx-lg-5 align-items-center my-5">

        <div class=" col-lg-5 customFlexColumn"><img class="contractViewMainImg img-fluid rounded mb-4 mb-lg-0"
                                                     src="../img/공사 결과/jakob-owens-nQBc6clG3X4-unsplash.jpg" alt="..." /></div>

        <div class="card col-lg-5  contractViewContet">
            <h3 class="card text-center">어허빌라 주방시공</h3>

            <div class="d-flex flex-wrap text-center contractDate">
                <div class="card-body text-center">
                    <label for="input-date">시작일</label>
                    <input id="input-date" type="date" value="2014-10-31">
                    <span class="result"></span>
                </div>
                <div class="card-body text-center">
                    <label for="input-date">마감일</label>
                    <input id="input-date" type="date" value="2014-10-31">
                    <span class="result"></span>
                </div>
            </div>

            <div class="card">
                <h5>주요업무</h5>
                <p>
                    어허빌라 주방시공
                    주변 장애물 존재
                    엘리베이터 사용가능
                    내부 청소 희망
                </p>
            </div>
            <div class="card">
                <h5>시공장소</h5>
                <div class="contractMap"></div>
            </div>
            <div class="card">
                <h5>업무조건</h5>
                <p>
                    어허빌라 주방시공
                    주변 장애물 존재
                    엘리베이터 사용가능
                    내부 청소 희망
                </p>
            </div>
            <div>
                <button class="btn btn-secondary">의뢰자정보</button>
                <button class="btn btn-primary">입찰하기</button>
            </div>
            <!-- <iframe class="card customPDFSmall" src="../asset/01.pdf"></iframe>
            <a class="btn btn-primary" href="#!">Call to Action!</a> -->
        </div>
    </div>

    <!-- Footer-->
    <!-- <footer class="py-5 bg-dark">
        <div class="container px-4 px-lg-5">
            <p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p>
        </div>
    </footer> -->
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>

</html>