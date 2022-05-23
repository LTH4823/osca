<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


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
