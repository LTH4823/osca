<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <h1>${dto}</h1>
    <button>의뢰자 정보보기</button>
    <button>입찰하기</button>
    <button class="modBtn">수정하기</button>
    <button class="delBtn" >삭제하기</button>
    <button class="listBtn">돌아가기</button>
    <form class="actionForm" action="/company/remove/${dto.conNo}" method="post"></form>

<script>
    const actionForm = document.querySelector(".actionForm");
    const delBtn = document.querySelector(".delBtn")
    const listBtn = document.querySelector(".listBtn");

    delBtn.addEventListener("click",(e)=>{
        actionForm.setAttribute("action",`/company/auction/remove/${dto.conNo}`)
        actionForm.submit()
    },false)

    document.querySelector(".modBtn").addEventListener("click",(e)=> {
        self.location = `/company/auction/modify/${dto.conNo}${listDTO.link}`
    }, false)

    listBtn.addEventListener("click",(e)=>{
        self.location = `/company/auction/list${listDTO.link}`
    },false)

</script>

</body>
</html>
