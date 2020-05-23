/*restapi*/
var searchList = function () {
	$.ajax({
		url: "/rest/Food",
	}).done(function (data) {
		data = data.data;
		$foodlist = $("#intro_foodlist");
		$foodlist.empty();
		$.each(data, function () {
			appendList($foodlist, this);
		});
	});
}

function getContextPath() {

	var hostIndex = location.href.indexOf(location.host) + location.host.length;

	return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));

}
var showDetail = function (code) {
	window.location.href = getContextPath() + "/detail.do?code=" + code;
}

var appendList = function ($appendTo, food) {
	$appendTo.append('<div class="col-md-6 col-lg-4">' +
		'<div class="portfolio-item mx-auto" onclick="showDetail(' + food.code + ')">' +
		'<div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">' +
		'<div class="portfolio-item-caption-content text-center text-white">' +
		'<i class="fas fa-plus fa-3x"></i>' +
		'</div>' +
		'</div>' +
		'<img class="img-fluid" src="' + food.img + '" alt="' + food.name + '">' +
		'</div>' +
		'</div>');
}

searchList();


var x = [];