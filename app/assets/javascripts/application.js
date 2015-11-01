//= require jquery
//= require jquery_ujs
//= require jquery.autosize
//= require_tree .
//= require bootstrap/modal

$(function(){
  $('.close--alert').on('click keypress', function(e) {
    var key = e.which || e.keyCode;
    if ((e.type == 'click') || (e.type == 'keypress' && key == 13)) {
      $(this).closest('.alert').fadeOut();
    }
  });

  // Add counter to the Profile description in edit page
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