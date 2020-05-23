var getUrlParameter = function getUrlParameter(sParam) {
    let sPageURL = window.location.search.substring(1),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
        }
    }
};

function getContextPath() {

	var hostIndex = location.href.indexOf( location.host ) + location.host.length;

	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );

}
var allergys = ["대두","땅콩","우유","게","새우","참치","연어","쑥","소고기","닭고기","돼지고기","복숭아","민들레","계란흰자"];

var getAllergy = function (material) {
	
	var res = "";
	allergys.forEach( function(elem){
		if (material.includes(elem)) res += elem + ", ";
	});
	return res.slice(0,-2);

}

function temp(user_allergy, food_allergy){
	console.log(user_allergy);
	console.log(food_allergy);
	
	list_user = user_allergy.split(",");
	list_food = food_allergy.split(", ");
	console.log(list_user);
	console.log(list_food);
	
	var res1 ="";
	list_food.forEach( function(elem1){
		if(list_user.includes(elem1)) res1 += elem1 +", ";
	});
	res1 = res1.slice(0,-2);
	console.log(res1.slice(0,-2));
	if(res1!=null){
		return res1;
	}
}

var user_allergy= document.getElementById("aller_user").value;
var food_allergy="";

var searchDetail = function (code) {
	
	
	$.ajax({
		url:  "/rest/Food/"+code,
	}).done(function(data) {
		data = data.data;
		$foodInfo = $("#food_info");
		$foodDetail = $("#food_detail");
		//console.log(data );
		//console.log($foodInfo );
		//console.log($foodDetail);
		let name;
		
		
		
		$.each(data, function() {
			console.log(data);
			console.log(getAllergy(data.material));
				$foodInfo.append('<div class="row justify-content-md-center"></div>');
				
				let $row = $foodInfo.find('.row');
				$row.append('<div id="food_img" class="col-md-6 col-lg-4 col-xl-3"></div>');
				let $col1 = $row.find("#food_img");
				$col1.append('<img class="" alt="' 
						+ data.name + '" src="'+  data.img + '">');
				$row.append('<div id="food_spec" class="col-lg-8 col-xl-7 pv-30"></div>');
				
				let $col2 = $row.find("#food_spec");
				
				food_allergy = getAllergy(data.material);
				var s = temp(user_allergy, food_allergy)
				
				$col2.append('<table class="table">'
		                + '<tbody>'
		                + '<tr><td width="130">조회수</td><td>'+ data.viewcnt +'</td></tr>'
		                + '<tr><td width="130">제품명</td><td>'+ data.name +'</td></tr>'
		                + '<tr><td width="130">제조사</td><td>'+ data.maker +'</td></tr>'
		                + '<tr><td width="130">원재료</td><td>'+ data.material +'</td></tr>'
		                + '<tr><td width="130">알레르기 성분</td><td>'+ food_allergy +'</td></tr>'
		                + '</tbody>' + '</table>');
				if(s!=""){
					$col2.append('<table class = "table">'
							+ '<tbody>'
							+'<tr><td width="130">알레르기 반응</td><td id="al_color">'+"회원님의 알레르기 중 "+ s +"이 반응하였습니다. 드시지 않는 것을 권해드립니다."+'</td></tr>'
							+ '</tbody>' +'</table>');
				}
				$col2.append('<form class="clearfix row grid-space-10">'
                + '<div class="form-group">'
                + '<label>Quantity</label>'
                + '<input type="text" class="form-control" id="qnt" name="qnt" value="1">'
                + '</div>'
                + '</form>');
				
				$col2.append('<div class="btn-group">'
				+ '<button class="btn btn-primary btn-outline-secondary">'
				+ '<span class="glyphicon glyphicon-heart"></span>&nbsp찜</button>'
				+ '<button class="btn btn-primary btn-outline-secondary">'
				+ '<span class="glyphicon glyphicon-bookmark"></span>&nbsp추가</button>'
				+ '</div>');
				
				name = data.name;
				
				$("#recommend").text( name+ ":" +$("#recommend").text()    );
				
				 $row = $foodDetail.find('.row');
				$row.append('<div id="nutri_list_area" class="col-sm-6"></div>');
				 $col2 = $row.find("#nutri_list_area");
				drawChart(data);
				$col2.append('<table class="table">'
                + '<tbody>'
                + '<tr><td width="200">일일 제공량</td><td>' + (data.supportpereat == "N/A"? 0: data.supportpereat) + '</td></tr>'
                + '<tr><td width="200">칼로리</td><td>'+ (data.calory == "N/A"? 0: data.calory)+'</td></tr>'
                + '<tr><td width="200">탄수화물</td><td>'+ (data.carbo == "N/A"? 0: data.carbo)+'</td></tr>'
                + '<tr><td width="200">단백질</td><td>'+ (data.protein == "N/A"? 0: data.protein)+'</td></tr>'
                + '<tr><td width="200">지방</td><td>'+ (data.fat == "N/A"? 0: data.fat)+'</td></tr>'
                + '<tr><td width="200">당류</td><td>'+ (data.sugar == "N/A"? 0: data.sugar)+'</td></tr>'
                + '<tr><td width="200">나트륨</td><td>'+ (data.natrium == "N/A"? 0: data.natrium)+'</td></tr>'
                + '<tr><td width="200">콜레스테롤</td><td>'+ (data.chole == "N/A"? 0: data.chole)+'</td></tr>'
                + '<tr><td width="200">포화 지방산</td><td>'+ (data.fattyacid == "N/A"? 0: data.fattyacid)+'</td></tr>'
                + '<tr><td width="200">트렌스지방</td><td>'+ (data.transfat == "N/A"? 0: data.transfat)+'</td></tr>'
                + '</tbody>'
                + '</table>');
				
				
				return false;
			
		}); 
	});
}
		


var drawChart = function (data) {
	
	var config = {
			type: 'doughnut',
			data: {
				datasets: [{
					data: [
						//data.calory,
						data.carbo,
						data.protein,
						data.fat,
						//data.sugar,
						//data.natrium/1000,
						//data.chole,
						//data.fattyacid,
						//data.transfat,
					],
					backgroundColor: [
						//'rgba(255, 99, 132, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)',
		                //'rgba(153, 102, 255, 0.2)',
		                //'rgba(255, 159, 64, 0.2)',
		                //'rgba(255, 102, 204, 0.2)',
		               // 'rgba(102, 0, 255, 0.2)',
		               // 'rgba(153, 51, 0, 0.2)',
					],
					borderColor: [
		                //'rgba(255, 99, 132, 1)',
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		                //'rgba(153, 102, 255, 1)',
		                //'rgba(255, 159, 64, 1)',
		               // 'rgba(255, 102, 204, 1)',
		               // 'rgba(102, 0, 255, 1)',
		               // 'rgba(153, 51, 0, 1)',
		                
		            ],
		            borderWidth: 1
				}],
				labels: [
					//"칼로리",
					"탄수화물",
					"단백질",
					"지방",
					//"당류",
					//"나트륨",
					//"콜레스테롤",
					//"포화지방산",
					//"트렌스지방"
				]
			},
			options: {
				responsive: true,
				legend: {
					position: 'top',
				},
				title: {
					display: false,
					text: '영양정보',
					fontSize: 18,
				},
				animation: {
					animateScale: true,
					animateRotate: true
				},
				scales: {
					yAxes: [
		                {
		                    id: 'y-axis-1',
		                    type: 'linear',
		                    display: true,
		                    position: 'left',
		                    ticks: {
		                    	max: 1,
		                    	min: 0,
		                    }
		                }]
				}
			}
		};
	var options = {};
	var ctx = document.getElementById('myChart').getContext('2d');
	var myDoughnutChart = new Chart(ctx, config);
	
}

var code = getUrlParameter("code");
searchDetail(code);

