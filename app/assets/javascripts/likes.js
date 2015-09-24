$(document).ready(function() {
$('#restaurant').hide()
$('#like_button').click(function(e) {
    e.preventDefault();
    $('#restaurant').show();
    $('.buttons').hide();
  });

});
