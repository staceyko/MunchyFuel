// $(document).ready(function() {
//
//   // hide spinner
//   // $(".fa-spin").hide();
//
//
//   // show spinner on AJAX start
//   $(document).ajaxStart(function(){
//     $(".fa-spin").show();
//   });
//
//   // hide spinner on AJAX stop
//   $(document).ajaxStop(function(){
//     $(".fa-spin").hide();
//   });
//
// });
//
//

// }).bind("ajaxStop", function() {
// $(this).hide();
// }).bind("ajaxError", function() {
// $(this).hide();
// });

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
//
//
//
// $("#dislike_button").click(function(){
//   $(".fa-spin").show()});
  // $.ajax({
  //     success : function () {
  //     $(".fa-spin").hide()};
  // });
