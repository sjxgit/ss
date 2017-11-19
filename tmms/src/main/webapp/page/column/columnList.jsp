  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="security" uri="http://www.springsecurity.org/jsp"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>栏目管理</title>
    <%--script src="http://echarts.baidu.com/build/dist/echarts.js"></script>--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>

    <script type="text/javascript">
        Date.prototype.Format = function(fmt)
        { //author: meizz
            var o = {
                "M+" : this.getMonth()+1,                 //月份
                "d+" : this.getDate(),                    //日
                "h+" : this.getHours(),                   //小时
                "m+" : this.getMinutes(),                 //分
                "s+" : this.getSeconds(),                 //秒
                "q+" : Math.floor((this.getMonth()+3)/3), //季度
                "S"  : this.getMilliseconds()             //毫秒
            };
            if(/(y+)/.test(fmt))
                fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
            for(var k in o)
                if(new RegExp("("+ k +")").test(fmt))
                    fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
            return fmt;
        }
        function showcontent(checkNode){
            $('#column').datagrid({
                title:checkNode.text,
                iconCls:'icon-save',
                fit:true,
                nowrap: true,
                striped: true,
                url:'${pageContext.request.contextPath}/news/findNewsByColumn?cid='+checkNode.id,
                sortName: 'code',
                sortOrder: 'desc',
                idField:'code',
                pageSize:2,
                pageList: [2, 5,10],
                frozenColumns:[[
                    {field:'ck',checkbox:false},
                    {title:'标题',field:'title',width:80,sortable:true}
                ]],
                columns:[[
                    {field:'column',title:'栏目',width:200,formatter: function(value,row,index){return value.columnname;}},
                    {field:'user',title:'创建者',width:200,formatter: function(value,row,index){return value.username;}},
                    {field:'update_date',title:'更新时间',width:200,formatter: function(value,row,index){
                                  return new Date(value).Format("yyyy-MM-dd hh:mm:ss");}},
                    {field:'status',title:'状态',width:200},
                    {field:'action',title:'操作',width:200 	}
                ]],
                pagination:true, //研究：rows: 每页显示的数据量 page:第几页
                rownumbers:true,
                singleSelect:true,
                fitColumns:true,
                toolbar:[{
                    text:'标题',

                    iconCls:'icon-add'
                },{
                    text:'<input type="text"></input>',
                    text:'<a href="/page/column/articleForm.jsp">增加新闻</a>'
                }]
            });
        }
        $(function () {
            var checkNode=$("#tt").tree('getChecked');
            $("#tt").tree({
                url: '${pageContext.request.contextPath}/col/getAllColumns',
                animate: true,
                cascadeCheck: false,
                loadFilter: function (data) {
                    change(data);
                    //图标的设定
                    $.each(data, function (i, v) {
                        v.iconCls = "icon0-folder";
                    });
                    return data;
                },
                onClick:function (checkNode) {
                    showcontent(checkNode);
                }
            });
        });
        function change(data) {
            if (!data.length) {
                data.id=data.syscode;
                data.text = data.columnname;
                data.children = data.children;
                if (data.children) {
                    change(data.children);
                }
            } else {
                $.each(data, function (i, v) {
                    change(v);
            });
            }
        }
    </script>
</head>
<body style="margin: 1px">/
<div class="easyui-layout" style="width:1127px;height:600px;">
    <div region="west" split="true" title="内容发布" style="width:270px;">
        <ul id="tt"></ul>.. 8   </div>
    <div id="content" region="center" title="栏目列表" style="padding:5px;">
        <table id="column"></table>
    </div>
</div>
</body>
</html>














