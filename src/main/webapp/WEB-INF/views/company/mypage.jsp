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

<%@ include file="/WEB-INF/includes/navbar.jsp" %>

        <div id="layoutSidenav_content">
            <div class="container-fluid px-4">

                <h1 style="margin: 0.5em 0em 0em 0.5em">MyPage</h1>

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
                            <div width="500" height="300"
                                 style="display: block; height: 300px; width: 500px;"
                                 class="chartjs-render-monitor">
                                <p class="d-block p-2 bg-primary text-white text-end"><span>계약 생성 건수: 0</span></p>
                                <p class="d-block p-2 bg-primary text-white text-end"><span>계약 협상 건수: 0</span></p>
                                <p class="d-block p-2 bg-primary text-white text-end"><span>계약 진행 건수: 0</span></p>
                                <p class="d-block p-2 bg-primary text-white text-end"><span>계약 완료 건수: 0</span></p>
                                <p class="d-block p-2 bg-primary text-white text-end"><span>계약 파기 건수: 0</span></p>
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
                            <div id="" width="500" height="300"
                                 style="display: block; height: 300px; width: 500px;"
                                 class="chartjs-render-monitor">
                                <div  class="row">
                                    <div class="">
                                        <c:if test="${company.comProfile !=null}">
                                            <img src='/view?fileName=${company.getProfile()}' alt="zxcv">
                                        </c:if>
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
                            <div width="500" height="227"
                                 style="display: block; height: 227px; width: 500px;"
                                 class="chartjs-render-monitor"><p>${company.comAddress}</p>
                                <div class="map" style=" margin: 0em 0em 0em 0em; height: 180px; width: 540px;"></div>
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
                            <div id="myBarChart" width="500" height="227"
                                 style="display: block; height: 227px; width: 500px;"
                                 class="chartjs-render-monitor"><p>${company.businessNum}</p>
                            <c:if test="${company.businessCheck !=null}">
                                <img src='/view?fileName=${company.businessCheck}' alt="zxcv">
                            </c:if>
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
        <img src="/view?fileName=\2022/05/24/e53a029f-be9a-46b0-b6a8-ad65329ed8fc_hguc 바운드독.jpg" alt="">
    </div>
</div>

<%@ include file="/WEB-INF/includes/footer.jsp" %>

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
