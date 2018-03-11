
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="application/javascript">
    $(function () {
       $("li a").click(function () {
           var no = $(this).attr("no");
           var url = location.href.split("?")[0] + "?pageNum=" + no + "&pageSize=3";
           location.href = url;
       });
    });
</script>
<div class="row">
    <div class="col-md-4 col-md-offset-2">
        <h5>共${pageInfo.total}条记录;共${pageInfo.pages}页</h5>
    </div>
    <div class="col-md-6">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <c:if test="${pageInfo.isFirstPage}">
                    <li class="disabled"><span href="#">首页</span></li>
                </c:if>
                <c:if test="${pageInfo.isFirstPage eq false}">
                    <li><a no="1" href="#">首页</a></li>
                </c:if>
                <c:if test="${pageInfo.hasPreviousPage}">
                    <li>
                        <a no="${pageInfo.prePage}" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${pageInfo.hasPreviousPage eq false}">
                    <li class="disabled">
                        <span href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </span>
                    </li>
                </c:if>

                <c:forEach items="${pageInfo.navigatepageNums}" var="no">

                    <li  <c:if test="${pageInfo.pageNum eq no}">class="active"</c:if>><a no="${no}" href="#">${no}</a></li>
                </c:forEach>

                <c:if test="${pageInfo.hasNextPage}">
                    <li>
                        <a no="${pageInfo.nextPage}" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${pageInfo.hasNextPage eq false}">
                    <li class="disabled">
                        <span href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </span>
                    </li>
                </c:if>
                <c:if test="${pageInfo.isLastPage}">
                    <li class="disabled"><span href="#">末页</span></li>
                </c:if>
                <c:if test="${pageInfo.isLastPage eq false}">
                    <li><a no="${pageInfo.pages}" href="#">末页</a></li>
                </c:if>

            </ul>
        </nav>






    </div>
</div>