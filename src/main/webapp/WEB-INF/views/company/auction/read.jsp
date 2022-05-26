<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <li nk href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet"/>
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

<h1>${dto}</h1>

<c:if test="${dto.conImg !=null}">
    <img src='${dto.conImg}' alt="zxcv"/>
</c:if>

<button class="moreBtn">더보기</button>
<div class="pictures">
    <c:if test="${dto.conImg != null}">
        <img src="${dto.getMain()}">
    </c:if>
</div>


<button>의뢰자 정보보기</button>
<button>입찰하기</button>
<button class="modBtn">수정하기</button>
<button class="delBtn">삭제하기</button>
<button class="listBtn">돌아가기</button>
<form class="actionForm" action="/company/remove/${dto.conNo}" method="post"></form>
<%--axios--%>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>

    const actionForm = document.querySelector(".actionForm");
    const delBtn = document.querySelector(".delBtn")
    const listBtn = document.querySelector(".listBtn");

    delBtn.addEventListener("click", (e) => {
        actionForm.setAttribute("action", `/company/auction/remove/${dto.conNo}`)
        actionForm.submit()
    }, false)

    document.querySelector(".modBtn").addEventListener("click", (e) => {
        self.location = `/company/auction/modify/${dto.conNo}${listDTO.link}`
    }, false)

    listBtn.addEventListener("click", (e) => {
        self.location = `/company/auction/list${listDTO.link}`
    }, false)

    document.querySelector(".moreBtn").addEventListener("click",(e)=>{

        axios.get("/company/auction/files/${conNo}").then(
            res => {
                const arr = res.data
                let str =""
                for (let i = 0; i < arr.length; i++) {
                    str += `<img src='/view?fileName=\${arr[i].link}'>`
                }
                document.querySelector(".pictures").innerHTML =str
            }
        )

    },false)



</script>

</body>
</html>
