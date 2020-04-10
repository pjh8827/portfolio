
	function getContextPath() {
		var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	}
	function getCode() {
		
		return location.href.split("code=")[1] ;
	}

var searchList = function (condition, term) {
	$.ajax({
	  url: "/rest/Food/Recommand/"+getCode(),
	  beforeSend: function () {
		  $('#search_spinner').removeClass("hidden");
	  }
	}).done(function(data) {
		data = data.data;
		
		$foodlist = $("#foodlist");
		$foodlist.empty();
		term.trim();
		setTimeout(function(){
			$.each(data, function() {
				if (term == "") appendList($foodlist, this);
				else {
					if (condition == "name" && this.name.search(term) >= 0) {
						appendList($foodlist, this);
					} else if (condition == "maker" && this.maker.search(term) >= 0) {
						appendList($foodlist, this);
					} else if (condition == "material" && this.material.search(term) >= 0) {
						appendList($foodlist, this);
					} 
				}
			});
			$('#search_spinner').addClass("hidden");
		  }, 10);
	});
}

var appendList = function ($appendTo, food) {
	$appendTo.append(
			'<div class="col-md-6">'
			+ '<div class="card flex-md-row mb-4 box-shadow h-md-250">'
			+ '<img class="card-img-left flex-auto d-none d-lg-block" alt="' + food.name 
			+ '" src="'+ food.img + '">'
			+ '<div class="card-body d-flex flex-column align-items-start">'
			+ '<h3 class="mb-0">'
			+ '<a class="text-dark" href="detail.do?&code=' + food.code
			+ '">'+ food.name + '</a>'
			+ '</h3>'
			+ '<div class="mb-1 text-muted">Nov 12</div>'
			+ '<p class="card-text mb-auto">' + food.material + '</p>'
			+ '<p style="padding-top: 5px;">'
			+ '<div class="btn-group">'
			+ '<button class="btn btn-primary btn-outline-secondary">'
			+ '<span class="glyphicon glyphicon-heart"></span>&nbsp찜</button>'
			+ '<button class="btn btn-primary btn-outline-secondary">'
			+ '<span class="glyphicon glyphicon-bookmark"></span>&nbsp추가</button>'
			+ '</div>'
			+ '</p>'
			+ '</div>'
			+ '</div>'
			+ '</div>'
		);
} 

$("#main_food_search_btn").on("click", function () {
	let condition = $("#main_food_search").find("select").val();
	let term = $("#main_food_search").find("#query").val();
	searchList(condition, term);
});

searchList("", "");

$("#query").on("keyup", function (e) {
	if (e.keyCode == 13) {
		$("#main_food_search_btn").trigger("click");
	}
});

