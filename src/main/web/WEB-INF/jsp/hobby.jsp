<%--
  Created by IntelliJ IDEA.
  User: 祖龙浩
  Date: 2018/3/3
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="easyuiBasic.jsp"%>
</head>
<body>
<table id="hobbydg"></table>

<div id="addHobbyWindow" class="easyui-window" closed="true"
     style="top: 15%;left: 20%;width: 500px;height: 200px;padding: 30px 80px"
     title="添加爱好">
    <form id="addHobbyForm">
        <lable>
            爱好名称：
        </lable>
        <input type="text" name="hobbyName" class="easyui-textbox">
    </form>
    <button id="saveAddHobbyButton" class="easyui-linkButton">保存</button>
</div>





<div class="easyui-window" id="queryHobbyWin" closed="true" title="查看爱好" style="top: 15%;left: 20%;width: 500px;height: 200px;padding: 30px 80px">

    <form id="queryHobbyForm">
        <div>
            <label>爱好名称:</label>
            <input type="text" name="hobbyName" class="easyui-textbox"/>
        </div>
        <div>
            <label>创建日期:</label>
            <input type="text" name="createTime" class="easyui-textbox"/>
        </div>
    </form>
</div>

<div class="easyui-window" id="updateHobbyWin" closed="true" title="修改爱好" style="top: 15%;left: 20%;width: 500px;height: 200px;padding: 30px 80px">

    <form id="updateHobbyForm">
        <div>
            <label>爱好名称:</label>
            <input type="text" name="hobbyName" class="easyui-textbox"/>
            <input type="hidden" name="id"/>
        </div>
        <div>
            <label>创建日期:</label>
            <input type="text" id="updateCreateTime" name="createTime" class="easyui-textbox" readonly/>
        </div>
    </form>
    <button class="easyui-linkButton" id="saveUpdateHobbyBtn">修改爱好</button>
</div>







</body>
<script type="application/javascript">
    $(function () {
        $("#hobbydg").datagrid({
            url:'${pageContext.request.contextPath}/hobby/queryAll',
            method:'GET',
            pagination:true,
            striped:true,
            rownumbers:true,
            toolbar:[
                {
                    text:'添加爱好',
                    iconCls:'icon-add',
                    handler:function () {
                        addHobby();
                    }
                },
                {
                    text:'批量删除',
                    iconCls:'icon-remove',
                    handler:function () {
                        var checkHobby = $("#hobbydg").datagrid("getChecked");
                        var idStr = "";
                        if(checkHobby==null||checkHobby.length<=0){
                            alert("请选择要删除的爱好");
                            return;
                        }
                        $.each(checkHobby,function (index,item) {
                            idStr = idStr + item.id + ",";
                        })
                        if(confirm("确定删除这些爱好吗")){
                            $.post("${pageContext.request.contextPath}/hobby/deleteHobbyListByIds",{"idStr":idStr},function (data) {
                                alert(data.msg);
                                $("#hobbydg").datagrid("reload");
                            });
                        }
                    }
                }
            ],
            columns:[[
                {field:'ck',checkbox:true},
                {field:'hobbyName',title:'爱好名称'},
                {field:'createTime',title:'创建时间'},
                {field:'id',title:'操作',formatter:function (value,row,index) {
                    var qbt = "<button onclick='queryHobbyButton("+value+")'>详情</button>";
                    var ubt = "<button onclick='updateHobbyButton("+value+")'>修改</button>";
                    var dbt = "<button onclick='deleteHobbyButton("+value+")'>删除</button>";
                    return qbt + ubt + dbt;
                }},
            ]]
        });
        $("#saveAddHobbyButton").click(function () {
           var hobby = $("#addHobbyForm").serialize();
           $.post("${pageContext.request.contextPath}/hobby/addHobby",hobby,function (data) {
               alert(data.msg);
               $("#addHobbyForm").form("clear");
               $("#addHobbyWindow").window("close");
               $("#hobbydg").datagrid("reload");
           });
        })

        $("#saveUpdateHobbyBtn").click(function () {
            $("#updateCreateTime").textbox("setValue", new Date());
            var hobby = $("#updateHobbyForm").serialize();
            $.post("${pageContext.request.contextPath}/hobby/updateHobby",hobby,function (data) {
                alert(data.msg);
                $("#updateHobbyWin").window("close");
                $("#hobbydg").datagrid("reload");
            });
        });



    })
    function queryHobbyButton(id) {
        $.get("${pageContext.request.contextPath}/hobby/queryHobbyById",{"id":id},function (data) {
            $("#queryHobbyForm").form("load", data);
            $("#queryHobbyWin").window("open");
        })
    }
    function updateHobbyButton(id) {
        $.get("${pageContext.request.contextPath}/hobby/queryHobbyById",{"id":id},function (data) {
            $("#updateHobbyForm").form("load", data);
            $("#updateHobbyWin").window("open");
        })
    }
    function deleteHobbyButton(id) {
        $.post("${pageContext.request.contextPath}/hobby/deleteHobbyById",{"id":id},function (data) {
            alert(data.msg);
            $("#hobbydg").datagrid("reload");
        });
    }
    function addHobby() {
        $("#addHobbyWindow").window("open");
    }
</script>
</html>
