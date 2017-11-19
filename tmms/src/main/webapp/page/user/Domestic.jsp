<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2017/11/07
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>

</head>
<body>

<script type="text/javascript">
    $(function () {
        var editRow = undefined;
        $('#bg').datagrid({
            title: '',
            loadMsg: "数据加载中，请稍后……",
            collapsible: true,
            singleSelect: false,
            selectOnCheck: false,
            checkOnSelect: true,
            pageSize: 5,
            pageList: [2, 5, 10, 20],
            url: '${pageContext.request.contextPath}/Details?columncode='+${id},
            sortName: 'RoleSort',
            sortOrder: 'asc',

            pagination: true,
            beforePageText: '第',//页数文本框前显示的汉字 
            afterPageText: '页    共 {total} 页',
            displayMsg: '第{from}到{pages}条，共{pages}条',
            frozenColumns: [[
                {field: 'ck', checkbox: true},
                {title: '编号', field: 'id', width: 120, align: 'center', sortable: true}
            ]],
            columns: [[
                {field: 'title', title: '标题', width: 120, align: 'center', sortable: true},
                /*{field: 'gender', title: '用户性别', width: 80, align: 'center', sortable: true},*/
                {field: 'weight', title: '权重', width: 80, align: 'center', sortable: true},
                {field: 'clicks', title: '点击次数', width: 80, align: 'center', sortable: true},
                {field: 'modifyTime', title: '创建时间', width: 80, align: 'center', sortable: true},
                {
                    field: 'opt', title: '操作', width: 100, align: 'center',
                    formatter: function (value, rec) {
                        return '<a href="#" onclick="parent.addTab(\'编辑角色[' + +rec.userCode + ']\', \'Role/Edit.aspx?RoleCode=' + rec.userName + '&RoleName=' + rec.gender + '\')"><span style="color:red" onclick="">编辑</span></a>';
                    }
                }
            ]], onLoadSuccess: function () {
                $('.datagrid-toolbar').append($('#txtSearch'));
                $('#txtSearch').show();
            },
            toolbar: [
                {
                    id: 'add',
                    text: '添加',
                    iconCls: 'icon-add',
                    handler: function () {
                        open1();
                    }
                }, {
                    id: 'cut',
                    text: '删除',
                    iconCls: 'icon-cut',
                    handler: function () {
                        var codes = getSelections();
                        //  alert('codes' + getSelections());

                        if (codes == '') {
                            $.messager.alert('提示消息', '请选择要删除的数据！', 'info');
                        } else {
                            $.messager.confirm('提示消息', '确定要删除所选数据吗？', function (r) {
                                if (r) {
                                    $.ajax({
                                        url: '${pageContext.request.contextPath}/delUser?codes=' + codes,
                                        type: 'post',
                                        dataType: 'text',
                                        success: function (returnValue) {
                                            if (returnValue) {
                                                // alert('yes');
                                                $('#bg').datagrid('reload');
                                                $('#bg').datagrid('clearSelections');
                                            }
                                        }
                                    });
                                }
                            });
                        }
                    }
                }, '-',
                {
                    id: 'btnSearch',
                    text: '搜索',
                    iconCls: 'icon-search',
                    handler: function () {
                        $('#bg').datagrid('options').url = '${pageContext.request.contextPath}/searchUserInfo?search=' + $('#txtSearch').val();
                        $('#bg').datagrid("reload");
                        $('#bg').datagrid("getPager").pagination({

                            beforePageText: '第',//页数文本框前显示的汉字 
                            afterPageText: '页    共 {pages} 页',
                            displayMsg: '第{from}到{to}条，共{total}条'
                        });
                    }
                }, '-',
                {
                    text: '修改', iconCls: 'icon-edit', handler: function () {
                    //修改时要获取选择到的行
                    var rows = $('#bg').datagrid("getSelections");
                    //如果只选择了一行则可以进行修改，否则不操作
                    if (rows.length == 1) {
                        //修改之前先关闭已经开启的编辑行，当调用endEdit该方法时会触发onAfterEdit事件
                        if (editRow != undefined) {
                            $('#bg').datagrid("endEdit", editRow);
                        }
                        //当无编辑行时
                        if (editRow == undefined) {
                            //获取到当前选择行的下标
                            var index = $('#bg').datagrid("getRowIndex", rows[0]);
                            //开启编辑
                            $('#bg').datagrid("beginEdit", index);
                            //把当前开启编辑的行赋值给全局变量editRow
                            editRow = index;
                            //当开启了当前选择行的编辑状态之后，
                            //应该取消当前列表的所有选择行，要不然双击之后无法再选择其他行进行编辑
                            $('#bg').datagrid("unselectAll");
                        }
                    }
                }
                }, '-',
                {
                    text: '保存', iconCls: 'icon-save', handler: function () {
                    //保存时结束当前编辑的行，自动触发onAfterEdit事件如果要与后台交互可将数据通过Ajax提交后台
                    $('#bg').datagrid("endEdit", editRow);
                }
                }, '-',
                {
                    text: '取消编辑', iconCls: 'icon-redo', handler: function () {
                    //取消当前编辑行把当前编辑行罢undefined回滚改变的数据,取消选择的行
                    editRow = undefined;
                    $('#bg').datagrid("rejectChanges");
                    $('#bg').datagrid("unselectAll");
                }
                }, '-'],
            onAfterEdit: function (rowIndex, rowData, changes) {
                //endEdit该方法触发此事件
                console.info(rowData);
                editRow = undefined;
            },
            onDblClickRow: function (rowIndex, rowData) {
                //双击开启编辑行
                if (editRow != undefined) {
                    $('#bg').datagrid("endEdit", editRow);
                }
                if (editRow == undefined) {
                    $('#bg').datagrid("beginEdit", rowIndex);
                    editRow = rowIndex;
                }
            }

        });

        $('#dd').dialog({
            title: '添加用户',
            collapsible: false,
            resizable: true,
            //小弹层的OK
            buttons: [{
                text: 'Ok',
                iconCls: 'icon-ok',
                handler: function () {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/addUser",
                        type: "post",
                        data: $("#form2").serialize(),
                        success: function (data) {
                            if (data == "true") {
                                alert('添加成功');
                                $('#bg').datagrid('reload');
                            } else {
                                alert('添加失败');
                            }
                            // $('#dd').dialog('close');
                        }
                    });

                }
            }, {
                text: 'Cancel',
                handler: function () {
                    $('#dd').dialog('close');
                }
            }]
        });
        $('#dd').dialog('close');
        $('#xx').dialog('close');
    });

    function getSelections() {
        var ids = [];
        var row = $('#bg').datagrid('getSelections');


        for (var i = 0; i < row.length; i++) {
            //alert(row[i].id);
            ids.push(row[i].id);
        }
        // alert('ids' + ids)
        return ids;
    }

    function open1() {
        $('#dd').dialog('open');
    }
    function close1() {
        $('#dd').dialog('close');
    }

</script>
     
<table id="bg">

</table>
</body>
</html>
