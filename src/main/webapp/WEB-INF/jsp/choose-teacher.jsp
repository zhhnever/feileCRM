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
    <title>选择老师</title>
</head>
<style>
    .table>tbody>tr>td{
        text-align:center;
    }
</style>
<body>
<div style="padding:2vw">
    <table class="table table-border table-bordered table-bg table-hover table-sort" width="100%">
        <thead>
        <tr class="text-c">
            <th width="25"><input type="checkbox" name="" value=""></th>
            <th width="40">ID</th>
            <th width="150">姓名</th>
            <th width="50">性别</th>
            <th width="90">手机</th>
            <th width="150">邮箱</th>
            <th width="130">角色</th>
            <th width="100">备注</th>
            <th width="130">创建时间</th>
            <th width="130">更新时间</th>
            <th width="100">是否已启用</th>
            <th width="100">操作</th>
        </tr>
        </thead>
    </table>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="lib/common.js"></script>
<script type="text/javascript">

    function imageShow(data){
        if(data==""||data==null){
            return "http://ow2h3ee9w.bkt.clouddn.com/nopic.jpg";
        }
        var images= new Array(); //定义一数组
        images=data.split(","); //字符分割
        if(images.length>0){
            return images[0];
        }else{
            return data;
        }
    }

    /*datatables配置*/
    $(document).ready(function () {
        $('.table').DataTable({
            serverSide: true,//开启服务器模式
            "processing": true,//加载显示提示
            "ajax": {
                url:"./user/userList",
                type: 'GET'
            },
            "columns": [
                { "data": null,
                    render : function(data,type, row, meta) {
                        return "<input name=\"checkbox\" value=\""+row.id+"\" type=\"checkbox\" value=\"\">";
                    }
                },
                { "data": "id"},
                { "data": "username"},
                { "data": "sex"},
                { "data": "phone"},
                { "data": "email"},
                { "data": "roleNames"},
                { "data": "description"},
                { "data": "created",
                    render : function(data,type, row, meta) {
                        return date(data);
                    }
                },
                { "data": "updated",
                    render : function(data,type, row, meta) {
                        return date(data);
                    }
                },
                { "data": "state",
                    render : function(data,type, row, meta) {
                        if(data==0){
                            return "<span class=\"label label-defant radius td-status\">已停用</span>";
                        }else if(data==1){
                            return "<span class=\"label label-success radius td-status\">已启用</span>";
                        }else{
                            return "<span class=\"label label-warning radius td-status\">其它态</span>";
                        }
                    }
                },
                {
                    "data": null,
                    render: function (data, type, row, meta) {
                        return "<input onclick='chooseProduct()' class='btn btn-danger-outline size-S radius' type='button' value='选择该老师'>";
                    }
                }
            ],
            "aaSorting": [[ 5, "asc" ]],//默认第几个排序
            "bStateSave": false,//状态保存
            "aoColumnDefs": [
                {"orderable":false,"aTargets":[1,8]}// 制定列不参与排序
            ],
            "lengthMenu": [ 5, 10, 25, 50, 100 ],
            language: {
                url: './lib/datatables/Chinese.json'
            }
        });
    });

    function chooseProduct(id){
        var table = $('.table').DataTable();
        $('.table tbody').on( 'click', 'tr', function () {
            var id = table.row( this ).data().id;
            var username = table.row( this ).data().username;
            parent.setTidAndTname(id,username);
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
        });
    }
</script>
</body>
</html>
