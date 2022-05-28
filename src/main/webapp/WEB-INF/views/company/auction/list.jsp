<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>계약경매</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet"/>
    <link href="../../../resources/css/style.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
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

                    <button type="button" class="btn btn-primary"><a class="text-white" style="text-decoration: none"
                                                                     href="/company/auction/register">계약생성</a></button>

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

                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:forEach items="${dtoList}" var="contract">
                        <div class="col mb-5 dtoList">
                            <div class="card h-100"
                                 style="display: flex; flex-direction: column; align-items: center; justify-content: center;">
                                <!-- Product image-->
                                <c:if test="${contract.conImg !=null}">
                                    <img src='${contract.conImg}' style="max-width: 150px; max-height: 150px;"
                                         alt="..."/>
                                </c:if>
                                <!-- Product details-->
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <!-- Product name-->
                                        <h5 class="fw-bolder"><a href="/company/auction/read/${contract.conNo}"
                                                                 class="dtoLink">
                                            <c:out value="${contract.conName}"></c:out></a></h5>
                                        <!-- Product price-->
                                        <p>${contract.conContent}</p>

                                        <span>${contract.conStartDay}</span> ~
                                        <span>${contract.conEndDay}</span>

                                    </div>
                                </div>
                                <!-- Product actions-->
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <div class="text-center">
                                        <a href="/company/auction/read/${contract.conNo}"
                                           class="dtoLink btn btn-outline-dark mt-auto">상세보기</a>
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


        <%--            <ul class="dtoList">--%>
        <%--                <c:forEach items="${dtoList}" var="contract">--%>
        <%--                    <li>--%>
        <%--                        <span>${contract.conNo}</span>--%>
        <%--                        <span><a href="/company/auction/read/${contract.conNo}" class="dtoLink">--%>
        <%--                <c:out value="${contract.conName}"></c:out></a></span>--%>

        <%--                        <span>${contract.conContent}</span>--%>
        <%--                        <span>${contract.conLocation}</span>--%>
        <%--                        <span>${contract.conImg}</span>--%>

        <%--                        <c:if test="${contract.conImg !=null}">--%>
        <%--                            <img src='${contract.conImg}' alt="zxcv"/>--%>
        <%--                        </c:if>--%>
        <%--                    </li>--%>
        <%--                </c:forEach>--%>
        <%--            </ul>--%>


    </div>
</div>
${pageMaker}
<form class="actionForm" action="/company/auction/list" method="get">
    <input type="hidden" name="page" value="${listDTO.page}">
    <input type="hidden" name="size" value="${listDTO.size}">
    <input type="hidden" name="type" value="${listDTO.type == null? "":listDTO.type}">
    <input type="hidden" name="keyword" value="${listDTO.keyword == null? "":listDTO.keyword}">
</form>
</section>


<%@ include file="/WEB-INF/includes/footer.jsp" %>




<script>
    const linkDiv = document.querySelector(".pagination")
    const actionForm = document.querySelector(".actionForm")

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

    linkDiv.addEventListener("click", (e) => {
        e.stopPropagation()
        e.preventDefault()

        const target = e.target

        if (target.getAttribute("class") !== 'page-link') {
            return
        }

        const pageNum = target.getAttribute("href")
        actionForm.querySelector("input[name='page']").value = pageNum
        actionForm.setAttribute("action", "/company/auction/list") //뒤로 가기 문제 방지
        actionForm.submit()
    }, false)
    document.querySelector(".searchBtn").addEventListener("click", (e) => {
        const type = document.querySelector('.searchDiv .type').value
        const keyword = document.querySelector(".searchDiv input[name='keyword']").value

        console.log(type, keyword)
        actionForm.setAttribute("action", "/company/auction/list") //뒤로 가기 문제 방지
        actionForm.querySelector("input[name='page']").value = 1
        actionForm.querySelector("input[name='type']").value = type
        actionForm.querySelector("input[name='keyword']").value = keyword
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
