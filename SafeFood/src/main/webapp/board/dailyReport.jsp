<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>SafeFood</title>

	<!-- Custom fonts for this theme -->
	<link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
		type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet"
		type="text/css">

	<!-- Theme CSS -->
	<link href="${pageContext.request.contextPath}/css/freelancer.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/custom.css" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap-datepicker3.css">

	<style>
		#portfolio {
			padding-top: 10rem;
		}

		img {
			display: block;
			max-width: 100%;
			height: auto;
		}

		.grid-space-10 {
			margin-right: -6px;
			margin-left: 11px;
		}

		.btn-outline-secondary {
			color: #fff;
			border-color: #1bb395;
		}

		.btn-group {
			margin-left: 11px;
			margin-top: 10px;
		}

		#food_info {
			margin-bottom: 20px;
		}

		.space-top {
			margin-bottom: 20px;
		}

		#foodlist>div>div:hover {
			box-shadow: 0 .125rem .25rem rgba(0, 0, 0, .075) !important;
		}

		p.card-text.mb-auto {
			overflow: hidden;
			text-overflow: ellipsis;
			display: -webkit-box;
			-webkit-line-clamp: 3;
			-webkit-box-orient: vertical;
			word-wrap: break-word;
			line-height: 1.5em;
			height: 4.5em;
		}

		header {
			padding-bottom: 0 !important;
		}

		.hidden {
			visibility: hidden;
		}

		#main_food_search {
			height: 140px;
			margin-top: 70px;
			background-color: #2c3e50;
			padding-left: 3rem;
		}

		#main_food_search section {
			float: left;
			margin-right: 12px;
		}

		#main_food_search section #query {
			width: 250px;
		}

		#main_food_search_btn,
		#search_spinner {
			display: block;
		}

		#food_info img {

			width: 350px;
			height: 350px;
			padding: 1px;
		}

		#foodlist img {
			width: 250px;
			height: 250px;
			padding: 2px;
		}

		#al_color {
			color: red;
		}

		.btn-outline-secondary {
			color: #fff;
			border-color: #1bb395;
		}

		#foodlist h3 {
			overflow: hidden;
			text-overflow: ellipsis;
			display: -webkit-box;
			-webkit-line-clamp: 1;
			-webkit-box-orient: vertical;
			word-wrap: break-word;
		}

		#portfolio {
			padding-top: 1rem;
		}
	</style>



</head>

<body id="page-top">

	<!-- Navigation -->
	<jsp:include page="/title.jsp" />
	<!-- Masthead -->
	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">

			<!-- Masthead Heading -->
			<h1 class="masthead-heading text-uppercase mb-0">WHAT WE PROVIDE</h1>

			<!-- Icon Divider -->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>

			<!-- Masthead Subheading -->
			<p class="masthead-subheading font-weight-light mb-0">건강한 삷을 위한
				먹거리 프로젝트</p>

		</div>
		<section class="form-group d-flex align-items-center justify-content-center" id="main_food_search">

		</section>
	</header>

	<!-- Main Contents -->
	<!-- Portfolio Section -->
	<section class="page-section portfolio" id="foodDetailInfo">
		<div class="container ">

			<!-- Portfolio Section Heading -->
			<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">일일 섭취 리포트</h2>

			<!-- Icon Divider -->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<div>
				<section id="food_info">
					<h2 class="space-top" style="text-align: center;">조회일자</h2>
					<div class="row justify-content-md-center">
						<input class="datepicker form-control " style="width:15%" id="calander" />
						<button class="btn btn-primary btn-outline-secondary" v-on:click="selectdate">검색</button>

					</div>
				</section>
				<input type="hidden" value="${member.allergylist}" id="aller_user" v-model="userAllergyList">
				<input type="hidden" id="user_id" value="${id}" v-model="userid">
				<input type="hidden" id="code" value="${food_code}" v-model="code">
				<input type="hidden" id="wishlist_user" value="" v-model="userwishlist">

				<section id="food_detail">
					<h2 class="space-top" style="text-align: center;">섭취목록</h2>
					<div class="row justify-content-md-center">

						<div id="nutri_list_area" class="col-sm-6">
							<table class="table">

								<thead>
									<tr>
										<th width="200">이미지</th>
										<th width="200">식품명</th>
										<th width="200">단위 </th>
										<th width="200"> </th>
								</thead>
								<tbody>
									
									<tr v-for="food in foodlist">
										
										<td><img :src="food.img"></td>
										<td style="vertical-align: middle"> <a :href="food.url">    {{food.name}}  </a></td>
										<td style="vertical-align: middle">{{food.cnt}}</td>
										<td style="vertical-align: middle"><button class="btn btn-primary btn-outline-secondary"
												v-on:click="delete_eatlist(food)" >삭제</button></td>
											
											</tr>
								
									<!--여기다가 eatlist박음-->
								</tbody>
							</table>
						</div>
					</div>



				</section>
			</div>

			<section id="food_detail2">
				<h2 class="space-top" style="text-align: center;">하루동안 섭취한 영양소 구성</h2>
				<div class="row justify-content-md-center">

					<div id="nutri_list_area" class="col-sm-6">
						<canvas id="myChart"></canvas>
					</div>
				</div>
			</section>
			<section>



				<div class="row justify-content-md-center">
					<div id="nutri_list_area" class="col-sm-6">
						<table class="table">
							<tbody>

								<tr>
									<td width="200">칼로리</td>
									<td>{{food_detail.calory | precision}}Kcal

									</td>
								</tr>
								<tr>
									<td width="200">탄수화물 </td>

									<td>{{food_detail.carb | precision}}g
										<span style="color: red;" v-if="refval.carb < food_detail.carb">
											<br>경고 :탄수화물 하루 기준치 {{food_detail.carb /refval.carb *100 | precision}}%이상
										</span>
									</td>
								</tr>
								<tr>
									<td width="200">당류</td>
									<td>{{food_detail.sugar | precision}}g
										<span style="color: red;" v-if="refval.sugar < food_detail.sugar">
											<br>경고 :당류 하루 기준치 {{food_detail.sugar /refval.sugar *100 | precision}}%이상
										</span>
									</td>
								</tr>
								<tr>
									<td width="200">단백질</td>
									<td>{{food_detail.protein | precision}}g
										<span style="color: red;" v-if="refval.protein < food_detail.protein">
											<br>경고 :단백질 하루 기준치
											{{food_detail.protein /refval.protein *100 | precision}}%이상
										</span>
									</td>
								</tr>
								<tr>
									<td width="200">지방</td>
									<td>{{food_detail.fat | precision}}g
										<span style="color: red;" v-if="refval.fat < food_detail.fat">
											<br>경고 :지방 하루 기준치 {{food_detail.fat /refval.fat *100 | precision}}%이상
										</span>
									</td>
								</tr>
								<tr>
									<td width="200">포화지방</td>
									<td>{{food_detail.saturedfat | precision}}g
										<span style="color: red;"
											v-if="refval.saturedfat < food_detail.fattyacid">
											<br>경고 :포화지방 하루 기준치
											{{food_detail.fattyacid /refval.saturedfat *100 | precision}}%이상
										</span>
									</td>
								</tr>
								<tr>
									<td width="200">트랜스지방</td>
									<td>{{food_detail.transfat | precision}}g
										<span style="color: red;" v-if="refval.transfat < food_detail.transfat">
											<br>경고 :트랜스지방 하루 기준치
											{{food_detail.transfat /refval.transfat *100 | precision}}%이상
										</span>
									</td>
								</tr>
								<tr>
									<td width="200">나트륨</td>
									<td>{{food_detail.natrium | precision}}mg
										<span style="color: red;" v-if="refval.natrium < food_detail.natrium">
											<br>경고 :나트륨 하루 기준치
											{{food_detail.natrium /refval.natrium *100 | precision}}%이상
										</span></td>
								</tr>
								<tr>
									<td width="200">콜레스테롤</td>
									<td>{{food_detail.cholesterol | precision}}mg
										<span style="color: red;" v-if="refval.cholesterol < food_detail.chole">
											<br>경고 :콜레스테롤 하루 기준치 25%이상
										</span>
									</td>
								</tr>

							</tbody>
						</table>
					</div>

				</div>



			</section>


			<section id="food_detail3">

				<h2 class="space-top" style="text-align: center;">권고사항</h2>
				<div class="row d-flex justify-content-center">

					<!--Grid column-->
					<div class="col-md-6">

						<div class="card" v-show="refval.carb < food_detail.carb">


							<ul>
								<li>탄수화물 섭취량이 하루 탄수화물 권장량을 넘어갑니다.</li>
								<li>탄수화물 섭취 과다시 제2형당뇨병,고지혈증(고중성지방혈증),지방간,내장지방형 비만 등을 유발할 수 있습니다.</li>
								<li> 당뇨병이 있는 경우 탄수화물 과다섭취는 지속적인 고혈당을 유발하여 혈관을 손상시키고 당뇨합병증을 유발하므로
									탄수화물 섭취량을 하루 권장량의 30% 이하로 제한하는 당질 제한식을 권고합니다. </li>
							</ul>

						</div>

						<div class="card" v-show="refval.sugar < food_detail.sugar">

							<ul>
								<li>당류 섭취량이 하루 당류 권장량을 넘어갑니다.</li>
								<li>당류 섭취 과다시 [제2형당뇨병, 고지혈증(고중성지방혈증),지방간, 내장지방형 비만, 통풍] 등을 유발할 수 있습니다.</li>
								<li>당류는 탄수화물의 일종이며, 섭취했을 때 바로 단맛이 느껴지게 만드는 성분입니다. 구조가 단순하여 소화/흡수속도가 빨라 혈당을 급격하게 상승시키므로
									당뇨병이 있는 경우 당류 섭취를 최대한 피하는 것을 추천합니다. </li>
							</ul>


						</div>

						<div class="card" v-show="refval.protein < food_detail.protein">


							<ul>
								<li>단백질 섭취량이 하루 단백질 권장량을 넘어갑니다.</li>
								<li>일반인의 경우 단기간 단백질을 과다 섭취해도 큰 문제는 발생하지 않습니다.</li>
								<li>다만 통풍이 있는 경우 퓨린이 함유된 단백질 식품을 피해야 합니다</li>
								<li>단백질 섭취량을 몸무게 1kg당 0.7~1g정도, 노인의 경우 1.2g이상 섭취하는 것을 권장합니다 </li>
							</ul>
						</div>




						<div class="card" v-show="refval.fat < food_detail.fat">

							<ul>
								<li>지방 섭취량이 하루 지방 권장량을 넘어갑니다.</li>
								<li>일반인의 경우 다이어트를 할 때 지방보다는 탄수화물 섭취량을 줄이는 것이 다이어트의 성공여부를 결정합니다</li>
								<li>지방은 직접적으로 LDL콜레스테롤 수치를 상승시키므로 LDL콜레스테롤이 높은 고지혈증의 경우 지방 섭취량을 줄여야 합니다. </li>
							</ul>

						</div>

						<div class="card " v-show="refval.natrium < food_detail.natrium">

							<ul>
								<li>나트륨 섭취량이 하루 나트륨 권장량을 넘어갑니다.</li>
								<li>나트륨을 과다 섭취하면 비만,고혈압, 심혈관 질환, 골다공증 등의 질환을 유발할 수 있으며
								<li>어린이의 경우 키 성장까지 방해할 수 있습니다.</li>
								<li> 과도한 나트륨 섭취는 위암 발병률을 높입니다</li>
								<li>신장질환이 있을 경우 반드시 물과 나트륨 섭취량을 조절해야 합니다.</li>
							</ul>
						</div>

					</div>
					<!--Grid column-->

				</div>







			</section>
			<section>


		</div>



	</section>


	<!-- Footer -->
	<footer class="footer text-center">
		<div class="container">
			<div class="row">

				<!-- Footer Location -->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">회사 위치</h4>
					<p class="lead mb-0">
						(SSAFY) 서울시 강남구 테헤란로 <br>멀티스퀘어
					</p>
				</div>

				<!-- Footer Social Icons -->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">전화번호</h4>
					<p class="lead mb-0">010-7185-3377</p>
				</div>

				<!-- Footer About Text -->
				<div class="col-lg-4">
					<h4 class="text-uppercase mb-4">Email</h4>
					<p class="lead mb-0">pjh5929@naver.com</p>
				</div>

			</div>
		</div>
	</footer>

	<!-- Copyright Section -->
	<section class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; Your Website 2019</small>
		</div>
	</section>

	<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
	<div class="scroll-to-top d-lg-none position-fixed ">
		<a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top"> <i
				class="fa fa-chevron-up"></i>
		</a>
	</div>

	<!-- Bootstrap core JavaScript -->
	<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Contact Form JavaScript -->
	<script src="${pageContext.request.contextPath}/js/jqBootstrapValidation.js"></script>
	<script src="${pageContext.request.contextPath}/js/contact_me.js"></script>

	<!-- Custom scripts for this template -->
	<script src="${pageContext.request.contextPath}/js/freelancer.min.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<script src="${pageContext.request.contextPath}/js/recommend.js"></script>

	<link href="https://cdn.jsdelivr.net/bootstrap.datepicker-fork/1.3.0/css/datepicker3.css" rel="stylesheet" />
	<script src="https://cdn.jsdelivr.net/bootstrap.datepicker-fork/1.3.0/js/bootstrap-datepicker.js"></script>
	<script src="https://cdn.jsdelivr.net/bootstrap.datepicker-fork/1.3.0/js/locales/bootstrap-datepicker.kr.js">
	</script>

	<!--
	<script src="${pageContext.request.contextPath}/js/detail.js"></script>
-->
	<script>
		$(document).ready(function () {
			$.fn.datepicker.defaults.language = 'kr';
		});

		$(document).ready(function () {


			//$(".datepicker").datepicker("setDate", new Date());
			$(".datepicker").datepicker({
				format: 'yyyy-mm-dd'
			});
			$(".datepicker").datepicker("setDate", new Date());
		});
	</script>
	<script>
		Date.prototype.yyyymmdd = function () {
			var yyyy = this.getFullYear().toString();
			var mm = (this.getMonth() + 1).toString();
			var dd = this.getDate().toString();

			return yyyy + '-' + (mm[1] ? mm : '0' + mm[0]) + '-' + (dd[1] ? dd : '0' + dd[0]);
		}
	</script>


	<script src='https://cdn.jsdelivr.net/npm/vue/dist/vue.js'></script>
	<script src=' https://unpkg.com/vue-router@2.0.0/dist/vue-router.js'></script>
	<script src='https://unpkg.com/axios/dist/axios.min.js'></script>

	<script type="text/javascript">
		var foodDetailInfo = new Vue({

			el: "#foodDetailInfo",

			data: {


				eatdate: new Date().yyyymmdd(),
				foodlist: [],

				nutrition_total_data: {
					calory: 0.0,
					carb: 0.0,
					sugar: 0.0,
					protein: 0.0,
					fat: 0.0,
					natrium: 0.0,
					saturedfat: 0.0,
					cholesterol: 0.0,
					transfat: 0.0,

				},
				code: document.getElementById("code").value,
				food_detail: "",
				userid: document.getElementById("user_id").value,
				foodAllergyList: "",
				userAllergyList: document.getElementById("aller_user").value,
				expectedAllergyList: "",
				userwishlist: "",
				allergys: ["원유", "대두", "땅콩", "우유", "게", "새우", "참치", "연어", "쑥", "소고기", "닭고기", "돼지고기", "복숭아", "민들레",
					"계란흰자"
				],
				refval: {
					carb: 300.0,
					sugar: 50.0,
					protein: 55.0,
					fat: 50.0,
					natrium: 2000.0,
					saturedfat: 15.0,
					cholesterol: 324.0,
					transfat: 2.2

				}

			},

			mounted() {
				http: //localhost:8080/rest/Eatlist?id=ssafy&targetdate=2019-11-27
					axios.get("/rest/Eatlist/?id=" + this.userid + "&targetdate=" + this.eatdate)
					.then(response => {
						response = response.data;

						this.foodlist = response.data.foodlist;
						var cntlist = response.data.cntlist;

						for (let i = 0; i < this.foodlist.length; i++) {

							this.foodlist[i]['cnt'] = cntlist[i];
							this.foodlist[i]['url'] = "/detail.do?code="+this.foodlist[i].code;
						}
						this.getTotalNutritionInfo();


					})
					.catch((error) => {})
					.finally(() => {});

				axios.get("/rest/Member/" + this.userid)
				.then(response => {
					response = response.data;
					this.userwishlist = response.data.wishlist;


					if (this.userwishlist.includes(this.code)) {
						document.getElementById("wishbtn").firstChild.style.color = "red";
					}

				})
				.catch((error) => {})
				.finally(() => {});





			},
			filters: {
				precision: function (value) {
					if (isNaN(value)) return 0.00;
					value = value.toFixed(2);
					return value;
				}
			},
			methods: {

				getTotalNutritionInfo() {
					let data = this.nutrition_total_data;

					this.foodlist.forEach(food => {

						if (isNaN(food.calory))
							food.calory = 0.0;
						if (isNaN(food.carbo))
							food.carbo = 0.0;
						if (isNaN(food.sugar))
							food.sugar = 0.0;
						if (isNaN(food.protein))
							food.protein = 0.0;
						if (isNaN(food.fat))
							food.fat = 0.0;
						if (isNaN(food.natrium))
							food.natrium = 0.0;
						if (isNaN(food.fattyacid))
							food.fattyacid = 0.0;
						if (isNaN(food.chole))
							food.chole = 0.0;
						if (isNaN(food.transfat))
							food.transfat = 0.0;


						let cnt = parseInt(food['cnt']);

						data.calory += food.calory * cnt;
						data.carb += food.carbo * cnt;
						data.sugar += food.sugar * cnt;
						data.protein += food.protein * cnt;
						data.fat += food.fat * cnt;
						data.natrium += food.natrium * cnt;
						data.saturedfat += food.fattyacid * cnt;
						data.cholesterol += food.chole * cnt;
						data.transfat += food.transfat * cnt;



					});



					this.nutrition_total_data = data;
					this.food_detail = data;
					this.drawChart(this.food_detail);

				},


				getAllergy(material) {

					//console.log(material);
					var res = "";
					this.allergys.forEach(function (elem) {
						if (material.includes(elem)) res += elem + ", ";
					});
					return res.slice(0, -2);

				},
				checkAllergy(user_allergy, food_allergy) {
					console.log(user_allergy);
					console.log(food_allergy);

					let list_user = this.userAllergyList.split(",");
					let list_food = this.foodAllergyList.split(", ");
					console.log(list_user);
					console.log(list_food);

					var res1 = "";
					list_food.forEach(function (elem1) {
						if (list_user.includes(elem1)) res1 += elem1 + ", ";
					});
					res1 = res1.slice(0, -2);
					console.log(res1.slice(0, -2));
					if (res1 != null) {
						return res1;
					}
				},

				drawChart(data) {

					var config = {
						type: 'doughnut',
						data: {
							datasets: [{
								data: [
									//data.calory,
									data.carb,
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

							}
						}
					};
					var options = {};
					var ctx = document.getElementById('myChart').getContext('2d');
					var myDoughnutChart = new Chart(ctx, config);

				},

				delete_eatlist(food) {
					//http://localhost:8080/rest/Eatlist?id=ssafy&code=402&targetdate=2019-11-28
					axios.delete("/rest/Eatlist/?id=" + this.userid + "&targetdate=" + this.eatdate + "&code=" + food
							.code)
						.then(response => {

							alert("삭제되었습니다");
							this.foodlist=[];
							


							this.nutrition_total_data.calory  =0.00;
							this.nutrition_total_data.carb  =0.00;
							this.nutrition_total_data.sugar  =0.00;
							this.nutrition_total_data.protein =0.00;
							this.nutrition_total_data.fat  =0.00;
							this.nutrition_total_data.natrium  =0.00;
							this.nutrition_total_data.saturedfat  =0.00;
							this.nutrition_total_data.cholesterol  =0.00;
							this.nutrition_total_data.transfat =0.00;


					this.food_detail = "";
							this.selectdate();

						})
						.catch((error) => {})
						.finally(() => {});
				},

				selectdate() {

					console.log(document.getElementById('calander').value);
					this.eatdate = document.getElementById('calander').value;

					axios.get("/rest/Eatlist/?id=" + this.userid + "&targetdate=" + this.eatdate)
						.then(response => {
							response = response.data;

							this.foodlist = response.data.foodlist;
							var cntlist = response.data.cntlist;

							for (let i = 0; i < this.foodlist.length; i++) {

								this.foodlist[i]['cnt'] = cntlist[i];
							}
							this.getTotalNutritionInfo();


						})
						.catch((error) => {})
						.finally(() => {});
				}


			},




		});
	</script>


</body>

</html>