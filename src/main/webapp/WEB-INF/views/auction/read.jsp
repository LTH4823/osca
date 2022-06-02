<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
            <li class="nav-item"><a class="nav-link"><sec:authentication property="principal.comId"></sec:authentication></a></li>
        </sec:authorize>

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
    <%--    <c:if test="${dto.conImg != null}">--%>
    <%--        <img src="${dto.getMain()}">--%>
    <%--    </c:if>--%>
</div>


<button type="button" class="comInfo btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">의뢰자 정보보기
</button>
<button type="button" class="comBid btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal2">입찰하기
</button>
<button class="modBtn">수정하기</button>
<button class="delBtn">삭제하기</button>
<button class="listBtn">돌아가기</button>
<form class="actionForm" action="/company/remove/${dto.conNo}" method="post"></form>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="infoBody modal-body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
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

                    <input type="hidden" name="comId" value="<sec:authentication property="principal.comId"></sec:authentication>">
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

<%--axios--%>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="../../../resources/js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
        crossorigin="anonymous"></script>
<script>

    const actionForm = document.querySelector(".actionForm")
    const delBtn = document.querySelector(".delBtn")
    const listBtn = document.querySelector(".listBtn")



    delBtn.addEventListener("click", (e) => {
        actionForm.setAttribute("action", `/company/auction/remove/${dto.conNo}`)
        actionForm.submit()
    }, false)


    document.querySelector(".bidBtn").addEventListener("click", (e)=>{
        document.querySelector(".bidForm").submit()
    },false)

    document.querySelector(".modBtn").addEventListener("click", (e) => {
        self.location = `/auction/modify/${dto.conNo}${listDTO.link}`
    }, false)

    listBtn.addEventListener("click", (e) => {
        self.location = `/auction/list${listDTO.link}`
    }, false)

    document.querySelector(".moreBtn").addEventListener("click", (e) => {

        axios.get("/auction/files/${conNo}").then(
            res => {
                const arr = res.data
                let str = ""
                for (let i = 0; i < arr.length; i++) {
                    str += `<img src='/view?fileName=\${arr[i].link}'>`
                }
                document.querySelector(".pictures").innerHTML = str
            }
        )
    }, false)


    document.querySelector(".comInfo").addEventListener("click", (e) => {

        axios.get("/info/company/${dto.requester}").then(
            res => {
                const info = res.data
                console.log(info)
                console.log(info)
                let str = ""
                str = `<p>\${info.comName}</p> <p>\${info.comPhone}</p> <p>\${info.comEmail}</p>`
                // let comName = document.createElement("div").appendChild(document.createTextNode(`\${info.comName}`))
                // let comPhone = document.createElement("div").appendChild(document.createTextNode(`\${info.comPhone}`))
                // let comEmail = document.createElement("div").appendChild(document.createTextNode(`\${info.comEmail}`))

                // document.querySelector(".infoBody").appendChild(comName)
                // 내부 디자인 완료 후 태그안에 값 직접 넣어서 꾸며줄 예정

                document.querySelector(".infoBody").innerHTML = str

                // ({comName, comEmail, comPhone}) => `<p class='\${comName}'>\${comName}</p>
                //         <p class='\${comName}'>\${comName}</p>
                //         <p class='\${comName}'>\${comName}</p>
                //         <p class='\${comName}'>\${comName}</p>`

                <%--document.querySelector(".infoBody").innerHTML += arr.map(({comName,comPhone,comEmail}) =>--%>
                <%--        ` <h7>${comName}</h7> `).join(" ")--%>
            }
        )
    }, false)


</script>

</body>
</html>
