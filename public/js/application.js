function get_update() {
  $.get('/twitter_block', function(html) {
    $("#content").prepend(html);
  });
}
//$(document).ready(function() {
  //console.log('hi');
//}

//$(document).ready(function() {
 setInterval("get_update()", 15000);
  
//}