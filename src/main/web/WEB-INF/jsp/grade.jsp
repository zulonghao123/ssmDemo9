<%--
  Created by IntelliJ IDEA.
  User: 祖龙浩
  Date: 2018/2/6
  Time: 19:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <%@include file="basic.jsp"%>
</head>
<body>
<div class="container">
    <%@include file="top.jsp"%>
    <div class="row">
        <%@include file="left.jsp"%>
        <div class="col-md-10 col-md-offset-2">
            班级信息
        </div>
    </div>
    <div class="row">
        <div class="col-md-1 col-md-offset-8">
            <button type="button" name="addGradeButton" class="btn btn-info">添加班级</button>
        </div>
        <div class="col-md-1 ">
            <button class="btn btn-danger" name="deleteGradeListButton" type="button">批量删除</button>
        </div>
    </div>
    <div class="row">
        <div>
            <h3></h3>
        </div>
    </div>

    <div class="row">
        <div class="col-md-10 col-md-offset-2">
            <table class="table table-striped">
                <tr>
                    <td></td>
                    <td>ID</td>
                    <td>班级名称</td>
                    <td>班级描述</td>
                    <td>创建时间</td>
                    <td>操作</td>
                </tr>
                <c:forEach items="${pageInfo.list}" var="grade">
                    <tr>
                        <td>
                            <input name="gradeIds" type="checkbox" value="${grade.id}"/>
                        </td>
                        <td>${grade.id}</td>
                        <td>${grade.gradeName}</td>
                        <td>${grade.details}</td>
                        <td>
                            <fmt:formatDate value="${grade.createDate}" pattern="yyyy-MM-dd"></fmt:formatDate>
                        </td>
                        <td>
                            <button no="${grade.id}" class="btn btn-info" type="button" name="queryGradeButton">详情</button>
                            <button no="${grade.id}" class="btn btn-info" type="button" name="updateGradeButton">修改</button>
                            <button no="${grade.id}" class="btn btn-danger" type="button" name="deleteGradeButton">删除</button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <%@include file="page.jsp"%>
</div>

<div class="modal fade" tabindex="-1" role="dialog" id="queryGradeModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">班级信息</h4>
            </div>
            <div class="modal-body">
                <table>
                    <tr>
                        <td>班级名称:</td>
                        <td id="gradeNameDiv"></td>
                    </tr>
                    <tr>
                        <td>创建时间:</td>
                        <td id="createDateDiv"></td>
                    </tr>
                    <tr>
                        <td>班级描述:</td>
                        <td id="gradeDetailsDiv"></td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<%--添加班级模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" id="addGradeModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加班级</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="addGradeForm">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">班级名称:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="gradeName" placeholder="班级名称"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">班级描述:</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" rows="3" name="details" placeholder="班级描述"></textarea>
                        </div>
                    </div>

                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" name="saveAddButton">保存班级信息</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<%--修改班级模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" id="updateGradeModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">修改班级</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="updateGradeForm">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">班级名称:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="gradeName" id="updateGradeName"  readonly/>
                            <input type="hidden" name="id" id="updateId"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">班级描述:</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" rows="3" id="updateDetails" name="details" ></textarea>
                        </div>
                    </div>

                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" name="saveUpdateButton">修改班级信息</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->








</body>
<script type="application/javascript">
    $(function () {

        $("button[name='addGradeButton']").click(function () {
            $("#addGradeModal").modal("show");
        });
        $("button[name='saveAddButton']").click(function () {
            var grade = $("#addGradeForm").serialize();
            $.post("${pageContext.request.contextPath}/grade/addGrade",grade,function (data) {
                alert(data.msg);
                $("#addGradeForm").modal("hide");
                location.href = location.href;
            });
        });
        $("button[name='updateGradeButton']").click(function () {
            var no = $(this).attr("no");
            $.get("${pageContext.request.contextPath}/grade/queryGradeById",{"gradeId":no},function (data) {
                $("#updateGradeName").val(data.gradeName);
                $("#updateId").val(data.id);
                $("#updateDetails").val(data.details);
                $("#updateGradeModal").modal("show");
            });
        });
        $("button[name='saveUpdateButton']").click(function () {
            var grade = $("#updateGradeForm").serialize();
            $.post("${pageContext.request.contextPath}/grade/updateGrade",grade,function (data) {
                alert(data.msg);
                $("#updateGradeModal").modal("hide");
                location.href = location.href;
            });
        });












       $("button[name='queryGradeButton']").click(function () {
           var no = $(this).attr("no");
           $.get("${pageContext.request.contextPath}/grade/queryGradeById",{"gradeId":no},function (data) {
               $("#gradeNameDiv").html(data.gradeName);
               var date = new Date(data.createDate);
               var y = date.getFullYear();
               var m = date.getMonth()+1;
               var d = date.getDate();
               $("#createDateDiv").html(y+"年"+m+"月"+d+"日");
               $("#gradeDetailsDiv").html(data.details);
               $("#queryGradeModal").modal("show");
           },"json");
       });

        $("button[name='deleteGradeButton']").click(function () {
            var no = $(this).attr("no");
            $.get("${pageContext.request.contextPath}/grade/deleteGradeById",{"gradeId":no},function (data) {
                alert(data.msg);
                location.href = location.href;
            },"json");
        });
        $("button[name='deleteGradeListButton']").click(function () {
            var gradeIds = "";
            $.each($("input:checkbox"),function () {
               if(this.checked){
                   gradeIds = gradeIds + $(this).val() + ",";
               }
            });
            if(gradeIds==""){
                alert("请选择要删除的班级?");
            }else{
                if(confirm("确定删除这些班级信息吗?")){
                    $.post("${pageContext.request.contextPath}/grade/deleteGradeListByIds",{"gradeIds":gradeIds},function (data) {
                        alert(data.msg);
                        location.href = location.href;
                    },"json");
                }
            }
        });

    });
</script>
</html>
