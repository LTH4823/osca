<%--
  Created by IntelliJ IDEA.
  User: peter
  Date: 2022-05-22
  Time: 오후 5:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form action="/company/auction/register" class="registerForm" method="post">
    <input type="text" name="conName" >
    <input type="text" name="conContent" >
</form>

<button class="registerBtn">등록</button>

<script>
    document.querySelector(".registerBtn").addEventListener("click", (e)=>{
        e.preventDefault()
        e.stopPropagation()

        const registerForm = document.querySelector(".registerForm")

        registerForm.submit()
    },false)

</script>
</body>
</html>
