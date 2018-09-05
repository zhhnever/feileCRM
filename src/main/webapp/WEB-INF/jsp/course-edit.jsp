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
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>课程标题：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="title"   class="input-text" value="" placeholder="" name="title">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>课程：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" hidden class="input-text" id="cid" name="cid" >
				<input type="text" onclick="chooseCategory()" readonly class="input-text" value="" placeholder="请点击选择按钮选择课程" id="cname" name="cname" style="width:50%">
                <input type="button" onclick="chooseCategory()" class="btn btn-secondary radius" value="选择课程">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>上课老师：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" hidden class="input-text" id="tid" name="tid" >
                <input type="text" onclick="chooseTeacher()" readonly class="input-text" value="" placeholder="请点击选择按钮选择老师" id="teacher" name="teacher" style="width:50%">
                <input type="button" onclick="chooseTeacher()" class="btn btn-secondary radius" value="选择老师">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>课程限制人数：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" name="stuNum" id="num" placeholder="0~99" value="" class="input-text" style="width:50%">
                人</div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>课程开始时间：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" onfocus="WdatePicker({ minDate:'%y-%M-%d %H:%m:%s',maxDate:'#F{$dp.$D(\'reserveDate\')||\'\#{%y+1}-%M-%d %H:%m:%s\'}',dateFmt:'yyyy-MM-dd HH:mm:ss'})" id="startDate" name="date" class="input-text Wdate" style="width:180px;">
        </div>
        </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>预约截止时间：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="text" onfocus="WdatePicker({ minDate:'%y-%M-%d %H:%m:%s',maxDate:'#F{$dp.$D(\'startDate\')||\'\#{%y+1}-%M-%d %H:%m:%s\'}',dateFmt:'yyyy-MM-dd HH:mm:ss'})" id="reserveDate" name="reserveTime" class="input-text Wdate" style="width:180px;">
                </div>
            </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <button id="saveButton" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 保存并发布</button>
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

    function giveCid(cid){
        $("#cid").val(cid);
    }

    function giveCName(cname){
        $("#cname").val(cname);
    }

    function chooseCategory(){
        layer_show("选择课程","choose-product",900,600);
    }
    function chooseTeacher() {
        layer_show("选择老师","choose-teacher",900,600)
    }

    //保存发布
    $("#product-add").validate({
        rules:{
            title:{
                required:true,
            },
            cid:{
                required:true,
            },
            tid:{
                required:true,
            },
            cname:{
                required:true,
            },
            stuNum:{
                digits:true,
                required:true,
                maxlength:5,
            },
            date:{
                required:true,
            },
            reserveDate:{
                required:true,
            },
        },
        onkeyup:false,
        focusCleanup:false,
        success:"valid",
        submitHandler:function(form){
            var index = layer.load(3);
            $(form).ajaxSubmit({
                url: "./course/update/"+parent.getId(),
                type: "POST",
                success: function(data) {
                    layer.close(index);
                    if(data.success==true){
                        parent.refresh();
                        parent.msgSuccess("编辑成功!");
                        var index = parent.layer.getFrameIndex(window.name);
                        parent.layer.close(index);
                    }else{
                        layer.alert('编辑失败! '+data.message, {title: '错误信息',icon: 2});
                    }
                },
                error:function(XMLHttpRequest) {
                    layer.close(index);
                    layer.alert('数据处理失败! 错误码:'+XMLHttpRequest.status+' 错误信息:'+JSON.parse(XMLHttpRequest.responseText).message,{title: '错误信息',icon: 2});
                }
            });
        }
    });


    function setIdAndTitle(id,title){
        $("#cid").val(id);
        $("#cname").val(title);
        $("#title").val(title);
    }

    function setTidAndTname(id,title){
        $("#tid").val(id);
        $("#teacher").val(title);
    }
    Date.prototype.format = function(format)
    {
        var o = {
            "M+" : this.getMonth()+1, //month
            "d+" : this.getDate(),    //day
            "h+" : this.getHours(),   //hour
            "m+" : this.getMinutes(), //minute
            "s+" : this.getSeconds(), //second
            "q+" : Math.floor((this.getMonth()+3)/3),  //quarter
            "S" : this.getMilliseconds() //millisecond
        }
        if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
            (this.getFullYear()+"").substr(4 - RegExp.$1.length));
        for(var k in o)if(new RegExp("("+ k +")").test(format))
            format = format.replace(RegExp.$1,
                RegExp.$1.length==1 ? o[k] :
                    ("00"+ o[k]).substr((""+ o[k]).length));
        return format;
    }

    var index = layer.load(3);

    $(document).ready(function(){

        $.ajax({
            type: 'GET',
            url: './course/id/'+parent.getId(),
            dataType: 'json',
            success: function(data){
                layer.close(index);
                $("#title").val(data.result.title);
                $("#cid").val(data.result.cid);
                $("#cname").val(data.result.courseClass);
                $("#num").val(data.result.stuNum);
                $("#tid").val(data.result.tid);
                $("#teacher").val(data.result.teacher);
                $("#startDate").val(new Date(data.result.date).format('yyyy-MM-dd hh:mm:ss'));
                $("#reserveDate").val(new Date(data.result.reserveTime).format('yyyy-MM-dd hh:mm:ss'));

            },
            error:function(XMLHttpRequest) {
                layer.close(index);
                layer.alert('数据处理失败! 错误码:'+XMLHttpRequest.status+' 错误信息:'+JSON.parse(XMLHttpRequest.responseText).message,{title: '错误信息',icon: 2});
            },
        });
    });


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
