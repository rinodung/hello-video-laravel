var below_mid = false;
var above_mid = false;

$(document).ready(function(){
	

	$('.menu-toggle').click(function(){
		$('#left-sidebar').toggle();
		$('.menu-toggle').toggleClass('right');
		if( !$('.menu-toggle').hasClass('right') ){
			$('.right-content-10').addClass('col-md-offset-2').addClass('col-md-10').removeClass('col-md-12');
			$('.right-content-8').addClass('col-md-offset-2').addClass('col-md-8').removeClass('col-md-10');
		} else {
			$('.right-content-10').removeClass('col-md-offset-2').removeClass('col-md-10').addClass('col-md-12');
			$('.right-content-8').removeClass('col-md-offset-2').removeClass('col-md-8').addClass('col-md-10');
		}
		$(window).trigger('resize');
		resize_home_content();
	});

	 featured_slider();
	 featured_loader();
	 resize_home_content();

	 if($(window).width() <= 991){

	 	if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {

		 	$('.navbar-nav.navbar-right li.login-desktop a').hover(function(){
		 		$('.navbar-nav.navbar-right li.login-desktop a').trigger('click');
		 	});
		 	$('.navbar-nav.navbar-right li.signup-desktop a').hover(function(){
		 		window.location.href = $('.navbar-nav.navbar-right li.signup-desktop a').attr('href');
		 	});

		 }

	 	remove_sidebar();

		 $('#left-sidebar .nav > li > a.dropdown-toggle').click(function(e){
		 	e.preventDefault();
		 	if($(this).hasClass('clicked_once')){
		 		window.location.href = $(this).attr('href');
		 	} else {
		 		$(this).addClass('clicked_once');
		 	}
		 });
	}


});

$(window).load(function(){
	$(window).trigger('resize');
});



$(window).resize(function(){
	resize_home_content();

	if($(window).width() < 991){
		below_mid = true;
		if(above_mid){
			remove_sidebar();
			above_mid = false;
		}
	} else if($(window).width() > 991){
		above_mid = true;
		if(below_mid){
			add_sidebar();
			below_mid = false;
		}

	}

});

function remove_sidebar(){
	$('#left-sidebar').hide();
	$('.menu-toggle').addClass('right');
	$('.right-content-10').removeClass('col-md-offset-2').removeClass('col-md-10').addClass('col-md-12');
	$('.right-content-8').removeClass('col-md-offset-2').removeClass('col-md-8').addClass('col-md-10');
}

function add_sidebar(){
	console.log('added');
	$('#left-sidebar').show();
	$('.menu-toggle').removeClass('right');
	$('.right-content-10').addClass('col-md-offset-2').addClass('col-md-10').removeClass('col-md-12');
	$('.right-content-8').addClass('col-md-offset-2').addClass('col-md-8').removeClass('col-md-10');
}

function resize_home_content(){
	$('#home-right-sidebar').css('height', $('#home-main').height());
	$('#featured').css('height', $('#featured ul li.active .featured-content').height() );
	
}

var featured_slider_timeout = 5500;

function featured_slider(){

	setTimeout(function() {
	      cur_active = $('#featured ul li.active');
	      $(cur_active).fadeOut(1000, function(){
	      		$(cur_active).removeClass('active');
	      });
	      if($(cur_active).next('li').length > 0){
	      		$(cur_active).next('li').fadeIn(1000).addClass('active');
	      	} else {
	      		$('#featured ul li:first-child').fadeIn(1000).addClass('active');
	      	}
	      featured_loader();
	      featured_slider();
	}, featured_slider_timeout);

	
}

function featured_loader(){
	$( "#featured_loader" ).animate({
	    width: 100 + "%"
	  }, featured_slider_timeout, function() {
	  	$(this).css('width', '0%');
	  });
}