<%--
  Created by IntelliJ IDEA.
  User: 祖龙浩
  Date: 2018/2/2
  Time: 22:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <script type="application/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-2.1.4.min.js"></script>
    <script type="application/javascript" src="${pageContext.request.contextPath}/statics/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-4">
            <h1>登录</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-5 col-md-offset-2">
            <form class="form-horizontal" action="${pageContext.request.contextPath}/user/login" method="post">
                <div class="form-group">
                    <label  class="col-sm-2 control-label">用户名</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="userName"  placeholder="用户名">
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" name="password"  placeholder="密码">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default" >登录</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
    <%--<form action="${pageContext.request.contextPath}/user/login">
        用户名:<input type="text" name="userName"/>
        密码:<input type="password" name="password"/>
        <input type="submit" value="登录"/>
    </form>
<div>${message}</div>--%>
</body>
</html>
