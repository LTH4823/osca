<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
    <link href="../../resources/css/style.css" rel="stylesheet"/>
    <!-- googlefont -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
    <!-- reset -->
    <link href="../../resources/css/reset.css" rel="stylesheet"/>
    <!-- custom -->
    <link href="../../resources/css/custom.css" rel="stylesheet"/>

</head>

<body>
<div class="loginBody" id="page-content-wrapper">

    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-primary bg-gradient shadow-sm">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="/index.jsp"><span style="margin: 0em 0em 0em 1em ">O.S.C.A</span></a>

        <!-- Navbar-->
        <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
            <li class="nav-item"><a class="nav-link " href="/">Home</a></li>
            <sec:authorize access="isAnonymous()">
                <li class="nav-item"><a class="nav-link" href="/customLogin">Login</a></li>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
            </sec:authorize>
        </ul>
    </nav>
    <section>
        <div class="container py-5">
            <div class="row d-flex align-items-center justify-content-center h-100">
                                <div class="col-md-8 col-lg-7 col-xl-6">
                                    <%--                    <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.svg"--%>
                                    <%--                         class="loginImg img-fluid" alt="Phone image">--%>
                                    <img src="../../resources/img/323.svg"
                                         class="loginImg img-fluid" alt="Phone image">
                                </div>
                <div class="loginForm card col-md-7 col-lg-5 col-xl-5 offset-xl-1">
                        <form class="actionForm text-center" action="/login" method="post">
                            <p class="loginLogo">O.S.C.A</P>

                            <div class="form-outline w-70 p-3">
                                <input type="text" name="username" class="loginId form-control form-control-lg"
                                       placeholder="아이디"/>
                                <input type="password" name="password" class="loginPw form-control form-control-lg"
                                       placeholder="비밀번호"/>
                            </div>

                            <div class="rememberLine text-start">
                                <input type="checkbox" class="rememberInput text-start" name="remember-me"
                                       value="off"><span class="rememberWord">로그인 상태유지</span>
                            </div>
                            <div class="d-flex justify-content-around align-items-center mb-4">
                                <div class="loginAtags customRow">
                                    <a href="/register">회원가입</a>
                                    <a class="" data-bs-toggle="modal"
                                       data-bs-target="#exampleModal2">아이디/비밀번호 찾기
                                    </a>
                                </div>
                            </div>

                            <!-- Submit button -->
                            <div class="submitBtns">
                                <button type="button"
                                        class="customLoginBtn btn  btn-lg btn-block col-6 mx-auto"><span
                                        class="text-white">로그인</span>
                                </button>
                                <a class="customKakaoBtn btn  btn-lg btn-block col-6 mx-auto" href="#!" role="button">
                                    <i class="fab me-2"></i>Kakao
                                </a>
                            </div>
                        </form>

                        <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel2">비밀번호 찾기</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body customFlexRowAround">

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
                                        </button>
                                        <button type="button" class="btn btn-primary">Save changes</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
<%--        </div>--%>
    </section>
    <footer>

    </footer>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="../../resources/js/script.js"></script>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/67818242f4.js" crossorigin="anonymous"></script>

<script>

    document.querySelector(".customLoginBtn").addEventListener("click", (e)=>{
        const actionForm = document.querySelector(".actionForm")
        actionForm.submit()
    },false)

</script>

</body>
</html>