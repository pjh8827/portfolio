
	
	/*
	function getContextPath() {
		var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	}
*/

var searchList = function (condition, term) {
	console.log("검색");
	term = term.trim();
	$.ajax({
	  url: "/rest/Food/Search",
	  type:"POST",
	  dataType:"json",
	  data:JSON.stringify({"condition": condition, "key": term}),
	  contentType:'application/json; charset=utf-8',
	  beforeSend: function () {
		  $('#search_spinner').removeClass("hidden");
	  }
	}).done(function(data) {
		data = data.data;
		console.log("data",data);
		//$foodlist = $("#foodlist");
		//$foodlist.empty();
		term.trim();

		foodlistApp.foodlist=data.items;

		foodlistApp.foodlist.forEach(p => {
			p["url"] = "/detail.do?code=" + p.code;
		});

		foodlistApp.pagination=data.pagination;
		foodlistApp.setidxlist();
		
	});
}


var searchwordRecommend = function (condition, term) {
	
	if (term=="") {
		return;
	}
	term = term.trim();
	$.ajax({
	  url: "/rest/Food/Search",
	  type:"POST",
	  dataType:"json",
	  data:JSON.stringify({"condition": condition, "key": term}),
	  contentType:'application/json; charset=utf-8',
	  beforeSend: function () {
		  $('#search_spinner').removeClass("hidden");
	  }
	}).done(function(data) {
		data = data.data.items;
		
		
		let $searchrecommandlist = $("#searchrecommandlist");
		$searchrecommandlist.empty();
		term.trim();
		
		setTimeout(function(){

			if(data.length>10){
				data.splice(10);
			}

			$.each(data, function() {
				
				if(   this.name.length >12){
				
					this.name=this.name.substring( 0,12 );
					this.name = this.name+"....";
				}
				
				$searchrecommandlist.append('<a class="dropdown-item" href="/detail.do?&code='
						+this.code+'">'+
						this.name+ '</a>');
				
			});
			$('#search_spinner').addClass("hidden");
		  }, 10);
		if (data.length>0) {
			$searchrecommandlist.show();
		}
		else{
			$searchrecommandlist.hide();
		}
		
		
	});
}




/*
var appendList = function ($appendTo, food) {

	var x='<div class="col-md-6">'
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
	+ '</div>';
	console.log(x);

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
*/
$("#main_food_search_btn").on("click", function () {
	let condition = $("#main_food_search").find("select").val();
	let term = $("#main_food_search").find("#query").val();
	
	searchList(condition, term);
	let $searchrecommandlist = $("#searchrecommandlist");
	$searchrecommandlist.hide();

});



$("#query").on("keyup", function (e) {
	if (e.keyCode == 13) {
		$("#main_food_search_btn").trigger("click");
	}
	else{
		let condition = $("#main_food_search").find("select").val();
		let term = $("#main_food_search").find("#query").val();
		console.log($("#query").val());
		
		searchwordRecommend(condition, term);
		
		
	}
});

