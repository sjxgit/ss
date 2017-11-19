<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>内容发布</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#tt").tree({
                url: '${pageContext.request.contextPath}/columnlist',
                animate: true,
                cascadeCheck: false,
                loadFilter :
                    function(data) {
                        change(data);
                        //图标的设定
                        $.each(data,function (i,v){
                            v.iconCls="icon-folder";
                        });

                        return data;
                    }, onClick: function (node) {
                    var text = node.text;
                    //var ico = node.iconCls;
                    id= node.attributes.id
                    var url = node.attributes.url;
                    if (node.attributes && node.attributes.url) {
                        openTab(text,url);
                    }
                }
            });
        });
        function change(data){
            if(!data.length){
                data.text=data.columnname;
                if(data.children){
                    change(data.children);
                }
            }else{
                $.each(data,function (i,v){
                    change(v);
                });
            }
        }

        //新开tabs选项卡
        function openTab(text,url){
            if($("#tabs").tabs("exists",text)){
                $("#tabs").tabs("select",text);
            }else{
                var content="<iframe frameborder=0 scrolling='scroll' style='width:100%;height:100%' src='${pageContext.request.contextPath}"+url+"?id="+id+"'></iframe>";
                $("#tabs").tabs("add",{
                    title:text,
                    closable:true,
                    content:content
                });
            }
        }

    </script>
    <html>
    <head>
        <title>Title</title>
    </head>
<body>
<div class="easyui-layout" style="width:1200px;height:800px;">
    <div region="west" split="true" title="默认站点" style="width:150px;">
        <ul id="tt">
        </ul>
    </div>
    <div region="center" >
        <div class="easyui-tabs" fit="true" border="false" id="tabs">
            <div title="首页" data-options="iconCls:'icon-home'">
                <div align="center" style="padding-top: 100px;"><font color="red" size="10">欢迎进入内容管理</font></div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
