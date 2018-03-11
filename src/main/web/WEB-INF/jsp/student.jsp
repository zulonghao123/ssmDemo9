<%--
  Created by IntelliJ IDEA.
  User: 祖龙浩
  Date: 2018/2/6
  Time: 19:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            学生信息
        </div>
    </div>
    <div class="row">
        <div class="col-md-1 col-md-offset-8">
            <button type="button" class="btn btn-info" name="addStudentButton">添加学生</button>
        </div>
        <div class="col-md-1">
            <button type="button" class="btn btn-danger" name="deleteStudentListButton">批量删除</button>
        </div>
    </div>
    <div class="row">
        <div >
            <h2></h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-10 col-md-offset-2">
            <table class="table table-striped">
                <tr>
                    <td></td>
                    <td>ID</td>
                    <td>学生姓名</td>
                    <td>性别</td>
                    <td>年龄</td>
                    <td>学号</td>
                    <td>班级</td>
                    <td>操作</td>
                </tr>
                <c:forEach items="${pageInfo.list}" var="student">
                    <tr>
                        <td>
                            <input type="checkbox" name="studentIds" value="${student.id}"/>
                        </td>
                        <td>${student.id}</td>
                        <td>${student.studentName}</td>
                        <td>${student.gender}</td>
                        <td>${student.age}</td>
                        <td>${student.studentNum}</td>
                        <td>${student.grade.gradeName}</td>
                        <td>
                            <button type="button" no="${student.id}" class="btn btn-info" name="queryStudentButton">详情</button>
                            <button type="button" no="${student.id}" class="btn btn-info" name="updateStudentButton">修改</button>
                            <button type="button" no="${student.id}" class="btn btn-danger" name="deleteStudentButton">删除</button>
                        </td>
                    </tr>
                </c:forEach>
            </table>


        </div>
    </div>
    <%@include file="page.jsp"%>

</div>


<%--添加学生模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" id="addStudentModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加学生</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="addStudentForm">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">学生姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="studentName" placeholder="学生姓名"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <select name="gender" class="form-control">
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">年龄</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="age" placeholder="年龄"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">班级</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="grade.id">

                            </select>
                            <input type="hidden" name="grade.gradeName"/>
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" name="saveStudentButton">保存学生信息</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->









<%--修改学生模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" id="updateStudentModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">修改学生</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="updateStudentForm">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">学生姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="studentName" id="updateStudentName"/>
                            <input type="hidden" name="id" id="updateStudentId"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <select name="gender" class="form-control" id="updateStudentGender">
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">年龄</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="age" id="updateStudentAge"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">学号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="studentNum" id="updateStudentNum" readonly/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">班级</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="grade.id">

                            </select>
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" name="saveUpdateStudentButton">修改学生信息</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


</div>
</body>
<script type="application/javascript">
    function queryAllGrade(ele,modal,gradeId) {
        ele.empty();
        $.get("${pageContext.request.contextPath}/grade/queryAllGrade",function (data) {
            for(var i = 0;i < data.length;i++){
                var optionStr = "<option value='"+data[i].id+"'>"+data[i].gradeName+"</option>";
                ele.append(optionStr);
            }
            if(gradeId!=null || gradeId!=""){
                ele.val(gradeId);
            }
            modal.modal("show");

        });

    }

    $(function () {
        $("button[name='updateStudentButton']").click(function () {
            var studentId = $(this).attr("no");
            $.get("${pageContext.request.contextPath}/student/queryStudentById",{"id":studentId},function (data) {
                $("#updateStudentGender").val(data.gender);
                $("#updateStudentAge").val(data.age);
                $("#updateStudentId").val(data.id);
                $("#updateStudentName").val(data.studentName);
                $("#updateStudentNum").val(data.studentNum);
                queryAllGrade($("select[name='grade.id']"), $("#updateStudentModal"), data.grade.id);
            });
        });
        $("button[name='saveUpdateStudentButton']").click(function () {
            var student = $("#updateStudentForm").serialize();
            $.post("${pageContext.request.contextPath}/student/updateStudent",student,function (data) {
                alert(data.msg);
                location.href = location.href;
            });
        });






        $("button[name='addStudentButton']").click(function () {
            queryAllGrade($("select[name='grade.id']"),$("#addStudentModal"),null);
        });
        $("button[name='saveStudentButton']").click(function () {
            var gradeName = $("select[name='grade.id']").find("option:selected").text();
            $("input[name='grade.gradeName']").val(gradeName);
            var student = $("#addStudentForm").serialize();
            $.post("${pageContext.request.contextPath}/student/addStudent",student,function (data) {
                alert(data.msg);
                location.href = location.href;
            });
        });




        $("button[name='deleteStudentListButton']").click(function () {
            var studentIds = "";
            $.each($("input:checked"),function () {
                if(this.checked){
                    studentIds = studentIds + $(this).val() + ",";
                }
            });
            if(studentIds==""){
                alert("请选择要删除的学生");
            }else{
                if(confirm("确定要删除这些学生吗?")){
                    $.post("${pageContext.request.contextPath}/student/deleteStudentListByIds",{"ids":studentIds},function (data) {
                        alert(data.msg);
                        location.href = location.href;
                    })
                }
            }
        });
    });
</script>
</html>
