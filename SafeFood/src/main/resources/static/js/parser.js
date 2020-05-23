$.ajax({
  url: "./src/foodInfo.json",
}).done(function(data) {
	data = data.foods.food;
	$foodlist = $("#foodlist");
	$.each(data, function() {
		append_list(this);
	}); 
});

var append_list = function (food) {
	$foodlist.append(
			'<div class="col-md-6">'
			+ '<div class="card flex-md-row mb-4 box-shadow h-md-250">'
			+ '<img class="card-img-left flex-auto d-none d-lg-block" alt="' + food.name 
			+ '" style="width: 250px; height: 250px; padding:2px" src="'+ food.image + '">'
			+ '<div class="card-body d-flex flex-column align-items-start">'
			+ '<h3 class="mb-0">'
			+ '<a class="text-dark" href="#">'+ food.name + '</a>'
			+ '</h3>'
			+ '<div class="mb-1 text-muted">Nov 12</div>'
			+ '<p class="card-text mb-auto">' + food.material + '</p>'
			+ '<p style="padding-top: 5px;">'
			+ '<button class="btn btn-primary">추가</button>'
			+ '<button class="btn btn-primary">찜</button>'
			+ '</p>'
			+ '</div>'
			+ '</div>'
			+ '</div>'
		);
} 

$("#main_food_search_btn").on("click", function () {
	let term = $("#main_food_search").find("#query").val();
	
})