<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>협상 내역</title>
    <link href="../../../../resources/css/style.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <link href="../../../resources/css/custom.css" rel="stylesheet"/>
</head>
<body class="sb-nav-fixed">

<%@ include file="/WEB-INF/includes/navbar.jsp" %>

<div id="layoutSidenav_content">

    <div class="row m-3">

        <div class="container-fluid px-4 col-xl-6 ">

            <h2 class="mt-4 m-3">시공상세</h2>
            <div class="card mb-4">

                <div class="contractInfo card-body customFlexColumn">

                    <div class="pdfArea">
                        <canvas id="the-canvas" class="h-100"></canvas>
                        <div>
                            <p>Page: <span id="page_num"></span> / <span id="page_count"></span></p>
                            <button id="prev" class="carousel-control-prev" type="button"
                                    data-bs-target="#carouselExampleDark"
                                    data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button id="next" class="carousel-control-next" type="button"
                                    data-bs-target="#carouselExampleDark"
                                    data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                            <%--                          --%>
                            <%--                            <button id="prev"><i class="fa-solid fa-angle-left"></i></button>--%>
                            <%--                            <button id="next"><i class="fa-solid fa-angle-right"></i></button>--%>

                        </div>
                    </div>

                    <div id="carouselExampleIndicators" class="carousel slide imgArea" data-bs-ride="true">
                        <div class="pictures carousel-inner">
                            <%--                            <div class="carousel-item active">--%>
                            <%--                                <img src="..." class="d-block w-100" alt="...">--%>
                            <%--                            </div>--%>
                            <%--                            <div class="carousel-item">--%>
                            <%--                                <img src="..." class="d-block w-100" alt="...">--%>
                            <%--                            </div>--%>
                            <%--                            <div class="carousel-item">--%>
                            <%--                                <img src="..." class="d-block w-100" alt="...">--%>
                            <%--                            </div>--%>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                                data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                                data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="input-group" style="margin:1em 1em 1em 0;">
                        <input type="text" class="form-control" value="${nego.price}">
                        <button class="input-group-text btn">\</button>
                    </div>
                    <div class="btns row justify-content-center">
                        <button class="btn btn-secondary pdfBtn" style="max-width: 5em; margin: 0.3em">계약서</button>
                        <button class="btn btn-primary imgBtn" style="max-width: 5em; margin: 0.3em">이미지</button>
                        <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal"
                                style="max-width: 5em; margin: 0.3em">진행
                        </button>
                    </div>
                </div>
            </div>
        </div>


        <div class="container-fluid px-4 col-xl-6">
            <h2 class="mt-4 m-3">협상내역</h2>
            <div class="card mb-4">
                <div class="card-header">
                    <svg class="svg-inline--fa fa-table me-1" aria-hidden="true" focusable="false" data-prefix="fas"
                         data-icon="table" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
                         data-fa-i2svg="">
                        <path fill="currentColor"
                              d="M448 32C483.3 32 512 60.65 512 96V416C512 451.3 483.3 480 448 480H64C28.65 480 0 451.3 0 416V96C0 60.65 28.65 32 64 32H448zM224 256V160H64V256H224zM64 320V416H224V320H64zM288 416H448V320H288V416zM448 256V160H288V256H448z"></path>
                    </svg><!-- <i class="fas fa-table me-1"></i> Font Awesome fontawesome.com -->
                    채팅
                </div>
                <div class="card-body">
                    <div class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
                        <div class="chatArea"></div>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" aria-label="Recipient's username"
                               aria-describedby="button-addon2">
                        <button class="btn btn-outline-secondary" type="button" id="button-addon2">입력</button>
                    </div>
                </div>
            </div>
            <%--        <h7>${dtoList}</h7>--%>
            <%--        <h7>${pageMaker}</h7>--%>
        </div>
    </div>
    <%--    <span>${nego}</span>--%>
</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">사인란</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div>
                <div class="modal-body customFlexColumn">
                    <div class="signArea customFlexRowAround">
                        <div class="workerSignArea">
                            <h4 class="text-center">시공사 사인(인)</h4>
                            <canvas class="workerSign">

                            </canvas>
                        </div>
                        <div class="requesterSignArea">
                            <h4 class="text-center">의뢰자 사인(인)</h4>
                            <canvas class="requesterSign">

                            </canvas>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="signClear btn btn-secondary">지우기</button>
                    <button type="button" class="signSave finishNegotiation btn btn-primary">완료</button>
                </div>
            </div>

            <form action="" method="post">
                <input type="hidden" class="worker" value="">
                <input type="hidden" class="requester" value="">
                <input type="hidden" class="price" value="">
                <input type="hidden" class="requesterSign" value="">
                <input type="hidden" class="workerSign" value="">
            </form>
        </div>
    </div>
</div>

</div>
<%@ include file="/WEB-INF/includes/footer.jsp" %>
<%--pdf.js--%>
<script src="//mozilla.github.io/pdf.js/build/pdf.js"></script>
<!-- html2canvas -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="../../../../../resources/js/sign.js"></script>
<script src="../../../../../resources/js/pdfview.js"></script>

<script>


    const pdfArea = document.querySelector(".pdfArea")
    pdfArea.style.display = 'none'
    const imgArea = document.querySelector(".imgArea")


    document.querySelector(".imgBtn").addEventListener("click", (e) => {
        pdfArea.style.display = 'none'
        imgArea.style.display = 'block'
    }, false)


    document.querySelector(".pdfBtn").addEventListener("click", (e) => {
        pdfArea.style.display = 'block'
        imgArea.style.display = 'none'

    }, false)


    const workerSign = document.querySelector(".workerSign");
    signSet(workerSign)

    const requesterSign = document.querySelector(".requesterSign");
    signSet(requesterSign)

    const conNo = ${nego.conNo};

    document.addEventListener('DOMContentLoaded', (e) => {

        axios.get("/auction/files/" + conNo).then(
            res => {
                const arr = res.data
                let str = `<div class="carousel-item active" data-index='\${0}'>
                                <img src='/view?fileName=\${arr[0].link}' class="conImg d-block w-100" alt="...">
                            </div>`
                for (let i = 1; i < arr.length; i++) {
                    str += ` <div class="carousel-item" data-index='\${i}'>
                                <img src='/view?fileName=\${arr[i].link}' class="conImg d-block w-100" alt="...">
                            </div>`
                }
                document.querySelector(".pictures").innerHTML = str
            })
    }, false)


    document.addEventListener('DOMContentLoaded', (e) => {
        infoToServer(conNo).then(result => {
            // document.querySelector(".pdfTest").src = '/view?fileName='+result.conDocument
            console.log(result.conDocument)
            viewer("/view?fileName=" + result.conDocument)
        }).catch(err => console.log(err))
    }, false);

    async function infoToServer(conNo) {
        try {
            const res = await axios.get("/info/contract/" + conNo)
            return res.data
        } catch (err) {
            return err
        }
    }

</script>

</body>
</html>
