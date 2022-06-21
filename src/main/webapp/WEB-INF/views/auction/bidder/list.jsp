<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="../../../../resources/css/style.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <link href="../../../resources/css/custom.css" rel="stylesheet"/>
</head>
<body class="sb-nav-fixed">

<%@ include file="/WEB-INF/includes/navbar.jsp" %>

<div id="layoutSidenav_content">
    <div class="container-fluid px-4">

        <h1 class="mt-4">입찰자 목록</h1>
<%--        <ol class="breadcrumb mb-4">--%>
<%--            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>--%>
<%--            <li class="breadcrumb-item active">Tables</li>--%>
<%--        </ol>--%>
        <div class="card mb-4">
            <%--            <div class="card-body">--%>
            <%--            DataTables is a third party plugin that is used to generate the demo table below. For more information--%>
            <%--            about DataTables, please visit the--%>
            <%--            <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>--%>
            <%--            .--%>
            <%--        </div>--%>
        </div>

        <div class="card mb-4">
            <div class="card-header">
                <svg class="svg-inline--fa fa-table me-1" aria-hidden="true" focusable="false" data-prefix="fas"
                     data-icon="table" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
                     data-fa-i2svg="">
                    <path fill="currentColor"
                          d="M448 32C483.3 32 512 60.65 512 96V416C512 451.3 483.3 480 448 480H64C28.65 480 0 451.3 0 416V96C0 60.65 28.65 32 64 32H448zM224 256V160H64V256H224zM64 320V416H224V320H64zM288 416H448V320H288V416zM448 256V160H288V256H448z"></path>
                </svg><!-- <i class="fas fa-table me-1"></i> Font Awesome fontawesome.com -->
                 입찰자 목록
            </div>
            <div class="card-body">
                <div class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
                    <%--                    <div class="dataTable-top">--%>

                    <%--                    </div>--%>
                    <div class="dataTable-container row bidList">

                        <c:forEach items="${dtoList}" var="company">
                            <div class="col-md-4 py-3">
                                <div class="card h-100">
                                    <div class="card-body customFlexRow">

                                            <%--                                    <img src="../img/asset/logo/logo.png" style="max-width: 70px; max-height: 70px;" alt="">--%>
<%--                                                <c:if test="${company.comProfile !=null}">--%>
<%--                                                    <img src='/view?fileName=${company.getProfile()}' alt="...">--%>
<%--                                                </c:if>--%>
                                        <div>
                                            <h4 data-id="${company.comId}" class="card-title">${company.comId}</h4>
                                            <h4 data-name="${company.comName}" class="card-title">${company.comName}</h4>
                                            <p class="card-text">${company.comIntro}</p>
                                            <p class="card-text">${company.comPhone}</p>
                                            <p class="card-text">${company.comEmail}</p>
                                            <p data-conNo="${company.conNo}" class="card-text">${company.conNo}</p>
                                        </div>

                                    </div>
                                    <div class="card-footer" data-conNo="${company.comId}">
                                        <div class="input-group" style="margin:1em 1em 1em 0;">
                                            <input data-price ="${company.price}" type="text" class="form-control" value="${company.price}" readonly>
                                            <span class="input-group-text">\</span>
                                        </div>
                                        <div data-bno ="${company.bno}" data-comId="${company.comId}" class="bidBtns">
                                            <button class="readBtn btn btn-primary" data-bs-toggle="modal"
                                                    data-bs-target="#exampleModal">상세보기
                                            </button>
                                            <button class="bidBtn btn btn-success" data-bs-toggle="modal"
                                                    data-bs-target="#exampleModal2">낙찰
                                            </button>
                                            <button class="delBtn btn btn-danger">거부</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </c:forEach>


                    </div>

                    <%--                    <h1>${dtoList}</h1>--%>
                    <form class="actionForm" action=""></form>
                    <%@ include file="/WEB-INF/includes/pagination.jsp" %>


                </div>
            </div>
        </div>


<%--        <h1>${bidders}</h1>--%>
<%--        &lt;%&ndash;        <h7>${dtoList}</h7>&ndash;%&gt;--%>
<%--        <h7>${pageMaker}</h7>--%>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="infoBody modal-body">

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel2"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel2">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <p class="bidderName"></p>
                        <form class="selectBidder" action="/contract/nego/register" method="post">
                            <input class="conNo" type="hidden" name="conNo" value="${contract.conNo}">
                            <input class="worker" type="hidden" name="worker" value="">
                            <input class="requester" type="hidden" name="requester" value="${contract.requester}">
                            <div class="input-group" style="margin:1em 1em 1em 0;">
                                <input type="text" class="price form-control" name="price" value="" readonly>
                                <span class="input-group-text">\</span>
                            </div>
                        </form>

                        해당 입찰자로 낙찰 하시겠습니까?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                        <button type="button" class="selectBtn btn btn-primary">승인</button>
                    </div>
                </div>
            </div>
        </div>


    </div>
</div>
</div>

<form class="actionForm" action="/company/auction/list" method="get">
    <input type="hidden" name="page" value="${listDTO.page}">
    <input type="hidden" name="size" value="${listDTO.size}">
    <input type="hidden" name="type" value="${listDTO.type == null? "":listDTO.type}">
    <input type="hidden" name="keyword" value="${listDTO.keyword == null? "":listDTO.keyword}">
</form>

<%--<h2>${contract.requester}</h2>--%>

<%@ include file="/WEB-INF/includes/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>

    const bidList = document.querySelector(".bidList")
    let worker = document.querySelector(".worker")
    let price = document.querySelector(".price")
    let bidderName = document.querySelector(".bidderName")


    bidList.addEventListener("click", (e) => {
        let btn = e.target
        const comId = btn.closest('div').getAttribute("data-comId")
        const  bno = btn.closest('div').getAttribute("data-bno")
        console.log(bno)

        if (btn.classList.contains("readBtn")) {
            infoToServer(comId).then(result => {
                let str = ""
                str = `<p>\${result.comName}</p>`
                // console.log(`<p>\${result.comId}</p>`)
                document.querySelector(".infoBody").innerHTML = str
            }).catch(err => console.log(err))
        }

        if (btn.classList.contains("bidBtn")) {

            bidderInfoToServer(bno).then(result =>{
                const comId = result.comId
                bidderName.innerText = comId

                worker.value = comId

                price.value = result.price
                console.log(result.price)

            }).catch(err => console.log(err))

            document.querySelector(".selectBtn").addEventListener("click",(e)=>{
                console.log(comId)
                const conNo = document.querySelector(".conNo").getAttribute("value")
                e.preventDefault()
                e.stopPropagation()
                selectToServer(comId)
                allRemoveToServer()
                updateAsNegotiation(conNo)
                const selectBidder = document.querySelector(".selectBidder")
                selectBidder.submit()

            }, false)
        }

        if (btn.classList.contains("delBtn")) {
            console.log("del")
        }

        return

    }, false)

    async function updateAsNegotiation(conNo){
        try {
            const res = axios.post("/contract/updatenego/"+conNo)
        }catch (err){
            return err;
        }
    }

    async function selectToServer(comId){
        try {
            const res = axios.post("/bidder/selectbid/"+comId)
        }catch (err){
            return err;
        }
    }

    async function allRemoveToServer(){
        try {
            const res = await axios.post("/bidder/allremove")
        }catch (err){
            return err;
        }
    }

    async function infoToServer(comId) {
        try {
            const res = await axios.get("/info/company/" + comId)
            return res.data
        } catch (err) {
            return err
        }
    }

    async function bidderInfoToServer(bno){
        try {
            const res = await axios.get("/info/bidder/" + bno)
            console.log(res.data)
            return  res.data
        }catch (err){
            return err
        }
    }


</script>

</body>
</html>
