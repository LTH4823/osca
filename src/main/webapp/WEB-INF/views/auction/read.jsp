<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>

<head>
    <title>옥션 상세보기</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet"/>
    <link href="../../../resources/css/style.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <link href="../../../resources/css/custom.css" rel="stylesheet"/>
</head>

<body>
<%@ include file="/WEB-INF/includes/navbar.jsp" %>
<sec:authentication property="principal" var="pinfo"/>
<div id="layoutSidenav_content" class="h-100">
    <%--    <span>${dto}</span>--%>
    <div class="container-fluid px-4">
        <div class="">

            <div class="card md-4 h-100">

                <div class="customFlexRowAround">

                    <div class="card col-md-3 m-4">
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h5>시공 이미지</h5>
                        </div>
                        <div class="card-body customFlexColumn">
                            <c:if test="${dto.conImg !=null}">
                                <img src='${dto.conImg}' alt="zxcv"/>
                            </c:if>
                        </div>

                        <div class="card-footer customFlexRowAround">
                            <button class="moreBtn btn btn-secondary">시공 이미지 더보기</button>
                        </div>
                    </div>

                    <div class="card col-md-5 m-4">
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h5>계약정보</h5>
                        </div>
                        <div class="card-body customFlexColumn">
                            <h4>계약명: ${dto.conName}</h4>
                            <p>의뢰주: ${dto.requester}</p>
                            <p>분야: ${dto.conCategory}</p>
                            <p>기간: ${dto.conStartDay} ~ ${dto.conEndDay}</p>
                            <p>주요업무: ${dto.conContent}</p>
                            <p>요구사항: ${dto.conRequest}</p>
                            <p>위치: ${dto.conName}</p>
                            <div class="map"></div>
                        </div>
                        <div class="card-footer w-100 customFlexRowAround">
<%--                            <sec:authorize access="isAuthenticated()"/>--%>
<%--                            <c:if test="${pinfo.username ne dto.requester}">--%>
                                <div class="bidBtns w-100 customFlexRowAround">
                                    <button type="button" class="comInfo btn btn-primary" data-bs-toggle="modal"
                                            data-bs-target="#exampleModal">
                                        의뢰자 정보
                                    </button>
                                    <button type="button" class="comBid btn btn-success" data-bs-toggle="modal"
                                            data-bs-target="#exampleModal2">
                                        입찰하기
                                    </button>
                                </div>
<%--                            </c:if>--%>

<%--                            <sec:authorize access="isAuthenticated()"/>--%>
<%--                            <c:if test="${pinfo.username eq dto.requester}">--%>
<%--                                <div class="controlBtns w-100 customFlexRowAround">--%>
<%--                                    <button class="modBtn btn btn-secondary">수정하기</button>--%>
<%--                                    <button class="delBtn btn btn-danger">삭제하기</button>--%>
<%--                                </div>--%>
<%--                            </c:if>--%>
                        </div>
                    </div>
                </div>

                <div class="pictures customFlexColumn h-100">
                    <%--    <c:if test="${dto.conImg != null}">--%>
                    <%--        <img src="${dto.getMain()}">--%>
                    <%--    </c:if>--%>
                </div>

                <%--    <button class="listBtn">돌아가기</button>--%>
                <form class="actionForm" action="/company/remove/${dto.conNo}" method="post"></form>

                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">회사정보</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="infoBody modal-body">
                                <div class="card ">

                                    <div class="card-body">
                                        <div class="customFlexRow">
                                            <img class="comProfile" src="" alt="...">
                                        </div>
                                        <div>
                                            <p>
                                                <span>회사명: </span> <span class="comName"></span>
                                            </p>
                                        </div>
                                        <div class="">
                                            <p>
                                                <span>소개글: </span> <span class="comIntro"></span>
                                            </p>
                                        </div>
                                        <div>
                                            <p><span>분야: </span><span class="comCategory">계단</span></p>
                                        </div>
                                        <div>
                                            <p><span>주소: </span><span class="comAddress"></span></p>
                                            <div class="map customFlexRow"
                                                 style=" margin: 0em 0em 0em 0em; height: 180px;"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer customFlexRowAround">
                                <button type="button" class="btn bg-white"><a class="phoneIcon" href=""><i
                                        class="fa-solid fa-phone"></i></a><span
                                        class="comPhone"></span></button>
                                <button type="button" class="btn bg-white"><a class="emailIcon" href=""><i
                                        class="fa-solid fa-envelope"></i></a><span
                                        class="comEmail"></span></button>
                            </div>
                        </div>
                    </div>
                </div>
            </
            >
        </div>


    </div>


    <!-- Modal -->
    <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel2">입찰</h5>

                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="infoBody modal-body">
                    <form class="bidForm" action="/bidder/add/" method="post">
                        <p>주의사항 입찰은 1회만 가능 하며, 입찰 후 변동은 어렵습니다.</p>
                        <p>입찰 가격을 입력해 주십시오.</p>

                        <input type="hidden" name="comId"
                               value="<sec:authentication property="principal.comId"></sec:authentication>">
                        <input type="hidden" name="conNo" value="${dto.conNo}">
                        <input type="text" name="price">
                        <button type="button" class="bidBtn btn btn-primary">입찰하기</button>
                    </form>
                </div>
                <%--                        <div class="modal-footer">--%>
                <%--                            --%>
                <%--                        </div>--%>
            </div>
        </div>
    </div>
</div>


<%--axios--%>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
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
<script type="text/javascript" src="../../resources/js/kakaomap.js"></script>

<script>

    const actionForm = document.querySelector(".actionForm")
    const delBtn = document.querySelector(".delBtn")
    // const listBtn = document.querySelector(".listBtn")

    if (delBtn){

        delBtn.addEventListener("click", (e) => {
            actionForm.setAttribute("action", `/company/auction/remove/${dto.conNo}`)
            actionForm.submit()
        }, false)

        document.querySelector(".modBtn").addEventListener("click", (e) => {
            self.location = `/auction/modify/${dto.conNo}${listDTO.link}`
        }, false)

    }

    document.querySelector(".bidBtn").addEventListener("click", (e) => {
        document.querySelector(".bidForm").submit()
    }, false)

    <%--listBtn.addEventListener("click", (e) => {--%>
    <%--    self.location = `/auction/list${listDTO.link}`--%>
    <%--}, false)--%>

    document.addEventListener('DOMContentLoaded',(e)=>{
        axios.get("/auction/files/${conNo}").then(
            res => {
                const arr = res.data
                let str = ""
                for (let i = 0; i < arr.length; i++) {
                    str += `<img src='/view?fileName=\${arr[i].link}' style="max-width: 700px;"><p> \${i+1}번째 시공이미지</p> `
                }
                document.querySelector(".pictures").innerHTML = str
            }
        )
    },false)

    <%--document.querySelector(".moreBtn").addEventListener("click", (e) => {--%>

    <%--    axios.get("/auction/files/${conNo}").then(--%>
    <%--        res => {--%>
    <%--            const arr = res.data--%>
    <%--            let str = ""--%>
    <%--            for (let i = 0; i < arr.length; i++) {--%>
    <%--                str += `<img src='/view?fileName=\${arr[i].link}' style="max-width: 700px;">`--%>
    <%--            }--%>
    <%--            document.querySelector(".pictures").innerHTML = str--%>
    <%--        }--%>
    <%--    )--%>
    <%--}, false)--%>


    document.querySelector(".comInfo").addEventListener("click", (e) => {

        axios.get("/info/company/${dto.requester}").then(
            result => {
                const info = result.data
                console.log(info)
                console.log(info.comName)
                // let str = ""
                // str = `<p>\${info.comName}</p> <p>\${info.comPhone}</p> <p>\${info.comEmail}</p>`
                // document.querySelector(".infoBody").innerHTML = str
                // document.querySelector(".comProfile").src = '/view?fileName=' + result.comProfile
                document.querySelector(".comName").innerText = result.comName
                document.querySelector(".comIntro").innerText = result.comIntro
                document.querySelector(".comAddress").innerText = result.comAddress
                document.querySelector(".comPhone").innerText = result.comPhone
                document.querySelector(".comEmail").innerText = result.comEmail
                document.querySelector("phoneIcon").href = "tel:" + result.comPhone
                document.querySelector("emailIcon").href = "mailto:" + result.comEmail
            }
        )
    }, false)


</script>

</body>
</html>
