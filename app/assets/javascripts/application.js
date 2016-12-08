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

// $(document).on('ready turbolinks:load', function() {
// 	$('.selectpicker').selectpicker('refresh');
// });


// Auto complete
var ready;
ready = function() {

		$('.selectpicker').selectpicker('refresh');

		$('.dropdown-toggle').dropdown()

		$('#query').on('typeahead:select',function(event, item){

				// Not cool but don't find other tricks.. T_T
				if ("name" in item && "slug" in item &&  "public" in item &&  "parent_id" in item){
					// console.log('CATEGORY');
					var base_url = 'categories'
				} else if ("email" in item && "name" in item && "slug" in item && "biography" in item && "github" in item && "avatar" in item){
					// console.log('USER');
					var base_url = 'users'
				} else if ("url" in item && "message" in item && "user_id" in item && "og_title" in item){
					// console.log('POST');
					var base_url = 'posts'
				} else {
					console.log(item);
					alert('Error during the search');
				}

			  var path = base_url+'/'+item.id;
			  url = window.location.origin+'/'+path;
			  window.location = url;
			});


    var categories = new Bloodhound({
      datumTokenizer: function(cat) {
          return Bloodhound.tokenizers.whitespace(cat.name);
      },
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      remote: {
            url: '/categories/autocomplete?query=%QUERY',
            wildcard: '%QUERY'
      }
    });

    var posts = new Bloodhound({
      datumTokenizer: function(post) {
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
          return Bloodhound.tokenizers.whitespace(user.name);
      },
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      remote: {
            url: '/user/autocomplete?query=%QUERY',
            wildcard: '%QUERY'
      }
    });

    $('#search > #query').typeahead({
      highlight: true
    },
    {
      name: 'category',
      displayKey: 'name',
      source: categories,
      templates: {
        header: '<h3 class="parent-name">Categories</h3>'
      }
    },
    {
      name: 'post',
      displayKey: 'url',
      source: posts,
      templates: {
        header: '<h3 class="parent-name">Posts</h3>'
      }
    },
    {
      name: 'user',
      displayKey: 'name',
      source: users,
      templates: {
        header: '<h3 class="parent-name">Users</h3>'
      }
    });


		var i = 0;
		var j = 1;

    $(".notation").mouseenter(function(){

			var clicked = false;
			var nb = document.getElementById("#user_rank");

			$(".notation").click(function(){
				var nb = document.getElementById("#user_rank");
				clicked = true;
				console.log(clicked);
				rate($(this),nb);
			});

      var star1 = $( this ).find( ".star1" );
      var star2 = $( this ).find( ".star2" );
      var star3 = $( this ).find( ".star3" );
      var star4 = $( this ).find( ".star4" );
      var star5 = $( this ).find( ".star5" );
         star1.mouseenter(function(){
              $(this).removeClass('star-empty').addClass('star-full');
              star2.removeClass('star-full').addClass('star-empty');
              star3.removeClass('star-full').addClass('star-empty');
              star4.removeClass('star-full').addClass('star-empty');
              star5.removeClass('star-full').addClass('star-empty');
							console.log('star1');
         });
         star2.mouseenter(function(){
              $(this).removeClass('star-empty').addClass('star-full');
              star1.removeClass('star-empty').addClass('star-full');
              star3.removeClass('star-full').addClass('star-empty');
              star4.removeClass('star-full').addClass('star-empty');
              star5.removeClass('star-full').addClass('star-empty');
							console.log('star2');
         });
         star3.mouseenter(function(){
              $(this).removeClass('star-empty').addClass('star-full');
              star1.removeClass('star-empty').addClass('star-full');
              star2.removeClass('star-empty').addClass('star-full');
              star4.removeClass('star-full').addClass('star-empty');
              star5.removeClass('star-full').addClass('star-empty');
							console.log('star3');
         });
         star4.mouseenter(function(){
              $(this).removeClass('star-empty').addClass('star-full');
              $(this).removeClass('star-empty').addClass('star-full');
              star1.removeClass('star-empty').addClass('star-full');
              star2.removeClass('star-empty').addClass('star-full');
              star3.removeClass('star-empty').addClass('star-full');
              star5.removeClass('star-full').addClass('star-empty');
							console.log('star4');
         });
         star5.mouseenter(function(){
              $(this).removeClass('star-empty').addClass('star-full');
              star1.removeClass('star-empty').addClass('star-full');
              star2.removeClass('star-empty').addClass('star-full');
              star3.removeClass('star-empty').addClass('star-full');
              star4.removeClass('star-empty').addClass('star-full');
							console.log('star5');
         });

    });

    // $(".notation").mouseleave(function(){
		// 	console.log('mouseleave');
		// 		$(".notation").click(function(){
		// 			var nb = document.getElementById("#user_rank");
		// 			rate($(this),nb);
		// 		});
		// 		// var nb = document.getElementById("#user_rank");
		// 		rate($(this),0);
    // });

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


    function rate(post,nb){
			console.log('rate');
          if(nb == 0){
            $(post).find(".star1").removeClass('star-full').addClass('star-empty');
            $(post).find(".star2").removeClass('star-full').addClass('star-empty');
            $(post).find(".star3").removeClass('star-full').addClass('star-empty');
            $(post).find(".star4").removeClass('star-full').addClass('star-empty');
            $(post).find(".star5").removeClass('star-full').addClass('star-empty');
          }
          else if(nb == 1){
            $(post).find(".star1").removeClass('star-empty').addClass('star-full');
            $(post).find(".star2").removeClass('star-full').addClass('star-empty');
            $(post).find(".star3").removeClass('star-full').addClass('star-empty');
            $(post).find(".star4").removeClass('star-full').addClass('star-empty');
            $(post).find(".star5").removeClass('star-full').addClass('star-empty');
          }
          else if(nb == 2){
            $(post).find(".star1").removeClass('star-empty').addClass('star-full');
            $(post).find(".star2").removeClass('star-empty').addClass('star-full');
            $(post).find(".star3").removeClass('star-full').addClass('star-empty');
            $(post).find(".star4").removeClass('star-full').addClass('star-empty');
            $(post).find(".star5").removeClass('star-full').addClass('star-empty');
          }
          else if(nb == 3){
            $(post).find(".star1").removeClass('star-empty').addClass('star-full');
            $(post).find(".star2").removeClass('star-empty').addClass('star-full');
            $(post).find(".star3").removeClass('star-empty').addClass('star-full');
            $(post).find(".star4").removeClass('star-full').addClass('star-empty');
            $(post).find(".star5").removeClass('star-full').addClass('star-empty');
          }
          else if(nb == 4){
            $(post).find(".star1").removeClass('star-empty').addClass('star-full');
            $(post).find(".star2").removeClass('star-empty').addClass('star-full');
            $(post).find(".star3").removeClass('star-empty').addClass('star-full');
            $(post).find(".star4").removeClass('star-empty').addClass('star-full');
            $(post).find(".star5").removeClass('star-full').addClass('star-empty');
          }
          else if(nb == 5){
            $(post).find(".star1").removeClass('star-empty').addClass('star-full');
            $(post).find(".star2").removeClass('star-empty').addClass('star-full');
            $(post).find(".star3").removeClass('star-empty').addClass('star-full');
            $(post).find(".star4").removeClass('star-empty').addClass('star-full');
            $(post).find(".star5").removeClass('star-empty').addClass('star-full');
          }
    }

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

}



$(document).on('ready turbolinks:load', ready);
// $(document).on('ready page:load', ready);
