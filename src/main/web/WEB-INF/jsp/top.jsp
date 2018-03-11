
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row">
    <div class="col-md-6 col-md-offset-4">
        <h1>学生信息管理系统</h1>
    </div>
    <div class="col-md-2 col-md-offset-10">
        <h5>欢迎 ${loginUser.nickName}</h5>
        <a href="${pageContext.request.contextPath}/user/logout">退出系统</a>
    </div>
</div>