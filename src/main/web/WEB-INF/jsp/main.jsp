<%--
  Created by IntelliJ IDEA.
  User: 祖龙浩
  Date: 2018/3/4
  Time: 18:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="easyuiBasic.jsp"%>
</head>
<body>
<div class="easyui-layout" style="width: 100%;height: 100%">
    <div region="north" style="height:25%;padding: 10px">
        <div align="center">
            <h1>学生管理系统</h1>
        </div>
        <div align="right">
            欢迎${loginUser.nickName}登录
        </div>
    </div>
    <div region="south">
        <div align="center" style="padding: 15px">
            <h4>版权XXX</h4>
        </div>
    </div>
    <div region="west" title="菜单栏" style="width: 20%">
        <li>
            <a href="#" url="${pageContext.request.contextPath}/hobby/toHobby">爱好信息</a>
        </li>
        <li>
            <a href="#" url="${pageContext.request.contextPath}/score/toScore">成绩信息</a>
        </li>
    </div>
    <div region="center">
        <div class="easyui-tabs" id="tt" style="width:100%;height:100%;">
            <div title="首页">
                欢迎光临
            </div>
        </div>
    </div>
</div>
</body>
<script type="application/javascript">
    $(function () {
        $("li>a").click(function () {
            var url = $(this).attr("url");
            var title = $(this).text();
            if($("#tt").tabs("exists",title)){
                $("#tt").tabs("select",title)
            }else{
                var content = "<iframe scrolling='auto' style='height: 100%;width: 100%;' frameborder='0' src='"+url+"'></iframe>";
                $("#tt").tabs("add", {
                    title:title,
                    content:content,
                    closable:true
                });
            }
        });
    })
</script>
</html>
