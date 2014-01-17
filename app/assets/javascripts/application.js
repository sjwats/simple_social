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
//= require turbolinks
//= require_tree .

$(function(){ $(document).foundation(); });


//$('p.welcome').toggle(function() {
//  $('p.welcome').show();
//  $('p.welcome').stop().fadeTo(500, 1);
//}, function() {
//  $('p.welcome').stop().fadeTo(2000, 1,
//      function(){$(this).hide()});
//  } );

// $('p.welcome').toggle(function() {
//   $('p.welcome').fadeTo(2000, 1,
//       function(){$(this).hide()});
//   } );
//The .hide portion above makes the elements disappear entirely
//which shifts the whole page upwards to fill
//the empty space. Solution is taking that part out below.

$('p.notice').fadeTo(2000, 0);

$('p.alert').fadeTo(2000, 0);
