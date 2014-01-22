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
//= require foundation
//= require_tree .
//= require_self

$(function(){
  $(document).foundation();

  $('p.notice').fadeTo(5000, 0);
  $('p.alert').fadeTo(5000, 0);
  $('.save-fav').hide();

  $('.fav-activities').on('click', '.checkbox.button input', function(event) {
    // event.preventDefault();

    $checkbox = $(event.currentTarget);
    $label = $checkbox.closest('label');
    $form = $checkbox.closest('form');

    $.ajax({
      type: 'POST',
      url: $form.attr('action'),
      data: $form.serialize(),
      dataType: 'json',
      success: function() {
        $label.toggleClass('checkbox-checked');
      }
    });
  });
});
