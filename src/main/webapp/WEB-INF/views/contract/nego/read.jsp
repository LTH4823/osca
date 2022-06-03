<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>협상 내역</title>
    <link href="../../../../resources/css/style.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <%--    <link rel="stylesheet" href="../../../../../resources/css/sign.css">--%>
</head>
<body class="sb-nav-fixed">

<%@ include file="/WEB-INF/includes/navbar.jsp" %>

<div id="layoutSidenav_content">

    <div class="row">

        <div class="container-fluid px-4 col-xl-4">

            <h1 class="mt-4">계약 내용</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                <li class="breadcrumb-item active">Tables</li>
            </ol>
            <div class="card mb-4">

                <div class="contractInfo card-body">

                    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                                    class="active" aria-current="true" aria-label="Slide 1"></button>
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                                    aria-label="Slide 2"></button>
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                                    aria-label="Slide 3"></button>
                        </div>
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
                        <button class="btn btn-secondary" style="max-width: 5em; margin: 0.3em">계약서</button>
                        <button class="btn btn-primary" style="max-width: 5em; margin: 0.3em">이미지</button>
                        <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal"
                                style="max-width: 5em; margin: 0.3em">진행
                        </button>
                    </div>
                </div>
            </div>
        </div>


        <div class="container-fluid px-4 col-xl-7">
            <h1 class="mt-4">협상 내용</h1>
            <%--            <h1 class="mt-4"></h1>--%>
            <%--            <ol class="breadcrumb mb-4">--%>
            <%--                <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>--%>
            <%--                <li class="breadcrumb-item active">Tables</li>--%>
            <%--            </ol>--%>
            <%--            <div class="card mb-4">--%>
            <%--                <div class="card-body">--%>
            <%--                    DataTables is a third party plugin that is used to generate the demo table below. For more--%>
            <%--                    information--%>
            <%--                    about DataTables, please visit the--%>
            <%--                    <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>--%>
            <%--                    .--%>
            <%--                </div>--%>
            <%--            </div>--%>


            <div class="card mb-4">
                <div class="card-header">
                    <svg class="svg-inline--fa fa-table me-1" aria-hidden="true" focusable="false" data-prefix="fas"
                         data-icon="table" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
                         data-fa-i2svg="">
                        <path fill="currentColor"
                              d="M448 32C483.3 32 512 60.65 512 96V416C512 451.3 483.3 480 448 480H64C28.65 480 0 451.3 0 416V96C0 60.65 28.65 32 64 32H448zM224 256V160H64V256H224zM64 320V416H224V320H64zM288 416H448V320H288V416zM448 256V160H288V256H448z"></path>
                    </svg><!-- <i class="fas fa-table me-1"></i> Font Awesome fontawesome.com -->
                    DataTable Example
                </div>
                <div class="card-body">
                    <div class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
                        <div class="dataTable-top">

                        </div>
                        <div class="dataTable-container">

                            <table id="datatablesSimple" class="dataTable-table">
                                <thead>
                                <tr>
                                    <th data-sortable="" style="width: 5%;"><a href="#"
                                                                               class="dataTable-sorter">No.</a></th>
                                    <th data-sortable="" style="width: 20%;"><a href="#"
                                                                                class="dataTable-sorter">제목</a></th>
                                    <th data-sortable="" style="width: 25%;"><a href="#" class="dataTable-sorter">금액</a>
                                    </th>
                                    <th data-sortable="" style="width: 30%;"><a href="#"
                                                                                class="dataTable-sorter">작성날짜</a></th>

                                    <th data-sortable="" style="width: 10%;"><a href="#"
                                                                                class="dataTable-sorter text-center">보기</a>
                                    </th>
                                    <th data-sortable="" style="width: 10%;"><a href="#"
                                                                                class="dataTable-sorter text-center">파기</a>
                                    </th>
                                </tr>
                                </thead>
                                <tbody class="dtoList">

                                <c:forEach items="${dtoList}" var="contract" varStatus="status">
                                    <td data-conNo="${contract.conNo}" class="con-link text-center">${status.count}</td>
                                    <td data-conName="${contract.conName}"
                                        class="con-link text-center">${contract.conName}</td>
                                    <td data-conLocation="${contract.conLocation}"
                                        class="con-link text-center">${contract.conLocation}</td>
                                    <td class="con-link text-center">${contract.conStartDay}
                                        ~ ${contract.conEndDay}</td>
                                    <td class="con-link text-center">
                                        <button class="readBtn btn btn-primary">보기</button>
                                    </td>
                                    <td class="con-link text-center">
                                        <button class="delBtn btn btn-danger">파기</button>
                                    </td>
                                </c:forEach>

                                </tbody>
                            </table>
                        </div>
                        <%--                        <%@ include file="/WEB-INF/includes/pagination.jsp" %>--%>
                    </div>
                </div>
            </div>


            <%--        <h7>${dtoList}</h7>--%>

            <%--        <h7>${pageMaker}</h7>--%>


        </div>
    </div>
    <span>${nego}</span>
</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="signArea">
                    <div class="companySignArea">
                        <h4>시공사(인)</h4>
                        <canvas class="companySign">

                        </canvas>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="signClear btn btn-secondary">지우기</button>
                <button type="button" class="signSave btn btn-primary">완료</button>
            </div>
        </div>
    </div>
</div>

</div>
<%@ include file="/WEB-INF/includes/footer.jsp" %>
<!-- html2canvas -->
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="../../../../../resources/js/sign.js"></script>
<script>

    const companySign = document.querySelector(".companySign");
    signSet(companySign);

    const conNo = ${nego.conNo};

    document.addEventListener('DOMContentLoaded', (e) => {

        axios.get("/auction/files/"+conNo).then(
            res => {
                const arr = res.data
                let str = ""
                for (let i = 0; i < arr.length; i++) {
                    str +=` <div class="carousel-item active">
                                <img src='/view?fileName=\${arr[i].link}' class="d-block w-100" alt="...">
                            </div>`
                }
                document.querySelector(".pictures").innerHTML = str
            }
        )
    }, false)


    document.addEventListener('DOMContentLoaded', (e) => {
        infoToServer(conNo).then(result => {
            console.log(result)
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
