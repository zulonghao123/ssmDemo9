<%--
  Created by IntelliJ IDEA.
  User: 祖龙浩
  Date: 2018/3/3
  Time: 11:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="easyuiBasic.jsp"%>
</head>
<body>
<div>
    <form id="queryScoreForm">
        班级:<input id="gradeCombobox" name="gradeName"/>
        学生:<input id="studentCombobox" name="studentName"/>
        <a id="queryScoreButton" class="easyui-linkbutton" iconCls="icon-search">查询</a>
    </form>
</div>
<table id="scoredg"></table>


</body>
<script type="application/javascript">
    $(function () {
        $("#scoredg").datagrid({
            url:'${pageContext.request.contextPath}/score/queryScoreByGradeIdAndStudentId',
            method:'GET',
            pagination:true,
            rownumbers:true,
            striped:true,
            checkOnSelect:false,
            columns:[[
                {field:'ck',checkbox:true},
                {field:'student',title:'学生姓名',width:100,formatter:function (value,row,index) {
                    return row.student.studentName;
                }},
                {field:'course',title:'课程名称',width:100,formatter:function (value,row,index) {
                    return value.courseName;
                }},
                {field:'score',title:'成绩',width:100},
                {field:'grade',title:'班级名称',width:100,formatter:function (value,row,index) {
                    return row.student.grade.gradeName;
                }},
                {field:'id',width:150,formatter:function (value,row,index) {
                    var qbt = "<button onclick='queryScoreButton("+value+")'>详情</button>";
                    var ubt = "<button onclick='updateScoreButton("+value+")'>修改</button>";
                    var dbt = "<button onclick='deleteScoreButton("+value+")'>删除</button>";
                    return qbt + ubt + dbt;

                }}


            ]]
        });


        $.get("${pageContext.request.contextPath}/grade/queryAllGrade",function (gradeData) {
            console.log(gradeData);
            var grade1 = $.parseJSON('{"id":-1,"gradeName":"--请选择--"}');
            gradeData.push(grade1);
            $("#gradeCombobox").combobox({
                valueField:'id',
                textField:'gradeName',
                editable:false,
                data:gradeData,
                onLoadSuccess:function () {
                    $(this).combobox('select',-1);
                },
                onSelect:function (grade) {
                    var id = grade.id;
                    $.get("${pageContext.request.contextPath}/student/queryStudentListByGradeId",{"id":id},function (studentData) {
                        var student1 = $.parseJSON('{"id":-1,"studentName":"--请选择--"}');
                        studentData.push(student1);
                        $("#studentCombobox").combobox({
                            valueField:'id',
                            textField:'studentName',
                            editable:false,
                            data:studentData,
                            onLoadSuccess:function () {
                                $(this).combobox('select', -1);
                            }


                        });
                    })

                }
            });
        })


        $("#queryScoreButton").click(function () {
            var gradeId = $("#gradeCombobox").val();
            var studentId = $("#studentCombobox").val();
            $("#scoredg").datagrid("load", {
                "gradeId":gradeId,
                "studentId":studentId
            });
        })
    })
    function queryScoreButton(id) {
        alert(id);
    }
    function updateScoreButton(id) {
        alert(id);
    }
    function deleteScoreButton(id) {
        alert(id);
    }
</script>
</html>
