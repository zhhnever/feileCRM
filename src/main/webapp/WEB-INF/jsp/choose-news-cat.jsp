<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="lib/html5shiv.js"></script>
    <script type="text/javascript" src="lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
    <link rel="stylesheet" href="lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <!--[if IE 6]>
    <script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>选择新闻类型</title>
    <style>
        .table>tbody>tr>td{
            text-align:center;
        }
    </style>
</head>
<body>
<table class="table table-border table-bordered table-bg table-hover table-sort" width="100%">
    <thead>
    <tr class="text-c">
        <th width="40">ID</th>
        <th width="150">名称</th>
        <th width="80">操作</th>
    </tr>
    </thead>
</table>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/zTree/v3/js/jquery.ztree.all-3.5.js"></script>
<script type="text/javascript">


    $(document).ready(function(){
        $('.table').DataTable({
            serverSide: true,//开启服务器模式
            "processing": true,//加载显示提示
            "ajax": {
                url:"./news/cat/list",
                type: 'GET',
                data:{
                    "cid":-1
                },
            },
            "columns": [
                { "data": "id"},
                { "data": "title",
                    render: function(data, type, row, meta) {
                        if (type === 'display') {
                            if (data.length > 20) {
                                return '<span title=' + data + '>' + data.substr(0, 50) + '...</span>';
                            } else {
                                return '<span title=' + data + '>' + data + '</span>';
                            }
                        }
                        return data;
                    }
                },
                {
                    "data": null,
                    render: function (data, type, row, meta) {
                        return "<input onclick='chooseProduct()' class='btn btn-danger-outline size-S radius' type='button' value='选择'>";
                    }
                }
            ],
            "aaSorting": [[ 0, "desc" ]],//默认第几个排序
            "bStateSave": false,//状态保存
            "aoColumnDefs": [
                {"orderable":false,"aTargets":[1]}// 制定列不参与排序
            ],
            language: {
                url: './lib/datatables/Chinese.json'
            },
            colReorder: true
        });
    });
    function chooseProduct(id){
        var table = $('.table').DataTable();
        $('.table tbody').on( 'click', 'tr', function () {
            var id = table.row( this ).data().id;
            var title = table.row( this ).data().title;
            parent.setIdAndTitle(id,title);
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
        });
    }
</script>
</body>
</html>
