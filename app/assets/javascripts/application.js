//= require jquery
//= require jquery_ujs

$(function () {
	$('.nav-link').hover(function () {
		var links = ($(this).text());
		var text = "";

		switch(links) {
			case "Moods":
				text = "A list of your current moods.";
				break;

			case "New Mood":
				text = "Click here to add a new mood.";
				break;

			case "Quotes":
				text = "A list of your current quotes.";
				break;

			case "New Quote":
				text = "Click here to add a new quote.";
				break;

			default:
				break;
		}

		$('<p class="nav-hover"></p>').text(text)
		.appendTo('body').hide().fadeIn('slow');
	}, 

	function() {
		$('.nav-hover').remove();
	})
	.mousemove(function (e) {
		var y = e.pageY;
		var x = e.pageX + 10;
		$('.nav-hover').css({'position':'absolute', 'top': y, 'left': x});
	});	
});