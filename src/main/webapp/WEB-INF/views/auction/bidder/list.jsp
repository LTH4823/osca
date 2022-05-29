<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="../../../../resources/css/style.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">

<%@ include file="/WEB-INF/includes/navbar.jsp" %>

<div id="layoutSidenav_content">
    <div class="container-fluid px-4">

        <h1 class="mt-4">입찰자</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
            <li class="breadcrumb-item active">Tables</li>
        </ol>
        <div class="card mb-4">
            <div class="card-body">
                DataTables is a third party plugin that is used to generate the demo table below. For more information
                about DataTables, please visit the
                <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
                .
            </div>
        </div>


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
                                                                            class="dataTable-sorter">계약명</a></th>
                                <th data-sortable="" style="width: 20%;"><a href="#" class="dataTable-sorter">장소</a>
                                </th>
                                <th data-sortable="" style="width: 25%;"><a href="#"
                                                                            class="dataTable-sorter">기간</a></th>

                                <th data-sortable="" style="width: 10%;"><a href="#" class="dataTable-sorter text-center">정보</a></th>
                                <th data-sortable="" style="width: 10%;"><a href="#" class="dataTable-sorter text-center">파기</a>
                                <th data-sortable="" style="width: 10%;"><a href="#" class="dataTable-sorter text-center">입찰</a>
                                </th>
                            </tr>
                            </thead>
                            <tbody class="dtoList">

                            <c:forEach items="${dtoList}" var="contract" varStatus="status">
                                <tr>
<%--                                    <td data-conNo = "${contract.conNo}" class="con-link text-center">${status.count}</td>--%>
<%--                                    <td data-conName = "${contract.conName}" class="con-link text-center">${contract.conName}</td>--%>
<%--                                    <td data-conLocation = "${contract.conLocation}" class="con-link text-center">${contract.conLocation}</td>--%>
<%--                                    <td class="con-link text-center">${contract.conStartDay} ~ ${contract.conEndDay}</td>--%>
<%--                                    <td class="con-link text-center"><button class="readBtn btn btn-primary">보기</button></td>--%>
<%--                                    <td class="con-link text-center"><button class="delBtn btn btn-danger">파기</button></td>--%>
<%--                                    <td class="con-link text-center"><a class="dtoLink btn btn-success mt-auto"--%>
<%--                                                                        href="/bidder/${contract.conNo}/list">상태</a></td>--%>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>


                    <h1>${dtoList}</h1>

                    <form class="actionForm" action=""></form>

                    <%@ include file="/WEB-INF/includes/pagination.jsp" %>


                </div>
            </div>
        </div>


        <h1>${bidders}</h1>
        <%--        <h7>${dtoList}</h7>--%>

        <h7>${pageMaker}</h7>


    </div>
</div>
</div>

<form class="actionForm" action="/company/auction/list" method="get">
    <input type="hidden" name="page" value="${listDTO.page}">
    <input type="hidden" name="size" value="${listDTO.size}">
    <input type="hidden" name="type" value="${listDTO.type == null? "":listDTO.type}">
    <input type="hidden" name="keyword" value="${listDTO.keyword == null? "":listDTO.keyword}">
</form>

<%@ include file="/WEB-INF/includes/footer.jsp" %>

</body>
</html>
