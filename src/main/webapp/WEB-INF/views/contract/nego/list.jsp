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

        <h1 class="mt-4">협상목록</h1>
        <div class="card mb-4">
            <%--            <div class="card-body">--%>
            <%--                DataTables is a third party plugin that is used to generate the demo table below. For more information--%>
            <%--                about DataTables, please visit the--%>
            <%--                <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>--%>
            <%--                .--%>
            <%--            </div>--%>
        </div>


        <div class="card mb-4">
            <div class="card-header">
                <svg class="svg-inline--fa fa-table me-1" aria-hidden="true" focusable="false" data-prefix="fas"
                     data-icon="table" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
                     data-fa-i2svg="">
                    <path fill="currentColor"
                          d="M448 32C483.3 32 512 60.65 512 96V416C512 451.3 483.3 480 448 480H64C28.65 480 0 451.3 0 416V96C0 60.65 28.65 32 64 32H448zM224 256V160H64V256H224zM64 320V416H224V320H64zM288 416H448V320H288V416zM448 256V160H288V256H448z"></path>
                </svg><!-- <i class="fas fa-table me-1"></i> Font Awesome fontawesome.com -->
                협상 중인 계약목록
            </div>
            <div class="card-body">
                <div class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
                    <div class="dataTable-top">

                    </div>
                    <div class="dataTable-container">
                        <table id="datatablesSimple" class="dataTable-table">
                            <thead>
                            <tr>
                                <th class="text-center" style="width: 3%;">No.</th>
                                <th class="text-center" style="width: 30%;">계약명</th>
                                <th class="text-center" style="width: 20%;">시공사명</th>
                                <th class="text-center" style="width: 20%;">의뢰자명</th>
                                <th class="text-center" style="width: 9%;">계약정보</th>
                                <th class="text-center" style="width: 9%;">현상진행</th>
                                <th class="text-center" style="width: 9%;">협상파기</th>
                                <%--                                <th data-sortable="" style="width: 12.5%;"><a href="#" class="dataTable-sorter text-center">파기</a>--%>
                                <%--                                </th>--%>
                            </tr>
                            </thead>
                            <tbody class="dtoList">

                            <c:forEach items="${dtoList}" var="nego" varStatus="status">
                                <tr>
                                    <td data-num="${status.count}" class="text-center">${status.count}</td>
                                    <td data-conNo="${nego.conNo}" class="text-center">${nego.conName}</td>
                                    <td data-conName="${nego.worker}" class="text-center">${nego.worker}</td>
                                    <td data-conLocation="${nego.requester}"
                                        class="con-link text-center">${nego.requester}</td>
                                    <td class="con-link text-center">
                                        <button class="detailBtn btn btn-info"><a class="text-white" style="text-decoration: none">보기</a></button>
                                    </td>
                                        <%--                                    href="/contract/nego/read/${nego.negoNo}" style="text-decoration: none">보기</a></button></td>--%>
                                    <td class="text-center">
                                        <button class="detailBtn btn btn-primary"><a class="text-white" href="/contract/nego/read/${nego.negoNo}" style="text-decoration: none">진행</a>
                                        </button>
                                    </td>
                                    <td class="text-center">
                                        <button class="detailBtn btn btn-danger"><a class="text-white" style="text-decoration: none">파기</a></button>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                    <%@ include file="/WEB-INF/includes/pagination.jsp" %>
                </div>
            </div>
        </div>


        <%--        <h1>${dtoList}</h1>--%>

        <%--        <h1>${pageMaker}</h1>--%>
        <%--        <h7>${dtoList}</h7>--%>

        <%--        <h7>${pageMaker}</h7>--%>


    </div>
</div>
</div>

<%@ include file="/WEB-INF/includes/footer.jsp" %>

</body>
</html>
