function get_update() {
  $.get('/twitter_block', function(html) {
    $("#content").prepend(html);
  });
}
//$(document).ready(function() {
  //console.log('hi');
//}

//$(document).ready(function() {
 setInterval("get_update()", 120000);
 google.load("language", "1");
 google.setOnLoadCallback(brand);
 function brand() {
  google.language.getBranding('branding');
}
//}