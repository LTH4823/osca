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

</body>
</html>
