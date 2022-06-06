<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet"/>
    <link href="../../../resources/css/style.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <link href="../../../resources/css/custom.css" rel="stylesheet"/>
</head>
<body>

<%@ include file="/WEB-INF/includes/navbar.jsp" %>

<div id="layoutSidenav_content">


    <div class="container">
        <div class="row d-flex justify-content-center align-items-center">
            <div class="col-lg-12 col-xl-11">
                <div class="text-black" style="border-radius: 25px; margin: 20px">
                    <div class="p-md-1">
                        <div class="row justify-content-center">
                            <div class="contractForm customFlexColumn col-md-10 col-lg-6">

                                <h2 class="formTitle">계약 생성</h2>
                                <form action="/auction/register" class="registerForm" method="post">
                                    <div style="display: flex; flex-direction: column; align-items: center; justify-content: center;">


                                        <div class="conRegisterInput">
                                            <span>계약명</span><input type="text" class="form-control" name="conName">
                                        </div>

                                        <div class="conRegisterInput">
                                            <span>작업 종류</span>
                                            <select type="text" class="form-control form-select" name="conCategory">
                                                <option value="가구" selected>가구</option>
                                                <option value="창문">창문</option>
                                                <option value="계단">계단</option>
                                                <option value="외벽">외벽</option>
                                                <option value="바닥">바닥</option>
                                            </select>
                                        </div>

                                        <div class="conRegisterInput input-group d-flex flex-row align-items-center mb-4">
                                            <div class="form-outline flex-fill mb-0">
                                                <p class="form-label" for="form3Example3c">주소</p>
                                                <div class="registerAdressFind">
                                                    <input type="text" class="registerAdressInput form-control"
                                                           id="custom_postcode" name="conAddress" placeholder="우편번호">
                                                    <input type="button" class=" form-control-text"
                                                           onclick="custom_execDaumPostcode()" value="우편번호 찾기">
                                                </div>
                                                <input type="text" class="registerAdressInput form-control"
                                                       id="custom_address" name="conLocation" placeholder="주소">
                                                <div class="customFlexColumn">
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
                                        </div>

                                        <div class="conRegisterInput">
                                            <span>면적</span>
                                            <input type="text" class="form-control" name="conSpace"
                                                   placeholder="제곱미터 단위로 넣어 주세요.">
                                        </div>

                                        <div class="conRegisterInput">
                                            <span>주요업무</span>
                                            <textarea type="text" class="form-control" name="conContent"></textarea>
                                        </div>

                                        <div class="conRegisterInput">
                                            <span>요구사항</span>
                                            <textarea type="text" class="form-control" name="conRequest"></textarea>
                                        </div>

                                        <div class="conRegisterInput">
                                            <span>기간</span>
                                            <div class="conDays customFlexRowAround">
                                                <input type="date" class="form-control" name="conStartDay">
                                                <input type="date" class="form-control" name="conEndDay">
                                            </div>
                                        </div>
                                        <div class="conRegisterInput">
                                            <span>계약서</span>
                                            <input type="file" class="documentInput form-control">
                                        </div>
                                        <div class="documentInputResult"></div>
                                        <%--    <input type="file" class="conImg" multiple>시공이미지--%>

                                        <div class="conRegisterInput">
                                            <span>시공관련 이미지</span>
                                            <div class="input-group">
                                                <div class="uploadInputDiv">
                                                    <input type="file" name="upload" class="uploadFile form-control"
                                                           multiple>
                                                </div>
                                                <button type="button" class="uploadBtn btn btn-success">UPLOAD</button>
                                            </div>
                                        </div>
                                        <div class="uploadResult">
                                        </div>
                                        <div class="conImgResult"></div>
                                    </div>
                                </form>

                                <button class="registerBtn btn btn-primary"><span class="text-white">등록</span></button>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<%@ include file="/WEB-INF/includes/footer.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1e60987ffadf27e61dcc9c42a7a4a15c&libraries=services"></script>
<script src="../../../resources/js/address.js"></script>
<%--axios--%>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>


    const uploadResult = document.querySelector(".uploadResult")
    const cloneInput = document.querySelector(".uploadFile").cloneNode()

    document.querySelector(".uploadBtn").addEventListener("click", (e) => {

        const formObj = new FormData();
        const fileInput = document.querySelector(".uploadFile")
        console.log(fileInput.files)
        const files = fileInput.files
        for (let i = 0; i < files.length; i++) {
            console.log(files[i])
            formObj.append("files", files[i])
        }
        uploadToServer(formObj).then(resultArr => {
            //구조 분해 할당
            uploadResult.innerHTML += resultArr.map(({uuid, thumbnail, link, fileName, savePath, img}) =>
                `<div data-uuid='\${uuid}' data-img='\${img}' data-filename='\${fileName}' data-savepath='\${savePath}'>
                <img src='/view?fileName=\${thumbnail}'>
                <button type="button" data-link='\${link}' class="delBtn">x</button>
                \${fileName}</div>`).join(" ")
            fileInput.remove()
            document.querySelector(".uploadInputDiv").appendChild(cloneInput.cloneNode())
        })
    }, false)


    uploadResult.addEventListener("click", (e) => {
        if (e.target.getAttribute("class").indexOf("delBtn") < 0) {
            return
        }
        const btn = e.target
        const link = btn.getAttribute("data-link")

        deleteToServer(link).then(result => {
            btn.closest("div").remove()
        })

    }, false)


    const documentInputResult = document.querySelector(".documentInputResult");
    document.querySelector(".documentInput").addEventListener("change", (e) => {
        const hidenInput = document.querySelector("input[name=conDocument]")
        if (hidenInput) {
            const link = hidenInput.value
            deleteToServer(link).then(result => {
                hidenInput.remove()
            })
        }
        console.log(hidenInput)
        const formObj = new FormData();
        const fileInput = document.querySelector(".documentInput")
        console.log(fileInput.files)
        const files = fileInput.files
        for (let i = 0; i < files.length; i++) {
            console.log(files[i])
            formObj.append("files", files[i])
        }
        uploadToServer(formObj).then(resultArr => {
            documentInputResult.innerHTML += resultArr.map(result => `
           <input type="hidden" name="conDocument" value="\${result.link}">`).join(" ")
        })
    }, false)


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

        const divArr = document.querySelectorAll(".uploadResult > div")

        let str = "";
        for (let i = 0; i < divArr.length; i++) {
            const fileObj = divArr[i]

            if (i === 0) {
                const mainImageLink = fileObj.querySelector("img").getAttribute("src")
                str += `<input type='hidden' name='conImg' value='\${mainImageLink}'>`
            }

            const uuid = fileObj.getAttribute("data-uuid")
            const img = fileObj.getAttribute("data-img")
            const savePath = fileObj.getAttribute("data-savepath")
            const fileName = fileObj.getAttribute("data-filename")

            str += `<input type='hidden' name='uploads[\${i}].uuid' value='\${uuid}'>`
            str += `<input type='hidden' name='uploads[\${i}].img' value='\${img}'>`
            str += `<input type='hidden' name='uploads[\${i}].savePath' value='\${savePath}'>`
            str += `<input type='hidden' name='uploads[\${i}].fileName' value='\${fileName}'>`
        }//for

        // document.querySelector(".actionForm").innerHTML += str
        // registerForm.innerHTML += str


        // const actionForm = document.querySelector(".actionForm")
        // actionForm.innerHTML += str

        const registerForm = document.querySelector(".registerForm")


//
        document.querySelector(".uploadResult").innerHTML += str
        registerForm.submit()
    }, false)

</script>
</body>
</html>
