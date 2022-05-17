<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

${company}

        <form action="/company/modify/${company.comId}" class="modForm" method="post">
            <input type="text" name="comId" value="<c:out value="${company.comId}"/>">
            <input type="text" name="comName" value="<c:out value="${company.comName}"/>">
            <button>회원정보 수정</button>
        </form>


        <form action="/company/remove/${company.comId}}" class="delForm" method="post">
        <button>회원탈퇴</button>
        </form>

        <form action=""></form>


        <script>
        const delForm = document.querySelector(".delForm");

        dleForm.addEventListener("click",(e) =>{
        delForm.setAttribute("action",`/company/remove/${comId}`)
        delForm.submit()
        },false)

        </script>

        </body>
        </html>
