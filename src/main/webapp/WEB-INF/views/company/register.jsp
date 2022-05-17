<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <h1>register</h1>

    <form action="/company/register" class="registerForm" method="post">

        <input type="text" name="comId" class="comId">
        <input type="text" name="comName" class="comName">

        <button class="registerBtn">등록</button>

    </form>

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
