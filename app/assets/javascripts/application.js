// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks


//profile edit jquery
$(document).ready(function(){
  $("#test2").hide();
  $("#test").click(function(){
    $("#test2").show(1000);
  });
});



//flash fade-in/fade-out
$(function() {
   $('#flash').delay(500).fadeIn('normal', function() {
      $(this).delay(2500).fadeOut();
   });
});
