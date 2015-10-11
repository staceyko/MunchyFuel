function getGeoLocation() {
  navigator.geolocation.getCurrentPosition(setGeoCookie);
}

function setGeoCookie(position) {
  var cookie_val = position.coords.latitude + "|" + position.coords.longitude;
  deleteCookie("lat_lng=");
  document.cookie = "lat_lng=" + escape(cookie_val);
}

function deleteCookie(name) {
  document.cookie = name + '=; Max-Age=0';
}

$(document).ready(function() {
  if ($('#latlng').val() === "") {
    getGeoLocation();
  }

  $('#location').click(function() {
    getGeoLocation();
    location.reload();
  });
});
