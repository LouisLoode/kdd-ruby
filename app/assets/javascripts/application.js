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

				// Not cool but didn't find other tricks.. T_T
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
        header: '<h3 class="parent-name">Utilisateurs</h3>'
      }
    });


		var i = 0;
		var j = 1;


    $(".rank").mouseenter(function(){
      console.log('in');
      var star1 = $( this ).find( ".star1" );
      var star2 = $( this ).find( ".star2" );
      var star3 = $( this ).find( ".star3" );
      var star4 = $( this ).find( ".star4" );
      var star5 = $( this ).find( ".star5" );
         star1.mouseover(function(){
              $(this).removeClass('star-empty').addClass('star-full');
              star2.removeClass('star-full').addClass('star-empty');
              star3.removeClass('star-full').addClass('star-empty');
              star4.removeClass('star-full').addClass('star-empty');
              star5.removeClass('star-full').addClass('star-empty');
         });
         star2.mouseover(function(){
              $(this).removeClass('star-empty').addClass('star-full');
              star1.removeClass('star-empty').addClass('star-full');
              star3.removeClass('star-full').addClass('star-empty');
              star4.removeClass('star-full').addClass('star-empty');
              star5.removeClass('star-full').addClass('star-empty');
         });
         star3.mouseover(function(){
              $(this).removeClass('star-empty').addClass('star-full');
              star1.removeClass('star-empty').addClass('star-full');
              star2.removeClass('star-empty').addClass('star-full');
              star4.removeClass('star-full').addClass('star-empty');
              star5.removeClass('star-full').addClass('star-empty');
         });
         star4.mouseover(function(){
              $(this).removeClass('star-empty').addClass('star-full');
              star1.removeClass('star-empty').addClass('star-full');
              star2.removeClass('star-empty').addClass('star-full');
              star3.removeClass('star-empty').addClass('star-full');
              star5.removeClass('star-full').addClass('star-empty');
         });
         star5.mouseover(function(){
              $(this).removeClass('star-empty').addClass('star-full');
              star1.removeClass('star-empty').addClass('star-full');
              star2.removeClass('star-empty').addClass('star-full');
              star3.removeClass('star-empty').addClass('star-full');
              star4.removeClass('star-empty').addClass('star-full');
         });

    });
    $(".rank").mouseleave(function(){
        var rate = $('#ratings').html();
        var rate = parseInt(rate);
        $('.star').removeClass('star-full').addClass('star-empty');
        var i = 0;
        $(".notation > a > li").each(function(n) {
            if(i<rate){
                $(this).removeClass('star-empty').addClass('star-full');
            }
            else{
              return false;
            }
            i++;
        });
    });



    $('article').mouseover(function(){
       $(this).find('.edit-post').css({opacity:"1"});
    });
    $('article').mouseout(function(){
       $(this).find('.edit-post').css({opacity:"0"});
    });

    $('.coeur_add').mouseover(function(){
         $(this).attr("src","/assets/coeur3.png");
    });
    $('.coeur_add').mouseout(function(){
         $(this).attr("src","/assets/coeur2.png");
    });


    // $('.coeur').mouseover(function(){
    //   var coeur = $(this);
    //    coeur.removeClass('coeur1').addClass('coeur2');

    //    coeur.click(function(){
    //       coeur.removeClass('coeur2').addClass('coeur3');
    //       setTimeout(function(){
    //            coeur.removeClass('coeur3').addClass('coeur4');
    //       },1200);
    //    });
    // });

    // $('.coeur').mouseleave(function(){
    //     if($(this).hasClass('coeur2')){
    //        $(this).removeClass('coeur2').addClass('coeur1');
    //     }
    // });


		// Sidebar
    var i_click = 0;

    $('.sidebar').find('.dropdown > a').click(function(){


                var element = $(this);

                $('.sidebar').find('.dropdown > a').removeClass('clicked'); 

                var allimg = $('.sidebar').find('.dropdown > a > .imgplus > img');
                var allround =  $('.sidebar').find('.dropdown > a > .imgplus');
                allround.css({borderColor:"#748DEF"});
                allimg.attr("src","/assets/plus.svg");  

      
                element.addClass('clicked');
                var img = element.find(".imgplus > img");
                var round =  element.find(".imgplus");
                round.css({borderColor:"#FFF"});
                img.attr("src","/assets/moins.svg");

                if(!element.parent().hasClass('open')){
                  element.removeClass('clicked'); 
                  var img = element.find(".imgplus > img");
                  var round =  element.find(".imgplus");
                  round.css({borderColor:"#748DEF"});
                  img.attr("src","/assets/plus.svg"); 
                }   

                e.stopPropagation();           
    });



		// Profil card
		$(document).on('scroll', function() {
			var y = $(this).scrollTop();
				// Sidebar// console.log(y);
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

}






$(document).on('ready turbolinks:load', ready);
// $(document).on('ready page:load', ready);
