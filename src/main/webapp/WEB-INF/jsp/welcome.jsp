<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="  Z">
        <link rel="Shortcut Icon" href="icon/all.png" />
        <title>MTM后台管理系统 v1.0</title>


        <!-- Bootstrap core CSS -->
        <link href="lib/flatlab/css/bootstrap.min.css" rel="stylesheet">
        <link href="lib/flatlab/css/bootstrap-reset.css" rel="stylesheet">
        <!--external css-->
        <link href="lib/flatlab/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link href="lib/flatlab/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen"
        />
        <link rel="stylesheet" href="lib/flatlab/css/owl.carousel.css" type="text/css">
        <!-- Custom styles for this template -->
        <link href="lib/flatlab/css/style.css" rel="stylesheet">
        <link href="lib/flatlab/css/style-responsive.css" rel="stylesheet" />

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
        <!--[if lt IE 9]>
    <script src="lib/flatlab/js/html5shiv.js"></script>
    <script src="lib/flatlab/js/respond.min.js"></script>
    <![endif]-->
    </head>
    <style>
        #main-content {
            margin-left: 20px;
            margin-top: -50px;
        }

        .site-footer .text-center a {
            color: #53bee6;
        }
    </style>

    <body>
        <section id="container">
            <!--main content start-->
            <section id="main-content">
                <section class="wrapper">
                    <!--state overview start-->
                    <div class="row state-overview">
                        <div class="col-lg-3 col-sm-6">
                            <section class="panel">
                                <div class="symbol terques">
                                    <i class="icon-user"></i>
                                </div>
                                <div class="value">
                                    <h1 class="count">
                                        ...
                                    </h1>
                                    <p>用户总数</p>
                                </div>
                            </section>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <section class="panel">
                                <div class="symbol red">
                                    <i class="icon-tags"></i>
                                </div>
                                <div class="value">
                                    <h1 class=" count2">
                                        ...
                                    </h1>
                                    <p>课程总数</p>
                                </div>
                            </section>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <section class="panel">
                                <div class="symbol yellow">
                                    <i class="icon-shopping-cart"></i>
                                </div>
                                <div class="value">
                                    <h1 class=" count3">
                                        ...
                                    </h1>
                                    <p>学生总数</p>
                                </div>
                            </section>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <section class="panel">
                                <div class="symbol blue">
                                    <i class="icon-bar-chart"></i>
                                </div>
                                <div class="value">
                                    <h1 class=" count4">
                                        ...
                                    </h1>
                                    <p>浏览量</p>
                                </div>
                            </section>
                        </div>
                    </div>
                    <!--state overview end-->

                    <div class="row">
                        <div class="col-lg-7">
                            <%--<!--custom chart start-->--%>

                                <section class="panel" id="cc">
                                    <div class="panel-body">
                                        <a href="#" class="task-thumb">
                                            <img src="http://www.fwpiano.com/images/yi.jpg" width="90px" alt="">
                                        </a>
                                        <div class="task-thumb-details" style="margin-top: 10px;">
                                            <h1>
                                                <a href="#">Anjelina Joli</a>
                                            </h1>
                                            <p>上一次接待: 2018-08-08 23:12</p>
                                            <h5>
                                                <a href="#">今日接待:50人</a>
                                            </h5>

                                        </div>
                                        <div class="task-option" style="margin-top: 25px;">
                                            <span class="label label-success">空闲中</span>
                                            <button class="btn btn-primary">点击接待</button>
                                        </div>
                                    </div>
                                    <div class="panel-body">
                                        <a href="#" class="task-thumb">
                                            <img src="http://www.fwpiano.com/images/yi.jpg" width="90px" alt="">
                                        </a>
                                        <div class="task-thumb-details" style="margin-top: 10px;">
                                            <h1>
                                                <a href="#">Anjelina Joli</a>
                                            </h1>
                                            <p>上一次接待: 2018-08-08 23:12</p>
                                            <h5>
                                                <a href="#">今日接待:50人</a>
                                            </h5>

                                        </div>
                                        <div class="task-option" style="margin-top: 25px;">
                                            <span class="label label-danger">接待中</span>
                                            <button class="btn btn-primary">点击完成接待</button>
                                        </div>
                                    </div>
                                </section>

                        </div>

                        <div class="col-lg-5">
                            <!--widget start-->
                            <section class="panel">
                                <header class="panel-heading tab-bg-dark-navy-blue">
                                    <ul class="nav nav-tabs nav-justified ">
                                        <li class="active">
                                            <a href="#popular" data-toggle="tab">
                                                公告
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#comments" data-toggle="tab">
                                                评论
                                            </a>
                                        </li>
                                        <li class="">
                                            <a href="#recent" data-toggle="tab">
                                                最新通知
                                            </a>
                                        </li>
                                    </ul>
                                </header>
                                <div class="panel-body">
                                    <div class="tab-content tasi-tab">
                                        <div class="tab-pane active" id="popular">
                                            <article class="media">
                                                <a class="pull-left thumb p-thumb">
                                                    <img src="lib/flatlab/img/product1.jpg">
                                                </a>
                                                <div class="media-body">

                                                </div>
                                            </article>
                                        </div>

                                    </div>
                                </div>
                            </section>
                            <!--widget end-->
                        </div>
                    </div>
                </section>
            </section>
            <!--main content end-->
            <!--footer start-->
            <!--footer end-->
        </section>

        <!-- js placed at the end of the document so the pages load faster -->
        <script src="lib/flatlab/js/jquery.js"></script>
        <script src="lib/flatlab/js/jquery-1.8.3.min.js"></script>
        <script src="lib/flatlab/js/bootstrap.min.js"></script>
        <script src="lib/flatlab/js/jquery.scrollTo.min.js"></script>
        <script src="lib/flatlab/js/jquery.nicescroll.js" type="text/javascript"></script>
        <script src="lib/flatlab/js/jquery.sparkline.js" type="text/javascript"></script>
        <script src="lib/flatlab/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script>
        <script src="lib/flatlab/js/owl.carousel.js"></script>
        <script src="lib/flatlab/js/jquery.customSelect.min.js"></script>
        <script src="lib/flatlab/js/respond.min.js"></script>

        <script class="include" type="text/javascript" src="lib/flatlab/js/jquery.dcjqaccordion.2.7.js"></script>

        <!--common script for all pages-->
        <script src="lib/flatlab/js/common-scripts.js"></script>
        >

        <script type="text/javascript" src="lib/layer/2.4/layer.js"></script>

        <!--script for this page-->
        <script src="lib/flatlab/js/sparkline-chart.js"></script>
        <script src="lib/flatlab/js/easy-pie-chart.js"></script>
        <script src="lib/flatlab/js/count.js"></script>

        <span id="busuanzi_container_site_uv">
            <span style="display: none" id="busuanzi_value_site_uv"></span>
        </span>

        <script>
            $("#username").html(parent.username);

            var now = new Date(),
                hour = now.getHours();
            if (hour < 6) {
                $("#hello").html("凌晨好！");
            } else if (hour < 9) {
                $("#hello").html("早上好！");
            } else if (hour < 12) {
                $("#hello").html("上午好！");
            } else if (hour < 14) {
                $("#hello").html("中午好！");
            } else if (hour < 17) {
                $("#hello").html("下午好！");
            } else if (hour < 19) {
                $("#hello").html("傍晚好！");
            } else if (hour < 22) {
                $("#hello").html("晚上好！");
            } else {
                $("#hello").html("深夜好！");
            }

            $(function () {
                setInterval(function () {
                    $("#currentTime").text(new Date().toLocaleString());
                }, 1000);
            });


            //owl carousel
            $(document).ready(function () {
                $("#owl-demo").owlCarousel({
                    navigation: true,
                    slideSpeed: 300,
                    paginationSpeed: 400,
                    singleItem: true,
                    autoPlay: true

                });
            });

            //custom select box
            $(function () {
                $('select.styled').customSelect();
            });

            /*统计用户数*/
            $.ajax({
                url: "./member/count",
                type: "GET",
                success: function (data) {
                    countUp(data.recordsTotal);
                },
                error: function (XMLHttpRequest) {
                    layer.alert('数据处理失败! 错误码:' + XMLHttpRequest.status + ' 错误信息:' + JSON.parse(
                        XMLHttpRequest.responseText).message, {
                        title: '错误信息',
                        icon: 2
                    });
                }
            });

            $.ajax({
                url: "./item/count",
                type: 'GET',
                success: function (result) {
                    countUp2(result.recordsTotal);
                },
                error: function (XMLHttpRequest) {
                    if (XMLHttpRequest.status != 200) {
                        layer.alert('数据处理失败! 错误码:' + XMLHttpRequest.status + ' 错误信息:' + JSON.parse(
                            XMLHttpRequest.responseText).message, {
                            title: '错误信息',
                            icon: 2
                        });
                    }
                }
            });

            $.ajax({
                url: "./order/count",
                type: 'GET',
                success: function (data) {
                    countUp3(data.result);
                },
                error: function (XMLHttpRequest) {
                    if (XMLHttpRequest.status != 200) {
                        layer.alert('数据处理失败! 错误码:' + XMLHttpRequest.status + ' 错误信息:' + JSON.parse(
                            XMLHttpRequest.responseText).message, {
                            title: '错误信息',
                            icon: 2
                        });
                    }
                }
            });



            //CC分配中心
            $.ajax({
                url: "./cc/list/default",
                type: 'GET',
                success: function (res) {
                    if (res.data && res.data.length > 0) {
                        $("#cc").html('')
                        for (var i = 0; i < res.data.length; i++) {
                            
                            var cc = res.data[i]
                            var id = cc.id
                            var ccid = cc.ccId
                            var img = cc.file ? cc.file : ""
                            var count = cc.count
                            var name = cc.ccname
                            var state = cc.state == 1 ? "空闲中" : "接待中"
                            var btn = cc.state == 0 ? "点击完成接待" : "点击接待"
                            var css  =  cc.state == 0 ? "label-danger" : "label-success"
                            var lastTime = cc.lastTime ? showDate(cc.lastTime) : "昨日"
                            var clickfn = cc.state == 1 ? "craeteCC("+ccid+")" : "updateCC("+ id +")"
                            $("#cc").append(
                                '<div class="panel-body"><a href="#" class="task-thumb"><img src="' +
                                img +
                                '"  width="90px" alt=""></a><div class="task-thumb-details" style="margin-top: 10px;"><h1><a href="#">'+name+'</a></h1><p>上一次接待: ' +
                                lastTime +
                                ' </p><h5><a href="#">今日接待:' + count +
                                '人</a></h5></div><div class="task-option" style="margin-top: 25px;"><span class="label '+css+'">' +
                                state + '</span><button class="btn btn-primary" onclick="'+clickfn+'">' + btn +
                                '</button></div> </div>')
                        }
                    }
                },
                error: function (XMLHttpRequest) {
                    if (XMLHttpRequest.status != 200) {
                        layer.alert('数据处理失败! 错误码:' + XMLHttpRequest.status + ' 错误信息:' + JSON.parse(
                            XMLHttpRequest.responseText).message, {
                            title: '错误信息',
                            icon: 2
                        });
                    }
                }
            });

            function craeteCC(ccid){
                layer.confirm('确认添加新的吗?', {
                    btn: ['确认','取消'],icon: 1
                }, function(){
                    var index = layer.load(3);
                    $.ajax({
                        url: "./cc/insert/"+ccid,
                        type: 'GET',
                        success: function (res) {
                            layer.close(index);
                            if(res.success==true){
                                layer.msg("添加成功")
                                window.parent.location.reload();
                            }else{
                                layer.alert(data.message, {title: '错误信息',icon: 2});
                            }
                        },
                        error: function (XMLHttpRequest) {
                            layer.close(index);
                            if (XMLHttpRequest.status != 200) {
                                layer.alert('数据处理失败! 错误码:' + XMLHttpRequest.status + ' 错误信息:' + JSON.parse(
                                    XMLHttpRequest.responseText).message, {
                                    title: '错误信息',
                                    icon: 2
                                });
                            }
                        }
                    });
                });
            }
            function updateCC(id){
                layer.confirm('确认完成接待吗?', {
                    btn: ['确认','取消'],icon: 1
                }, function(){
                    var index = layer.load(3);
                    $.ajax({
                        url: "./cc/stop/"+id,
                        type: 'GET',
                        data:{
                            state:0
                        },
                        success: function (res) {
                            layer.close(index);
                            if(res.success==true){
                                layer.msg("完成接待")
                                window.parent.location.reload();
                            }else{
                                layer.alert(data.message, {title: '错误信息',icon: 2});
                            }
                        },
                        error: function (XMLHttpRequest) {
                            layer.close(index);
                            if (XMLHttpRequest.status != 200) {
                                layer.alert('数据处理失败! 错误码:' + XMLHttpRequest.status + ' 错误信息:' + JSON.parse(
                                    XMLHttpRequest.responseText).message, {
                                    title: '错误信息',
                                    icon: 2
                                });
                            }
                        }
                    });
                });
            }
            function showDate(time) {
                var date = new Date(time);
                var y = date.getFullYear();
                var m = date.getMonth() + 1;
                m = m < 10 ? ('0' + m) : m;
                var d = date.getDate();
                d = d < 10 ? ('0' + d) : d;
                var h = date.getHours();
                h = h < 10 ? ('0' + h) : h;
                var minute = date.getMinutes();
                var second = date.getSeconds();
                minute = minute < 10 ? ('0' + minute) : minute;
                second = second < 10 ? ('0' + second) : second;
                return y + '-' + m + '-' + d + ' ' + h + ':' + minute + ':' + second;
            }

            if ($("#hot-title").text().length > 18) {
                $("#hot-title").text($("#hot-title").text().substring(0, 18) + "...");

            }

            $.ajax({
                url: "./sys/base",
                type: 'GET',
                success: function (data) {
                    if (data.success != true) {
                        layer.alert(data.message, {
                            title: '错误信息',
                            icon: 2
                        });
                        return;
                    }
                    if (data.result.hasAllNotice == 1) {
                        allNotice(data.result.allNotice);
                    }
                },
                error: function (XMLHttpRequest) {
                    if (XMLHttpRequest.status != 200) {
                        layer.alert('数据处理失败! 错误码:' + XMLHttpRequest.status + ' 错误信息:' + JSON.parse(
                            XMLHttpRequest.responseText).message, {
                            title: '错误信息',
                            icon: 2
                        });
                    }
                }
            });

            function allNotice(data) {
                layer.open({
                    type: 1,
                    title: '通知',
                    area: ['350px', '230px'],
                    content: '<div style="margin: 10px 20px 10px 20px;">' + data + '</div>',
                    btn: ['知道了'],
                    shade: 0 //不显示遮罩
                        ,
                    yes: function () {
                        layer.closeAll();
                    }
                });
            }
        </script>

    </body>

    </html>