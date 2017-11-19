<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="security" uri="http://www.springsecurity.org/jsp"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>添加新闻</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/layer/theme/default/layer.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/apply.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/color.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
     <%--Layer弹层--%>

	<script type="text/javascript" src="${pageContext.request.contextPath}/static/layer/layer.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/utf8-jsp/ueditor.config.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/utf8-jsp/ueditor.all.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/utf8-jsp/lang/zh-cn/zh-cn.js"></script>


	<script type="text/javascript">
		$(function () {
            var ue = UE.getEditor('editor');//初始化对象
            $.ajax({
                url:"${pageContext.request.contextPath}/news/findNewsById",
                type:"POST",
				data:{"nid":"${nid}"},
                success:function (data) {
                    ue.ready(function(){
                        ue.setContent(data.content);
                    })
                }
            });
        });

	</script>
</head>
 <div id="container" style="margin-top: 10px;">
	 <div class="server">
	 <h3 class="apply_title">基本信息</h3>
		 <form method="post" id="form1" action="${pageContext.request.contextPath}/news/addNews">
	 <table class="table" width="100%">

		 <tr>
			 <td class="first">所属栏目：</td>
			 <td>
				 <input class="easyui-textbox"  id="column" name="columntype" placeHolder="点我查询" readonly="readonly"/></td>
			 <td class="first">外部连接：</td>
			 <td class="input"><input class="easyui-textbox" name="outerlink" value=" " /></td>
		 </tr>

		 <tr>
			 <td class="first">文章标题<span class="xing">*</span>：</td>
			 <td class="input" colspan="3"><input class="easyui-textbox" type="text" name="title" value=" " /></td>
		 </tr>

		 <tr>
			 <td class="first">标题颜色<span class="xing">*</span>：</td>
			 <td class="input">
				 <select class="easyui-combobox" name="titlecolor">
					 <option value="color" >请选择</option>
					 <option  class="apply_civil" value="red">红色</option>
					 <option  class="apply_abroad" value="blue">蓝色</option>
				 </select>
			 </td>
			 <td class="first">权重/排序<span class="xing">*</span>：</td>
			 <td class="input"><input class="easyui-textbox" name="weight" value=" " /></td>

		 </tr>
		 <tr>
			 <td class="first">文章图片<span class="xing">*</span>：</td>
			 <td class="input"><input class="easyui-textbox" name="image_url" value=" " /></td>
			 <td class="first">关键词<span class="xing">*</span>：</td>
			 <td  class="input"><input class="easyui-textbox" type="text" name="primaryword" value=" " /></td>

		 </tr>
		 <tr>
			 <td colspan="4" class="head">摘要</td>
		 </tr>
		 <tr>
			 <td  class="easyui-textbox"style="height:60px;" colspan="4">
				 <textarea name="summary" rows="4" cols="100" style="resize:none;"></textarea>
			 </td>
		 </tr>
		 <tr>
			 <td colspan="4" class="head">正文</td>
		 </tr>
		 <tr>
			 <td class="easyui-textbox" style="height:60px;" colspan="4">
				 <textarea id="editor" name="content"  style="resize:none;width:900px;"></textarea>
				 <script type="text/javascript">
					 UE.getEditor('editor');
				 </script>
			 </td>
		 </tr>
		 <tr>
			 <td colspan="4" style="height:40px;">
				 <a href="javascript:$('#form1').submit();" class="easyui-linkbutton">暂存草稿</a>
				 <a href="javascript:;" class="easyui-linkbutton">发布</a>
				 <a href="javascript:;" class="easyui-linkbutton">关闭</a>
			 </td>
		 </tr>
	 </table>
		 </form>
 </div>
 </div>
</body>
</html>