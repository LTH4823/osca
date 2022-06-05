<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Workers</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet"/>
    <link href="../../../resources/css/style.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <link href="../../../resources/css/custom.css" rel="stylesheet"/>
</head>
<body class="sb-nav-fixed">

<%@ include file="/WEB-INF/includes/navbar.jsp" %>

<div id="layoutSidenav_content">
    <div class="container-fluid px-4">
        <div class="py-5 customFlexColumn">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <!-- Container wrapper -->
                <div class="container-fluid">

                    <div class="searchDiv">
                        <select class="type">
                            <option value="">---</option>
                            <option value="t" ${listDTO.type =="t"?"selected":""}>제목</option>
                            <option value="tc"  ${listDTO.type =="tc"?"selected":""}>제목내용</option>
                            <option value="tcw"  ${listDTO.type =="tcw"?"selected":""}>제목내용작성자</option>
                        </select>
                        <input type="text" name="keyword" value="${listDTO.keyword}">
                        <button class="searchBtn">Search</button>
                    </div>


                    <!-- Collapsible wrapper -->
                </div>
                <!-- Container wrapper -->
            </nav>
            <!-- Navbar -->

            <div class="container px-4 px-lg-5 mt-5">

                <div class="dtoList row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

                    <c:forEach items="${dtoList}" var="company">
                        <div class="col mb-5">
                            <div class="card customCard h-100"
                                 style="display: flex; flex-direction: column; align-items: center; justify-content: center;">
                                <c:if test="${company.comProfile !=null}">
                                    <img src='/view?fileName=${company.getProfile()}' alt="zxcv">
                                </c:if>
                                <div class="card-body">
                                    <div class="text-center">
                                        <p>${company.comName}</p>
                                        <p>${company.comIntro}</p>
                                    </div>
                                </div>
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <div class="text-center">
                                            <%--                                            <a href="/company/workers/read/${company.comId}"--%>
                                            <%--                                               class="dtoLink btn btn-outline-dark mt-auto">상세보기</a>--%>
                                        <button data-comId="${company.comId}" class="readBtn btn btn-primary"
                                                data-bs-toggle="modal" data-bs-target="#exampleModal">상세보기
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="col-sm-12 col-md-7">
                <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                    <ul class="pagination">
                        <li class="page-item" id="dataTable_previous">
                            <a class="page-link" href="${pageMaker.start-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>

                        <c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" var="num">
                            <li class="page-item"><a class="page-link" href="${num}">${num}</a></li>
                        </c:forEach>

                        <li class="page-item" id="dataTable_next">
                            <a class="page-link" href="${pageMaker.end+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

        </div>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
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


        <%--<h1>${dtoList}</h1>--%>

        <%--<ul class="dtoList">--%>
        <%--    <c:forEach items="${dtoList}" var="company">--%>
        <%--        <li>--%>
        <%--            <span>${company.comId}</span>--%>
        <%--            <span><a href="/company/workers/read/${company.comId}" class="dtoLink">--%>
        <%--                <c:out value="${company.comName}"></c:out></a></span>--%>

        <%--            <span>${company.comProfile}</span>--%>

        <%--            <c:if test="${comProfile.conImg !=null}">--%>
        <%--                <img src='${comProfile.conImg}' alt="zxcv"/>--%>
        <%--            </c:if>--%>
        <%--        </li>--%>
        <%--    </c:forEach>--%>
        <%--</ul>--%>
<%--        ${pageMaker}--%>
        <form class="actionForm" action="/workers/list" method="get">
            <input type="hidden" name="page" value="${listDTO.page}">
            <input type="hidden" name="size" value="${listDTO.size}">
            <input type="hidden" name="type" value="${listDTO.type == null? "":listDTO.type}">
            <input type="hidden" name="keyword" value="${listDTO.keyword == null? "":listDTO.keyword}">
        </form>
    </div>

    <%@ include file="/WEB-INF/includes/footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script>
        const dtoList = document.querySelector(".dtoList")
        const linkDiv = document.querySelector(".pagination")
        const actionForm = document.querySelector(".actionForm")

        dtoList.addEventListener("click", (e) => {
            e.stopPropagation()
            e.preventDefault()
            console.log(e.target)
            let btn = e.target;

            if (btn.classList.contains("readBtn")) {

                console.log(btn.getAttribute("data-comId"))
                const comId = btn.getAttribute("data-comId")
                infoToServer(comId).then(result =>{
                    console.log(result)
                    let str = ""
                    str = `<p>\${result.comName}</p>`
                    // console.log(`<p>\${result.comId}</p>`)
                    document.querySelector(".infoBody").innerHTML = str
                }).catch(err => console.log(err))
            }


        }, false)

        async function infoToServer(comId) {
            try {
                const res = await axios.get("/info/company/" + comId)
                return res.data
            } catch (err) {
                return err
            }
        }

        linkDiv.addEventListener("click", (e) => {
            e.stopPropagation()
            e.preventDefault()

            const target = e.target

            if (target.getAttribute("class") !== 'page-link') {
                return
            }

            const pageNum = target.getAttribute("href")
            actionForm.querySelector("input[name='page']").value = pageNum
            actionForm.setAttribute("action", "/company/workers/list") //뒤로 가기 문제 방지
            actionForm.submit()
        }, false)
        document.querySelector(".searchBtn").addEventListener("click", (e) => {
            const type = document.querySelector('.searchDiv .type').value
            const keyword = document.querySelector(".searchDiv input[name='keyword']").value

            console.log(type, keyword)
            actionForm.setAttribute("action", "/company/workers/list") //뒤로 가기 문제 방지
            actionForm.querySelector("input[name='page']").value = 1
            actionForm.querySelector("input[name='type']").value = type
            actionForm.querySelector("input[name='keyword']").value = keyword
            actionForm.submit()


        }, false)

        document.querySelector(".dtoList").addEventListener("click", (e) => {
            e.preventDefault()
            e.stopPropagation()
            const target = e.target;
            if (target.getAttribute("class").indexOf('dtoLink') < 0) {
                return
            }
            const url = target.getAttribute("href")
            //alert(url)

            actionForm.setAttribute("action", url)
            actionForm.submit()

        }, false)

        <%--   단순한 데이터 보내기 방식으로 할 시 param을 추가하여 받을 수 있게 해줌 단순한 방법   --%>
        <%--const result = ${param.result}--%>
        const result = `${result == null ? "" : result}`
        console.log(result)

        if (result !== '') {
            alert("처리되었습니다.")
        }

    </script>

</body>
</html>
