<%--
  Created by IntelliJ IDEA.
  User: 祖龙浩
  Date: 2018/3/4
  Time: 18:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="easyuiBasic.jsp"%>
</head>
<body>
<button type="button" id="loginButton">点击</button>
<div id="loginWin" class="easyui-window" title="登录" closed="true" style="width: 500px;height: 300px;padding: 50px 120px">

    <form method="post" action="${pageContext.request.contextPath}/user/login">
        <table>
            <tr>
                <td>用户名:</td>
                <td>
                    <input type="text" class="easyui-textbox" name="userName"/>
                </td>
            </tr>
            <tr>
                <td>密码:</td>
                <td>
                    <input  class="easyui-passwordbox" name="password"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="登录" class="easyui-linkbutton" style="width: 100px;height: 50px"/>
                    <input type="reset" value="重置" class="easyui-linkbutton" style="width: 100px;height: 50px"/>
                </td>
            </tr>
        </table>
    </form>
</div>


</body>
<script type="application/javascript">
    $(function () {
        $("#loginButton").click(function () {
            $("#loginWin").window("open");
        })
    })
</script>
</html>
