<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<div class="dataTable-bottom">
    <div class="col-sm-12 col-md-7">
        <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
            <ul class="pagination">
                <li class="page-item" id="dataTable_previous">
                    <a class="page-link" href="${pageMaker.start-1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>

                <c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" var="num">
                    <li class="page-item"><a class="page-link" href="${num}">${num}</a></li>
                </c:forEach>

                <li class="page-item" id="dataTable_next">
                    <a class="page-link" href="${pageMaker.end+1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>