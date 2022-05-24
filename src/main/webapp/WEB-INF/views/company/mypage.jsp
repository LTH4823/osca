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

    <div id="layoutSidenav_content">
        <h1 style="margin: 0.5em 0em 0em 0.5em">MyPage</h1>


        <div class="container-fluid px-4">

            <div class="row">
                <div class="col-xl-6">
                    <div class="card mb-4">
                        <div class="card-header">
                            <svg class="svg-inline--fa fa-chart-area me-1" aria-hidden="true" focusable="false"
                                 data-prefix="fas" data-icon="chart-area" role="img"
                                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg="">
                                <path fill="currentColor"
                                      d="M64 400C64 408.8 71.16 416 80 416H480C497.7 416 512 430.3 512 448C512 465.7 497.7 480 480 480H80C35.82 480 0 444.2 0 400V64C0 46.33 14.33 32 32 32C49.67 32 64 46.33 64 64V400zM128 320V236C128 228.3 130.8 220.8 135.9 214.1L215.3 124.2C228.3 109.4 251.4 109.7 263.1 124.8L303.2 171.8C312.2 182.7 328.6 183.4 338.6 173.4L359.6 152.4C372.7 139.3 394.4 140.1 406.5 154.2L472.3 231C477.3 236.8 480 244.2 480 251.8V320C480 337.7 465.7 352 448 352H159.1C142.3 352 127.1 337.7 127.1 320L128 320z"></path>
                            </svg><!-- <i class="fas fa-chart-area me-1"></i> Font Awesome fontawesome.com -->
                            실적
                        </div>
                        <div class="card-body">
                            <div width="569" height="227"
                                 style="display: block; height: 227px; width: 569px;"
                                 class="chartjs-render-monitor">
                                <p class="d-block p-2 bg-primary text-white text-end">생성 계약 건수: </p>
                                <p class="d-block p-2 bg-primary text-white text-end">협상 계약 건수: </p>
                                <p class="d-block p-2 bg-primary text-white text-end">계약 완료 건수: </p>
                                <p class="d-block p-2 bg-primary text-white text-end">계약 파기 건수: </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-6">
                    <div class="card mb-4">
                        <div class="card-header">
                            <svg class="svg-inline--fa fa-chart-bar me-1" aria-hidden="true" focusable="false"
                                 data-prefix="fas" data-icon="chart-bar" role="img"
                                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg="">
                                <path fill="currentColor"
                                      d="M32 32C49.67 32 64 46.33 64 64V400C64 408.8 71.16 416 80 416H480C497.7 416 512 430.3 512 448C512 465.7 497.7 480 480 480H80C35.82 480 0 444.2 0 400V64C0 46.33 14.33 32 32 32zM128 128C128 110.3 142.3 96 160 96H352C369.7 96 384 110.3 384 128C384 145.7 369.7 160 352 160H160C142.3 160 128 145.7 128 128zM288 192C305.7 192 320 206.3 320 224C320 241.7 305.7 256 288 256H160C142.3 256 128 241.7 128 224C128 206.3 142.3 192 160 192H288zM416 288C433.7 288 448 302.3 448 320C448 337.7 433.7 352 416 352H160C142.3 352 128 337.7 128 320C128 302.3 142.3 288 160 288H416z"></path>
                            </svg><!-- <i class="fas fa-chart-bar me-1"></i> Font Awesome fontawesome.com -->
                            회사 정보
                        </div>
                        <div class="card-body">
                            <div id="" width="569" height="227"
                                 style="display: block; height: 227px; width: 569px;"
                                 class="chartjs-render-monitor">
                                <div  class="row">
                                    <div class="">
                                        <p>${company.comProfile}</p>
                                    </div>
                                    <div  class="">
                                        <p>${company.comName}</p>
                                        <p>${company.comEmail}</p>
                                        <p>${company.comPhone}</p>
                                        <p>${company.comIntro}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xl-6">
                    <div class="card mb-4">
                        <div class="card-header">
                            <svg class="svg-inline--fa fa-chart-area me-1" aria-hidden="true" focusable="false"
                                 data-prefix="fas" data-icon="chart-area" role="img"
                                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg="">
                                <path fill="currentColor"
                                      d="M64 400C64 408.8 71.16 416 80 416H480C497.7 416 512 430.3 512 448C512 465.7 497.7 480 480 480H80C35.82 480 0 444.2 0 400V64C0 46.33 14.33 32 32 32C49.67 32 64 46.33 64 64V400zM128 320V236C128 228.3 130.8 220.8 135.9 214.1L215.3 124.2C228.3 109.4 251.4 109.7 263.1 124.8L303.2 171.8C312.2 182.7 328.6 183.4 338.6 173.4L359.6 152.4C372.7 139.3 394.4 140.1 406.5 154.2L472.3 231C477.3 236.8 480 244.2 480 251.8V320C480 337.7 465.7 352 448 352H159.1C142.3 352 127.1 337.7 127.1 320L128 320z"></path>
                            </svg><!-- <i class="fas fa-chart-area me-1"></i> Font Awesome fontawesome.com -->
                            회사주소
                        </div>
                        <div class="card-body">
                            <div width="569" height="227"
                                 style="display: block; height: 227px; width: 569px;"
                                 class="chartjs-render-monitor"><p>${company.comAddress}</p>
                                <div class="map" style=" margin: 0em 0em 0em 3em; height: 180px; width: 540px;"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-6">
                    <div class="card mb-4">
                        <div class="card-header">
                            <svg class="svg-inline--fa fa-chart-bar me-1" aria-hidden="true" focusable="false"
                                 data-prefix="fas" data-icon="chart-bar" role="img"
                                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg="">
                                <path fill="currentColor"
                                      d="M32 32C49.67 32 64 46.33 64 64V400C64 408.8 71.16 416 80 416H480C497.7 416 512 430.3 512 448C512 465.7 497.7 480 480 480H80C35.82 480 0 444.2 0 400V64C0 46.33 14.33 32 32 32zM128 128C128 110.3 142.3 96 160 96H352C369.7 96 384 110.3 384 128C384 145.7 369.7 160 352 160H160C142.3 160 128 145.7 128 128zM288 192C305.7 192 320 206.3 320 224C320 241.7 305.7 256 288 256H160C142.3 256 128 241.7 128 224C128 206.3 142.3 192 160 192H288zM416 288C433.7 288 448 302.3 448 320C448 337.7 433.7 352 416 352H160C142.3 352 128 337.7 128 320C128 302.3 142.3 288 160 288H416z"></path>
                            </svg><!-- <i class="fas fa-chart-bar me-1"></i> Font Awesome fontawesome.com -->
                            사업자등록번호

                        </div>
                        <div class="card-body">
                            <div id="myBarChart" width="569" height="227"
                                 style="display: block; height: 227px; width: 569px;"
                                 class="chartjs-render-monitor"><p>${company.businessNum}</p>
                                <p>${company.businessCheck}</p></div>
                        </div>
                    </div>
                </div>
            </div>

        </div>


        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">회원탈퇴하기</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>탈퇴 후 서비스 이용 및 생성 진행 완료 한 계약에 관하여 정보를 열람하거나 확인이 어려우실 수 있습니다.</p>
                        <p>회원을 탈퇴 하시겠습니까?</p>
                        <form action="/company/remove/${company.comId}}" class="delForm" method="post">
                        </form>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-danger delBtn">탈퇴하기</button>
                    </div>
                </div>
            </div>
        </div>
<%--        <form action="/company/modify/${company.comId}" class="modForm" method="post">--%>
<%--            <input type="text" name="comId" value="<c:out value="${company.comId}"/>">--%>
<%--            <input type="text" name="comName" value="<c:out value="${company.comName}"/>">--%>
<%--            <button>회원정보 수정</button>--%>
<%--        </form>--%>
        <p></p>

    </div>
</div>
<footer>


</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="../../../resources/js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
        crossorigin="anonymous"></script>
<%--카카오 맵 api--%>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1e60987ffadf27e61dcc9c42a7a4a15c"></script>
<script type="text/javascript" src="../../../resources/js/kakaomap.js"></script>


<script>
    const delForm = document.querySelector(".delForm");

    <%--delForm.addEventListener("click", (e) => {--%>
    <%--    delForm.setAttribute("action", `/company/remove/${comId}`)--%>
    <%--    delForm.submit()--%>
    <%--}, false)--%>

    const delBtn = document.querySelector(".delBtn");

    delBtn.addEventListener("click", (e) => {
        delForm.setAttribute("action", `/company/remove/${company.comId}`)
        delForm.submit()
    }, false)

</script>

</body>
</html>
