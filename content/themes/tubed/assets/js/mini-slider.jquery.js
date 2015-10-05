var slider = [];
var sliderWidth = [];
var sliderUL = [];

$('document').ready(function(){
	minislider();
	$('.dot').click(function(){
		$(this).parent().children().removeClass('active');
		$(this).addClass('active');

		$(this).parent().next('ul').css('left', -1 * ($(this).parent().parent().width() * $(this).data('index')) );
	});
});

$(window).resize(function(){
	minislider();
});

function minislider(){
	$('.mini-slider').each(function(){
		me = $(this);
		miniWidth = $(this).parent().width();
		$(this).css('width', miniWidth);

		$(this).children().find('li').css('width', miniWidth);

		ul = $(this).children('ul');
		ul.css('width', miniWidth*3);
	});

}