<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<form class="modForm" action="/company/auction/modify/${dto.conNo}" method="post">
    <input type="hidden" name="page" value="${listDTO.page}">
    <input type="hidden" name="size" value="${listDTO.size}">
    <input type="hidden" name="type" value="${listDTO.type}">
    <input type="hidden" name="keyword" value="${listDTO.keyword}">
    <div>
        <div>
            <input type="text" name="conNo" value="<c:out value="${dto.conNo}"/>" readonly >
        </div>
        <div>
            <input type="text" name="conName" value="<c:out value="${dto.conName}"/>" >
        </div>
        <div>
            <textarea name="conContent" ><c:out value="${dto.conContent}"/></textarea>
        </div>
    </div>
</form>

<div>
    <button class="listBtn">돌아가기</button>
    <button class="modBtn">수정</button>
</div>

<script>

const listBtn = document.querySelector(".listBtn");
const modBtn = document.querySelector(".modBtn");
const modForm = document.querySelector(".modForm");

listBtn.addEventListener("click",(e)=>{
    self.location = `/company/auction/read/${dto.conNo}?${listDTO.link}`
},false)

modBtn.addEventListener("click",(e)=>{
    modForm.submit()
},false)

</script>

</body>
</html>
