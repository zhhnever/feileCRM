$(function () {
  //首先将#back-to-top隐藏
  $("#slider-goTop").hide();
  //当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失
  $(window).scroll(function () {
    if ($(window).scrollTop() > 100) {
      $("#slider-goTop").fadeIn();
    } else {
      $("#slider-goTop").fadeOut();
    }
  });
  //当点击跳转链接后，回到页面顶部位置
  $("#slider-goTop").click(function () {
    $('body,html').animate({
      scrollTop: 0
    }, 500);
    return false;
  });
  //返回顶部等滑块hover事件
  $('#slider-chat,#slider-qq,#slider-phone,#slider-wechat').hover(
    function () {
      $(this).next().show();
    },
    function () {
      $(this).next().hide();
    }
  );

  Date.prototype.format = function (format) {
    var o = {
      "M+": this.getMonth() + 1, //month
      "d+": this.getDate(), //day
      "h+": this.getHours(), //hour
      "m+": this.getMinutes(), //minute
      "s+": this.getSeconds(), //second
      "q+": Math.floor((this.getMonth() + 3) / 3), //quarter
      "S": this.getMilliseconds() //millisecond
    }
    if (/(y+)/.test(format)) format = format.replace(RegExp.$1,
      (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
      if (new RegExp("(" + k + ")").test(format))
        format = format.replace(RegExp.$1,
          RegExp.$1.length == 1 ? o[k] :
          ("00" + o[k]).substr(("" + o[k]).length));
    return format;
  }
});