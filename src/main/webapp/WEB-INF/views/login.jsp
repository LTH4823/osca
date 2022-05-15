<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>

    <title>로그인</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="../assets/favicon.ico"/>
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../../css/styles.css" rel="stylesheet"/>
    <!-- googlefont -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
    <!-- reset -->
    <link href="../../css/reset.css" rel="stylesheet"/>
    <!-- custom -->
    <link href="../../css/customStyle.css" rel="stylesheet"/>
</head>

<body>
<div class="loginBody" id="page-content-wrapper">
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
    <section>
        <div class="container py-5 h-100">
            <div class="row d-flex align-items-center justify-content-center h-100">
                <div class="col-md-8 col-lg-7 col-xl-6">
                    <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.svg"
                         class="loginImg img-fluid" alt="Phone image">
                </div>
                <div class="card customCard customLoginForm col-md-7 col-lg-5 col-xl-5 offset-xl-1">

                    <div class="loginFrom">
                        <form class="text-center">
                            <p class="loginLogo">O.S.C.A</P>
                            <!-- Email input -->
                            <div class="form-outline w-70 p-3">
                                <input type="email" class="loginEmail form-control form-control-lg"
                                       placeholder="아이디 또는 이메일"/>
                            </div>

                            <!-- Password input -->
                            <div class="form-outline  w-70 p-3">
                                <input type="password" class="loginPW form-control form-control-lg"
                                       placeholder="비밀번호"/>

                            </div>

                            <div class="d-flex justify-content-around align-items-center mb-4">
                                <!-- Checkbox -->
                                <!-- <div class="loginCheck form-check"> -->
                                <!-- <div class="customFlexRowAround">
                                        <label class="form-check-label" for="form1Example3"> Remember me?</label>
                                        <input class="form-check-input" type="checkbox" value=""
                                            id="form1Example3" />
                                    </div> -->
                                <div class="loginAtags customRow">
                                    <a href="#!">회원가입</a>
                                    <a href="#!">비밀번호 찾기</a>
                                </div>
                                <!-- </div> -->

                            </div>

                            <!-- Submit button -->
                            <button type="submit"
                                    class="customLoginBtn btn  btn-lg btn-block col-6 mx-auto">로그인
                            </button>
                            <a class="customKakaoBtn btn  btn-lg btn-block col-6 mx-auto" href="#!" role="button">
                                <i class="fab me-2"></i>Kakao
                            </a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <footer>

    </footer>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="../js/scripts.js"></script>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/67818242f4.js" crossorigin="anonymous"></script>
</body>

</html>