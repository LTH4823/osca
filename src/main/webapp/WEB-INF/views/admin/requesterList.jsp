<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/resources/assets/favicon.ico"/>
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/resources/css/styles.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/resources/css/customStyle.css">
    <title>requesterPage</title>
</head>
<body>

<div class="d-flex" id="wrapper">


    <div class="border-end bg-white" id="sidebar-wrapper">
        <div class="customListName sidebar-heading border-bottom bg-light">관리목록
        </div>
        <div class="list-group list-group-flush">
            <a class="contractList list-group-item list-group-item-action list-group-item-light p-3" href="http://localhost:8080/admin/contract/list">계약관리</a>
            <a class="clientList list-group-item list-group-item-action list-group-item-light p-3" href="http://localhost:8080/admin/requester/list">의뢰자관리</a>
            <a class="workerList list-group-item list-group-item-action list-group-item-light p-3" href="http://localhost:8080/admin/contractor/list">시공사관리</a>
            <a class="settingForm list-group-item list-group-item-action list-group-item-light p-3" href="#!">관리설정</a>
        </div>
    </div>
    <!-- Page content wrapper-->
    <div id="page-content-wrapper">
        <!-- Top navigation-->
        <nav class=" navbar customNavbar navbar-expand-lg navbar-light bg-light border-bottom">
            <div class="container-fluid">
                <button class="btn fs-2" id="sidebarToggle">OSCA</button>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation"><span
                        class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                        <li class="nav-item active"><a class="nav-link" href="http://localhost:8080/admin/adminList">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Logout</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Setting</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Page content-->
        <div class="container-fluid">

            <div class="searchDiv">
                <select class="type">
                    <option value="">---</option>
                    <option value="t" ${listDTO.type =="t"?"selected":""}>제목</option>
                    <option value="tc"  ${listDTO.type =="tc"?"selected":""}>제목내용</option>
                    <option value="tcw"  ${listDTO.type =="tcw"?"selected":""}>제목내용작성자</option>
                </select>
                <input type="text" name="keyword" value="${listDTO.keyword}">
                <button class="searchBtn">Search</button>
            </div>

            <table class="table table-bordered dtoList">
                <thead>
                <tr>
                    <th scope="col">No.</th>
                    <th scope="col">의뢰자ID</th>
                    <th scope="col">의뢰자이름</th>
                    <th scope="col">의뢰자번호</th>
                    <th scope="col">의뢰자E-mail</th>
                    <th scope="col">의뢰자첨부파일</th>
                    <th scope="col">주민등록번호</th>
                    <th scope="col">가입일</th>
                    <th scope="col">수정일</th>
                    <th scope="col">삭제여부</th>

                </tr>
                </thead>

                <tbody class="tableValue">
                <c:forEach items="${reqDtoList}" var="req" varStatus="modIdx">
                    <tr>
                    <th>${req.reqno}</th>
                    <td>${req.reqID}</td>
                    <td>${req.reqName}</td>
                    <td>${req.reqCall}</td>
                    <td>${req.reqEmail}</td>
                    <td>${req.reqImg}</td>
                    <td>${req.residentNum}</td>
                    <td>${req.regDate}</td>
                    <td>${req.updateDate}</td>
                    <td>${req.reqDelFlag}</td>
                    <c:if test="${req.reqDelFlag ne '1'}">
                        <td><button data-modIdx="${modIdx.index}" class="modBtn btn btn-secondary">수정</button>
                            <button data-reqno='${req.reqno}' class="delBtn btn btn-danger">삭제</button></td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>


            <div class="customFooter">
                <%--                ${pageMaker}--%>
                <span>현재 Page: ${pageMaker.page}, 목록 Total: ${pageMaker.total} </span>
                <ul class="pagination">
                    <c:if test="${pageMaker.prev}">
                        <li class="paginate_button page-item" id="dataTable_previous">
                            <a class="page-link" href="${pageMaker.start-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" var="num">
                        <li class="paginate_button page-item"><a class="page-link"
                                                                 href="${num}">${num}</a></li>
                    </c:forEach>
                    <c:if test="${pageMaker.next}">
                        <li class="paginate_button page-item" id="dataTable_next">
                            <a class="page-link" href="${pageMaker.end+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </div>
            <form class="actionForm" action="/admin/requesterList" method="get">
                <input type="hidden" name="page" value="${listDTO.page}">
                <input type="hidden" name="size" value="${listDTO.size}">
                <input type="hidden" name="type" value="${listDTO.type == null?'':listDTO.type}">
                <input type="hidden" name="keyword" value="${listDTO.keyword == null? '':listDTO.keyword}">
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>

    const linkDiv = document.querySelector(".pagination")
    const actionForm = document.querySelector(".actionForm")

    const contractList = document.querySelector(".contractList")
    const clientList = document.querySelector(".clientList")
    const workerList = document.querySelector(".workerList")

    const tableValue = document.querySelector(".tableValue")

    let arridx =0

    //---------------------------------------------------------------------------------------------------

    tableValue.addEventListener("click", (e) => {
        e.preventDefault() //기본기능 방지
        e.stopPropagation() //전파 방지
        // if(e.target.getAttribute("class").indexOf("modBtn")){
        if(e.target.getAttribute("class").indexOf('.modBtn') < 0){
            arridx = parseInt(e.target.getAttribute("data-modIdx"))
            // alert(arridx)
            // console.log(arridx)
            console.log(arridx)

            console.log("${reqDtoList[arridx].reqno}")
            <%--self.location = `/admin/requester/modify${reqDtoList[arridx].reqno}`--%>
            // $('.form-control').val(arridx)

        }

        if (!e.target.getAttribute("data-reqno")) {
            //이벤트가 발생한곳에서 data-adno로 값을 가지고 있는지 확인

            return;

        }
        const reqno = e.target.getAttribute("data-reqno")
        //data-adno로 adno값을 저장해둔것을 가져온다

        removeServer(reqno).then(result => {
            console.log(result)
        })
        //아래에 비동기 코드
        //promise로 반환되기때문에 .then절 사용
        let targetLi;
        targetLi = e.target.closest("td")
        targetLi.innerHTML = " "
        //글목록이 아예 사라지지 않기 때문에 버튼이 남게되어
        //삭제후 버튼에 해당하는 부분을 Delete문자열을 넣음
        alert("No."+reqno+"글이 삭제 되었습니다")
        //나중에 모달로 수정해야한다
        self.location = `/admin/requesterList${listDTO.link}`

    }, false)

    contractList.addEventListener("click", (e) => {
        console.log("contract")

    }, false)

    clientList.addEventListener("click", (e) => {
        console.log("client")
    }, false)

    workerList.addEventListener("click", (e) => {
        console.log("worker")
    }, false)


    document.querySelector(".dtoList").addEventListener("click", (e) => {

        e.preventDefault()
        e.stopPropagation()

        const target = e.target
        if (target.getAttribute("class").indexOf('dtoLink') < 0) {
            return
        }
        const url = target.getAttribute("href")
        //alert(url)
        actionForm.setAttribute("action", url)
        actionForm.submit()

    }, false)

    linkDiv.addEventListener("click", (e) => {
        e.stopPropagation()
        e.preventDefault()

        const target = e.target

        if (target.getAttribute("class") !== 'page-link') {
            return
        }

        const pageNum = target.getAttribute("href")
        actionForm.querySelector("input[name='page']").value = pageNum
        actionForm.setAttribute("action", "/admin/requesterList")
        actionForm.submit()

    }, false)


    document.querySelector(".searchBtn").addEventListener("click", (e) => {
        const type = document.querySelector('.searchDiv .type').value
        const keyword = document.querySelector(".searchDiv input[name='keyword']").value

        console.log(type, keyword)

        actionForm.setAttribute("action", "/admin/requesterList")
        actionForm.querySelector("input[name='page']").value = 1
        actionForm.querySelector("input[name='type']").value = type
        actionForm.querySelector("input[name='keyword']").value = keyword
        actionForm.submit()


    }, false)



    const result = '${result}'

    console.log(result)

    if (result !== '') {
        alert("처리되었습니다.")
    }
    //===========================================================================================
    async function removeServer(reqno) {

        const res = await axios.delete(`/admin/requester/delete/\${reqno}`)
        //delete형식으로 값을 json형식으로 Controller에 넘겨준다
        const result = res.data
        return result.data
    }


</script>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/resources/js/scripts.js"></script>

<!-- fontawesome -->
<script src="https://kit.fontawesome.com/67818242f4.js" crossorigin="anonymous"></script>
</body>
</html>