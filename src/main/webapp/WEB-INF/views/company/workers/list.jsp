<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--<h1>${dtoList}</h1>--%>

<ul class="dtoList">
    <c:forEach items="${dtoList}" var="company">
        <li>
            <span>${company.comId}</span>
            <span><a href="/company/workers/read/${company.comId}" class="dtoLink">
                <c:out value="${company.comName}"></c:out></a></span>

            <span>${company.comProfile}</span>

            <c:if test="${comProfile.conImg !=null}">
                <img src='${comProfile.conImg}' alt="zxcv"/>
            </c:if>
        </li>
    </c:forEach>
</ul>
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

${pageMaker}
<form class="actionForm" action="/company/workers/list" method="get">
    <input type="hidden" name="page" value="${listDTO.page}">
    <input type="hidden" name="size" value="${listDTO.size}">
    <input type="hidden" name="type" value="${listDTO.type == null? "":listDTO.type}">
    <input type="hidden" name="keyword" value="${listDTO.keyword == null? "":listDTO.keyword}">
</form>

<script>
    const linkDiv = document.querySelector(".pagination")
    const actionForm = document.querySelector(".actionForm")

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
