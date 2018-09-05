<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    String htmlData = request.getParameter("detail") != null ? request.getParameter("detail") : "";
%>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="Bookmark" href="/icon/favicon.ico" >
    <link rel="Shortcut Icon" href="/icon/favicon.ico" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="lib/html5shiv.js"></script>
    <script type="text/javascript" src="lib/respond.min.js"></script>

    <![endif]-->
    <link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />

    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <!--/meta 作为公共模版分离出去-->

    <link href="lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="page-container">
    <%=htmlData%>
    <form name="product-add" action="" method="post" class="form form-horizontal" id="product-add">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>会员：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" hidden class="input-text" id="mId" name="mId" >
                <input type="text" onclick="chooseMember()" readonly class="input-text" value="" placeholder="选择会员" id="name" name="name" style="width:50%">
                <input type="button" onclick="chooseMember()" class="btn btn-secondary radius" value="选择会员">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>身份证：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" name="identificationNo" style="width:50%">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>课程名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" hidden class="input-text" id="cid" name="cid" >
				<input type="text" onclick="chooseClass()" readonly class="input-text" value="" placeholder="请点击选择按钮选择商品分类" id="className" name="className" style="width:50%">
                <input type="button" onclick="chooseClass()" class="btn btn-secondary radius" value="选择课程">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>金额：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" name="amount" placeholder="请输入正确金额" value="" class="input-text" style="width:50%">
                元</div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">折扣：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" name="discount" id="discount" placeholder="0~1" value="" class="input-text" style="width:50%">
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <button id="saveButton" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 保存并生成合同</button>
                <button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
            </div>
        </div>
    </form>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="lib/webuploader/0.1.5/webuploader.min.js"></script>
<link rel="stylesheet" href="lib/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="lib/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="lib/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="lib/kindeditor/lang/zh-CN.js"></script>
<script charset="utf-8" src="lib/kindeditor/plugins/code/prettify.js"></script>
<script type="text/javascript">
    var editor;

    jQuery.validator.addMethod("decimalsValue",function(value, element) {
        var decimalsValue =/^(?!0+(?:\.0+)?$)(?:[1-9]\d*|0)(?:\.\d{1,2})?$/ ;
        return this.optional(element) || (decimalsValue.test(value));
    }, "金额必须大于0并且只能精确到分");

    function setIdAndTitle(id,title) {
        $("#cid").val(id);
        $("#className").val(title);

    }
    function chooseMember(){
        layer_show("选择会员","choose-member",900,600);
    }
    function chooseClass(){
        layer_show("选择课程","choose-product",900,600);
    }

    //保存发布
    $("#product-add").validate({
        rules:{
            name:{
                required:true,
            },
            className:{
                required:true,
            },
            cid:{
                required:true,
            },
            mId:{
                required:true,
            },
            amount:{
                required:true,
                number:true
            },
            discount:{
                required:false,
                number:true,
                min:0,
                max:1
            },
            identificationNo:{
                decimalsValue:true,
                required:true,
                minlength:15,
                maxlength:18,
            },
        },
        onkeyup:false,
        focusCleanup:false,
        success:"valid",
        submitHandler:function(form){
            var index = layer.load(3);
            $(form).ajaxSubmit({
                url: "./agreement/add",
                type: "POST",
                success: function(data) {
                    layer.close(index);
                    if(data.success==true){
                        if(parent.location.pathname!='/'){
                            parent.productCount();
                            parent.refresh();
                            parent.msgSuccess("添加成功!");
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(index);
                        }else{
                            layer.confirm('添加成功!', {
                                btn: ['确认'],icon: 1
                            }, function(){
                                var index = parent.layer.getFrameIndex(window.name);
                                parent.layer.close(index);
                            });
                        }
                    }else{
                        layer.alert(data.message, {title: '错误信息',icon: 2});
                    }
                },
                error:function(XMLHttpRequest) {
                    layer.close(index);
                    layer.alert('数据处理失败! 错误码:'+XMLHttpRequest.status,{title: '错误信息',icon: 2});
                }
            });
        }
    });

    function setTidAndTname(id,name) {
        $("#mId").val(id);
        $("#name").val(name);
    }


</script>
</body>
</html>
<%!
    private String htmlspecialchars(String str) {
        str = str.replaceAll("&", "&amp;");
        str = str.replaceAll("<", "&lt;");
        str = str.replaceAll(">", "&gt;");
        str = str.replaceAll("\"", "&quot;");
        return str;
    }
%>
