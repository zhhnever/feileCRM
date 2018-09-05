$(function () {
  var url = location.search
  if (url.split('=') && url.split('=')[0] == "?key" && url.split('=')[1]) {
    var parm = url.split('=')[1]
    $('#' + parm).tab('show')
  } else {
    $('#home').tab('show')
  }
})