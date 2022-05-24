<%--
  Created by IntelliJ IDEA.
  User: peter
  Date: 2022-05-22
  Time: 오후 5:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet"/>
    <link href="../../../resources/css/style.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body>

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


<form action="/company/auction/register" class="registerForm" method="post">
<div style="display: flex; flex-direction: column; align-items: center; justify-content: center;">
    <input type="text" name="conName" >계약명
    <input type="text" name="conCategory" >작업 종류
    <div class="input-group d-flex flex-row align-items-center mb-4">
        <div class="form-outline flex-fill mb-0">
            <p class="form-label" for="form3Example3c">주소</p>
            <div class="registerAdressFind">
                <input type="text" class="registerAdressInput form-control"
                       id="custom_postcode" name="comAddress" placeholder="우편번호">
                <input type="button" class=" form-control-text"
                       onclick="custom_execDaumPostcode()" value="우편번호 찾기">
            </div>
            <input type="text" class="registerAdressInput form-control"
                   id="custom_address" name="conLocation" placeholder="주소">

            <div class="customFlexRow">
                <input type="text" class="registerAdressInput form-control"
                       id="custom_detailAddress" placeholder="상세주소">
                <input type="text" class="registerAdressInput form-control"
                       id="custom_extraAddress" placeholder="참고항목">
            </div>

            <div id="map"
                 style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>
        </div>
    </div>
    <input type="text" name="conSpace" placeholder="제곱미터 단위로 넣어 주세요." >면적
    <input type="text" name="conContent" >주요업무
    <input type="text" name="conRequest" >요구사항
    <input type="text" name="conStartDay" >시작일
    <input type="text" name="conEndDay" >마감일
    <input type="file" name="conDocument" >계약서
    <input type="file" name="conImg" >시공이미지
    <input type="text" name="comId" >의뢰자
    <input type="text" name="memId" >시공사
</div>
</form>

<button class="registerBtn">등록</button>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1e60987ffadf27e61dcc9c42a7a4a15c&libraries=services"></script>
<script src="../../../resources/js/address.js"></script>
<script>
    document.querySelector(".registerBtn").addEventListener("click", (e)=>{
        e.preventDefault()
        e.stopPropagation()

        const registerForm = document.querySelector(".registerForm")

        registerForm.submit()
    },false)

</script>
</body>
</html>
