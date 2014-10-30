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
//=# require jquery.turbolinks
//= require jquery_ujs
//= require jquery.autosize
//= require_tree .
//=# require turbolinks
//= require bootstrap/modal

$(function(){
  $('.close--alert').on('click keypress', function(e) {
    var key = e.which || e.keyCode;
    if ((e.type == 'click') || (e.type == 'keypress' && key == 13)) {
      $(this).closest('.alert').fadeOut();
    }
  });

  // Add counter to the profile edit page bio
  $('.profile-bio').keyup(function() {
    var bio_length = $(this).val().length,
        bio_limit = 140,
        remainder = bio_limit - bio_length;

    if (remainder < 10) {
      console.log(remainder);
      $('.profile-bio-count').addClass('notice');
    } else {
      $('.profile-bio-count').removeClass('notice');
    }

    if (remainder === 0) {
      $('.profile-bio-count').addClass('danger');
    } else {
     $('.profile-bio-count').removeClass('danger');
   }

   $('.profile-bio-count').text(remainder);
 });

});
