<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>회원가입</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="../assets/favicon.ico"/>
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../../resources/css/style.css" rel="stylesheet"/>
    <!-- googlefont -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@700&display=swap" rel="stylesheet">
    <!-- reset -->
    <link href="../../resources/css/reset.css" rel="stylesheet"/>
    <!-- custom -->
    <link href="../../resources/css/custom.css" rel="stylesheet"/>
</head>

<body>

<section class="registerBody" id="page-content-wrapper">

    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-primary bg-gradient shadow-sm">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="/index.jsp"><span style="margin: 0em 0em 0em 1em ">O.S.C.A</span></a>

        <!-- Navbar-->
        <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
            <li class="nav-item"><a class="nav-link " href="/">Home</a></li>
            <sec:authorize access="isAnonymous()">
                <li class="nav-item"><a class="nav-link" href="/customLogin">Login</a></li>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
            </sec:authorize>
        </ul>
    </nav>

    <div class="container h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-lg-12 col-xl-11">
                <div class="text-black" style="border-radius: 25px; margin: 20px">
                    <div class="p-md-5">
                        <div class="row justify-content-center">
                            <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                                <p class="registerLogo text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">O.S.C.A</p>

                                <form class="registerForm mx-1 mx-md-4 " action="/register" method="post">

                                    <div class="d-flex flex-row align-items-center mb-4">

                                        <div class="registerRadio form-outline flex-fill mb-0">
                                            <p class="form-label" for="form3Example1c">가입 대상을 선택해 주십시오.</p>
                                            <input type="radio" name="authority" value="MEMBER" id="radioMember"><label for="radioMember">의뢰자</label>
                                            <input type="radio" name="authority" value="COMPANY" id="ratioCompany"><label for="ratioCompany">시공사</label>
                                        </div>
                                    </div>

                                    <div class="d-flex flex-row align-items-center mb-4">

                                        <div class="form-outline flex-fill mb-0">
                                            <label class="form-label" for="form3Example1c">아이디</label>
                                            <input type="text" name="comId" class="reqId form-control"/>

                                        </div>
                                    </div>

                                    <div class="d-flex flex-row align-items-center mb-4">

                                        <div class="form-outline flex-fill mb-0">
                                            <label class="form-label" for="form3Example1c">이름</label>
                                            <input type="text" name="comName" class="reqName form-control"/>
                                        </div>
                                    </div>
                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <div class="form-outline flex-fill mb-0">
                                            <label class="form-label" for="form3Example1c">사업자등록번호</label>
                                            <input type="text" name="businessNum" class="businessNum form-control"/>
                                        </div>
                                    </div>
                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <div class="form-outline flex-fill mb-0 businessInput">
                                            <label class="form-label" for="form3Example1c">사업자등록번호 등본</label>
                                            <input type="file" class="businessCheck form-control"/>
                                            <div class="businessCheckResult">

                                            </div>
<%--                                            <input type="hidden" name="businessCheck" class="reqBurith form-control"/>--%>
                                        </div>
                                    </div>
                                    <div class="d-flex flex-row align-items-center mb-4">
                                        <div class="form-outline flex-fill mb-0">
                                            <label class="form-label" for="form3Example1c">간략 회사소개</label>
                                            <input type="text" name="comIntro" class="comIntro form-control"/>
                                        </div>
                                    </div>
                                    <div class="input-group d-flex flex-row align-items-center mb-4">
                                        <div class="form-outline flex-fill mb-0">
                                            <p class="form-label" for="form3Example3c">주소</p>
                                            <div class="registerAdressFind">
                                                <input type="text" class="registerAdressInput form-control"
                                                       id="custom_postcode" name="comAddress" placeholder="우편번호">
                                                <input type="button" class=" form-control-text"
                                                       onclick="custom_execDaumPostcode()" value="우편번호 찾기">
                                            </div>
                                            <input type="text" class="registerAdressInput form-control"
                                                   id="custom_address" name="comAddress" placeholder="주소">

                                            <div class="customFlexRow">
                                                <input type="text" class="registerAdressInput form-control"
                                                       id="custom_detailAddress" placeholder="상세주소">
                                                <input type="text" class="registerAdressInput form-control"
                                                       id="custom_extraAddress" placeholder="참고항목">
                                            </div>

                                            <div id="map"
                                                 style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>
                                        </div>
                                    </div>

                                    <div class="d-flex flex-row align-items-center mb-4">

                                        <div class="form-outline flex-fill mb-0">
                                            <label class="form-label" for="form3Example1c">전화번호</label>
                                            <input type="text" name="comPhone" id="form3Example1c"
                                                   class="reqCall form-control"/>
                                        </div>
                                    </div>


                                    <div class="d-flex flex-row align-items-center mb-4">

                                        <div class="form-outline flex-fill mb-0">
                                            <label class="form-label" for="form3Example3c">이메일</label>
                                            <input type="email" name="comEmail" id="form3Example3c"
                                                   class="reqEmail form-control"/>
                                        </div>
                                    </div>

                                    <div class="d-flex flex-row align-items-center mb-4">

                                        <div class="form-outline flex-fill mb-0">
                                            <label class="form-label" for="form3Example4c">비밀번호</label>
                                            <input type="password" name="password" id="form3Example4c"
                                                   class="reqPw form-control"/>
                                        </div>
                                    </div>

                                    <%--                                    <div class="d-flex flex-row align-items-center mb-4">--%>

                                    <%--                                        <div class="form-outline flex-fill mb-0">--%>
                                    <%--                                            <label class="form-label" for="form3Example4cd">비밀번호 확인</label>--%>
                                    <%--                                            <input type="password" id="form3Example4cd" class="reqPwCheck form-control"/>--%>
                                    <%--                                        </div>--%>
                                    <%--                                    </div>--%>

                                    <div class="d-flex flex-row align-items-center mb-4">

                                        <div class="registerFile form-outline flex-fill mb-0">
                                            <label class="form-label" for="form3Example3c">프로필 이미지를 넣어주세요.</label>
                                                <input type="file" class="comProfile form-control"/>
<%--                                                <input type="hidden" name="comProfile" class="comProfile form-control"/>--%>
                                            <div class="comProfileResult"></div>
                                        </div>
                                    </div>

                                    <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                        <button type="button"
                                                class="registerBtn btn btn-primary btn-lg btn-block col-6 mx-auto">가입하기
                                        </button>
                                    </div>

                                </form>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<footer>
<%--    <div>--%>
<%--        <h2>Ajax Upload</h2>--%>
<%--        <div class="uploadInputDiv">--%>
<%--            <input type="file" name="upload" class="uploadFile">--%>
<%--        </div>--%>
<%--        <button class="uploadBtn">UPLOAD</button>--%>
<%--    </div>--%>

<%--    <div class="uploadResult">--%>

<%--    </div>--%>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Core theme JS-->
<script src="../../../resources/js/scripts.js"></script>

<%--map--%>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1e60987ffadf27e61dcc9c42a7a4a15c&libraries=services"></script>
<script src="../../resources/js/address.js"></script>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/67818242f4.js" crossorigin="anonymous"></script>

<%--axios--%>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script>

    const comProfileResult = document.querySelector(".comProfileResult");

    document.querySelector(".comProfile").addEventListener("change", (e)=> {
        const hidenInput = document.querySelector("input[name=comProfile]")
        const img = document.querySelector(".thumbnailProfile")
        console.log(hidenInput)
        console.log(img)
        if (hidenInput){
            const link = hidenInput.getAttribute("data-link")
            deleteToServer(link).then(result =>{
                hidenInput.remove()
                img.remove()
            })
        }
        const formObj = new FormData();
        const fileInput = document.querySelector(".comProfile")
        console.log(fileInput.files)
        const files = fileInput.files
        for (let i = 0; i < files.length; i++) {
            console.log(files[i])
            formObj.append("files", files[i])
        }
        uploadToServer(formObj).then(resultArr => {
            comProfileResult.innerHTML += resultArr.map(result => `
        <img class="thumbnailProfile" src ='/view?fileName=\${result.thumbnail}'>
           <input type="hidden" data-link="\${result.link}" name="comProfile" value="\${result.thumbnail}">`).join(" ")

        })
    },false)

    const businessCheckResult = document.querySelector(".businessCheckResult");
    const businessInput = document.querySelector(".businessInput").cloneNode()

    document.querySelector(".businessCheck").addEventListener("change",(e)=> {
        const hidenInput = document.querySelector("input[name=businessCheck]")
        if (hidenInput){
            const link = hidenInput.value
            deleteToServer(link).then(result =>{
                hidenInput.remove()
            })
        }
        console.log(hidenInput)
        const formObj = new FormData();
        const fileInput = document.querySelector(".businessCheck")
        console.log(fileInput.files)
        const files = fileInput.files
        for (let i = 0; i < files.length; i++) {
            console.log(files[i])
            formObj.append("files", files[i])
        }
        uploadToServer(formObj).then(resultArr => {
            businessCheckResult.innerHTML += resultArr.map(result => `
          <input type="hidden" name="businessCheck" value="\${result.thumbnail}">`).join(" ")
        })
    },false)


    async function uploadToServer(formObj) {

        console.log("upload to server......")
        console.log(formObj)

        const response = await axios({
            method: 'post',
            url: '/upload1',
            data: formObj,
            headers: {
                'Content-Type': 'multipart/form-data',
            },
        });

        return response.data
    }

    async function deleteToServer(fileName) {
        const options = {header: {"Content-Type": "application/x-www-form-urlencoded"}}

        const res = await axios.post("/delete", "fileName=" + fileName, options)

        console.log(res.data)
    }

    document.querySelector(".registerBtn").addEventListener("click", (e) => {
        e.preventDefault()
        e.stopPropagation()

        const registerForm = document.querySelector(".registerForm")

        registerForm.submit()
    }, false)


</script>

</body>

</html>