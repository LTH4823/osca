<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
    <title>마이페이지</title>

    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet"/>
    <link href="../../../resources/css/style.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <link href="../../../resources/css/custom.css" rel="stylesheet"/>


</head>
<body class="sb-nav-fixed">

<%@ include file="/WEB-INF/includes/navbar.jsp" %>

<div id="layoutSidenav_content">
    <div class="container-fluid px-4 customFlexRow h-100">


        <div class="mypageBackground card w-75 h-100 customFlexColumn">
            <div class="row mt-3 customFlexRowAround">

                <div class="cover-bg p-3 p-lg-4 text-white">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="card">
                                <h5 class="card-header text-black">권한</h5>
                                <div class="card-body text-center">
                                    <c:choose>
                                        <c:when test="${company.authority == 'COMPANY'}">
                                            <img class="authImage" src="../../resources/assets/img/auth/company.png">
                                            <h3 class="text-info">시공사</h3>
                                        </c:when>
                                        <c:when test="${company.authority == 'MEMBER'}">
                                            <img class="authImage" src="../../resources/assets/img/auth/member.png">
                                            <h3 class="text-info">의뢰자</h3>
                                        </c:when>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8 mb-4 order-0">
                            <div class="card">
                                <h5 class="card-header text-black">
                                    회사정보
                                    <%--                                    <sec:authorize--%>
                                    <%--                                        access="isAuthenticated()">--%>
                                    <%--                                    <sec:authentication property="principal.comId"></sec:authentication>--%>
                                    <%--                                </sec:authorize>--%>

                                </h5>
                                <div class="d-flex align-items-end row">
                                    <div class="col-sm-5 text-center text-sm-left">
                                        <div class="card-body customFlexRow">

                                            <c:if test="${company.comProfile !=null}">

                                                <img class="card" src='/view?fileName=${company.getProfile()}'
                                                     alt="...">

                                            </c:if>

                                        </div>
                                    </div>
                                    <div class="col-sm-7">
                                        <div class="card-body">
                                            <div class="companyInfo w-100">
                                                <p class="text-black"><span>회사명: </span> ${company.comName}</p>
                                                <p class="text-black"><span>Email: </span>${company.comEmail}</p>
                                                <p class="text-black"><span>Phone: </span>${company.comPhone}</p>
                                                <p class="text-black"><span>사업자등록번호: </span>${company.businessNum}</p>
                                                <hr class="text-black">
                                                <%--                                    <p><span>분야: </span>${company.comCategory}</p>--%>
                                                <div class="w-100 customFlexRowAround">
                                                    <button type="button" class="btn btn-secondary"
                                                            data-bs-toggle="modal"
                                                            data-bs-target="#exampleModal">
                                                        회원정보 수정
                                                    </button>
                                                    <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                                            data-bs-target="#exampleModal">
                                                        회원 탈퇴
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-lg-12 order-2 order-md-3 order-lg-2 mb-4">
                            <div class="card bg-light mt-3" style="width: 100%;">
                                <h6 class="card-header text-black">소개</h6>
                                <p class="card-body text-center text-black m-2">${company.comIntro}</p>
                            </div>
                        </div>

                        <div class="col-12 col-lg-12 order-2 order-md-3 order-lg-2 mb-4">
                            <div class="">
                                <div class="row row-bordered g-0">
                                    <div class="card col-md-8">
                                        <h6 class="card-header text-black">회사주소</h6>
                                        <p class="text-black m-3"><span>${company.comAddress} </span></p>
                                        <div class="customFlexColumn">
                                            <div id="map" class="w-75 m-md-3"></div>
                                        </div>
                                    </div>
                                    <div class="card col-md-4">
                                        <h6 class="card-header text-black">사업자등록증</h6>
                                        <div class="card-body">
                                            <c:if test="${company.comProfile !=null}">
                                                <img src='/view?fileName=${company.businessCheck}' alt="...">
                                            </c:if>
                                            <div class="text-center">
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
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
<!-- services 라이브러리 불러오기 -->
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1e60987ffadf27e61dcc9c42a7a4a15c&libraries=services,clusterer,drawing"></script>

<script type="text/javascript" src="../../resources/js/kakaomap.js"></script>


<script>
    const delForm = document.querySelector(".delForm");
    <%--delForm.addEventListener("click", (e) => {--%>
    <%--    delForm.setAttribute("action", `/remove/${comId}`)--%>
    <%--    delForm.submit()--%>
    <%--}, false)--%>
    const delBtn = document.querySelector(".delBtn");
    delBtn.addEventListener("click", (e) => {
        delForm.setAttribute("action", `/remove/${company.comId}`)
        delForm.submit()
    }, false)

</script>

</body>
</html>
