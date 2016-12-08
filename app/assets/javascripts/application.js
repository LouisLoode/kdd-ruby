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
//= require jquery_ujs
//= require jquery.turbolinks
//= require bootstrap
//= require bootstrap-select
//= require turbolinks
//= require typeahead
//= require_tree .



var i = 0;
var j = 1;

$(document).on('scroll', function() {
	var y = $(this).scrollTop();
	// console.log(y);
	if (y >= 236) {
        // > 100px from top - show div
       if(j==1){
        // console.log('startHeader');
        startHeader();
        i=1;
       }
    } else if(y <= 165) {
    	// console.log('scroll < 236px');

    	if(i==1){
    		// console.log('closeHeader');
    		closeHeader();
    		j = 1;
    	}
    }
});

function startHeader(){
	    $(".headerfake").animate({top:70}, 300, function() {
		    // console.log('open');
		});
		$(".container_profil").animate({marginTop:-200}, 300, function() {
		    // console.log('add marginTop -300');
		});

		j=0;
}
function closeHeader(){
		// alert('salut');

		$(".headerfake").animate({top:-70}, 200, function() {
		    // console.log('closed');
		});
		$(".container_profil").animate({marginTop:0}, 300, function() {
		    //callback
		});

		i=0;
}

// Auto complete
var ready;
ready = function() {

		$('.selectpicker').selectpicker('refresh');
		$('.dropdown-toggle').dropdown()

    $('#query').bind('typeahead:select', function(ev, suggestion) {
      console.log(ev);
      console.log('Selection: ');
      console.log(suggestion);
    });


    var categories = new Bloodhound({
      datumTokenizer: function(cat) {
        console.log("datumTokenizer posts: ");
          console.log(cat);
          return Bloodhound.tokenizers.whitespace(cat.name);
      },
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      identify: function(obj) { return obj; },
      remote: {
            url: '/categories/autocomplete?query=%QUERY',
            wildcard: '%QUERY'
      }
    });

    var posts = new Bloodhound({
      datumTokenizer: function(post) {
          console.log(post);
          return Bloodhound.tokenizers.whitespace(post.url);
      },
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      remote: {
            url: '/posts/autocomplete?query=%QUERY',
            wildcard: '%QUERY'
      }
    });

    var users = new Bloodhound({
      datumTokenizer: function(user) {
          console.log(user);
          return Bloodhound.tokenizers.whitespace(user.name);
      },
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      remote: {
            url: '/users/autocomplete?query=%QUERY',
            wildcard: '%QUERY'
      }
    });

    $('#search > #query').typeahead({
      highlight: true
    },
    {
      name: 'category',
      // display: 'post',
      displayKey: 'name',
      source: categories,
      onselect: function(obj) { console.log(obj) },
      templates: {
        header: '<h3 class="league-name">Categories</h3>'
      }
    },
    {
      name: 'post',
      // display: 'post',
      displayKey: 'url',
      source: posts,
      onselect: function(obj) { console.log(obj) },
      templates: {
        header: '<h3 class="league-name">Posts</h3>'
      }
    },
    {
      name: 'user',
      // display: 'post',
      displayKey: 'name',
      source: users,
      onselect: function(obj) { console.log(obj) },
      templates: {
        header: '<h3 class="league-name">Users</h3>'
      }
    });
}

$(document).ready(ready);
$(document).on('page:load', ready);
