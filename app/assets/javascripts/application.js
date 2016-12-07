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
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// Init the dropdown
$('.dropdown-toggle').dropdown()

// Init the bootstrap-select
$('.selectpicker').selectpicker('refresh');

// $( "#user_avatar" ).change(() => {
//   console.log (input( $( this ).val() ) );
// });
console.log('Hi !');

var i = 0;
var j = 1;

$(document).on('scroll', function() {
	var y = $(this).scrollTop();
	console.log(y);
	if (y >= 236) {
        // > 100px from top - show div
       if(j==1){ 
        console.log('startHeader');
        startHeader();
        i=1;
       }
    } else if(y <= 165) {
    	console.log('scroll < 236px');
    	
    	if(i==1){
    		console.log('closeHeader');
    		closeHeader();
    		j = 1;
    	}
    }
});
// $(window).scroll(function() {
//     if ($(window).scrollTop() > header) {
//         // > 100px from top - show div
//         console.log('startHeader');
//         startHeader();
//         i=1;
//     }
//     else {
//     	console.log('scroll < 236px');
//     	if(i==1){
//     		console.log('closeHeader');
//     	closeHeader();
//     	}
//     }
// });

function startHeader(){
	    $(".headerfake").animate({top:70}, 300, function() {
		    // console.log('open');
		});
		$(".container_profil").animate({marginTop:-200}, 300, function() {
		    console.log('add marginTop -300');
		});

		j=0;
}
function closeHeader(){
		// alert('salut');

		$(".headerfake").animate({top:-70}, 200, function() {
		    console.log('closed');
		});
		$(".container_profil").animate({marginTop:0}, 300, function() {
		    //callback
		});

		i=0;
}

// OK: these two are guaranteed to work.
// $(document).ready(function () { /* ... */ });
// $(function () { /* ... */ });
