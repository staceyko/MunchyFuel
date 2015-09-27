$(document).ready(function() {
$('#restaurant').hide();
$(".fa-spin").hide();

$('#like_button').click(function(e) {
    e.preventDefault();
    $('#restaurant').show();
    $('.buttons').hide();
  });

$("#dislike_button").click(function(){
$(".fa-spin").show().delay(5000)});

$("#nvm_button").click(function(){
$(".fa-spin").show().delay(5000)});
});
