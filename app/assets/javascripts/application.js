// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap
//= require bootstrap-select
//= require jquery.turbolinks
//= require jquery_ujs
//= require typeahead
//= require turbolinks
//= require_tree .

// Init the dropdown
$('.dropdown-toggle').dropdown()

// Init the bootstrap-select
$('.selectpicker').selectpicker('refresh');

// $( "#user_avatar" ).change(() => {
//   console.log (input( $( this ).val() ) );
// });

// OK: these two are guaranteed to work.
// $(document).ready(function () { /* ... */ });
// $(function () { /* ... */ });


// SEARCH (Autocomplete)
var categories = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.whitespace,
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  remote: {
    url: '/categories/autocomplete?query=%QUERY',
    wildcard: '%QUERY'
  }
});
$('#query').typeahead(null, {
  source: categories
});
