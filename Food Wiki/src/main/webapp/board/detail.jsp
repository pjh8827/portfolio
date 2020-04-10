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
			margin-bottom: 80px;
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
		<div class="container">

			<!-- Portfolio Section Heading -->
			<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">제품정보</h2>

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

					<div class="row justify-content-md-center">
						<div id="food_img" class="col-md-6 col-lg-4 col-xl-3"><img class="" :alt="food_detail.name"
								:src="food_detail.img"></div>
						<div id="food_spec" class="col-lg-8 col-xl-7 pv-30">
							<table class="table">
								<tbody>
									<tr>
										<td width="130">조회수</td>
										<td>{{food_detail.viewcnt}}</td>
									</tr>
									<tr>
										<td width="130">제품명</td>
										<td>{{food_detail.name}}</td>
									</tr>
									<tr>
										<td width="130">제조사</td>
										<td>{{food_detail.maker}}</td>
									</tr>
									<tr>
										<td width="130">원재료</td>
										<td>{{food_detail.material}}
										</td>
									</tr>
									<tr>
										<td width="130">알레르기 성분</td>
										<td>{{foodAllergyList}}</td>
									</tr>
								</tbody>
							</table>
							<table class="table" v-if="expectedAllergyList!=''">
								<tbody>
									<tr>
										<td width="130">알레르기 반응</td>
										<td id="al_color">해당 식품 섭취 시 회원님에게 {{expectedAllergyList}} 알레르기 반응이 일어날 수 있습니다.
											드시지
											않는 것을 권해드립니다.</td>
									</tr>
								</tbody>
							</table>

							<c:if test="${not empty id}">
								<hr>
								<div class="clearfix row grid-space-10">
									<div class="form-group"><label>섭취단위</label><input type="number" class="form-control"
											id="qnt" name="qnt" value="1" v-model="quantity">
										<label>섭취일자</label>
										<input class="datepicker form-control " id="calander" />
									</div>

								</div>



								<hr>

								<div class="btn-group"><button class="btn btn-primary btn-outline-secondary"
										id="wishbtn" v-on:click="addwishlist()"><span
											class="glyphicon glyphicon-heart"></span>&nbsp찜</button><button
										class="btn btn-primary btn-outline-secondary" v-on:click="addeatlist()"><span
											class="glyphicon glyphicon-bookmark"></span>&nbsp추가</button></div>
							</c:if>


						</div>


				</section>
				<input type="hidden" value="${member.allergylist}" id="aller_user" v-model="userAllergyList">
				<input type="hidden" id="user_id" value="${id}" v-model="userid">
				<input type="hidden" id="code" value="${food_code}" v-model="code">
				<input type="hidden" id="wishlist_user" value="" v-model="userwishlist">
				<h4 class="space-top">영양 정보</h4>
				<section id="food_detail">
					<div class="row justify-content-md-center">
						<div id="nutri_chart_area" class="col-sm-6">
							<canvas id="myChart" height="230"></canvas>
						</div>
						<div id="nutri_list_area" class="col-sm-6">
							<table class="table">
								<tbody>
									<tr>
										<td width="200">일일 제공량</td>
										<td>{{food_detail.supportpereat}}g</td>
									</tr>
									<tr>
										<td width="200">칼로리</td>
										<td>{{food_detail.calory}}Kcal

										</td>
									</tr>
									<tr>
										<td width="200">탄수화물 </td>

										<td>{{food_detail.carbo}}g
											<span style="color: red;" v-if="refval.carb*0.25 <= food_detail.carbo">
												<br>경고 :탄수화물 하루 기준치 25%이상
											</span>
										</td>
									</tr>
									<tr>
										<td width="200">당류</td>
										<td>{{food_detail.sugar}}g
											<span style="color: red;" v-if="refval.sugar*0.25 <= food_detail.sugar">
												<br>경고 :당류 하루 기준치 25%이상
											</span>
										</td>
									</tr>
									<tr>
										<td width="200">단백질</td>
										<td>{{food_detail.protein}}g
											<span style="color: red;" v-if="refval.protein*0.25 <= food_detail.protein">
												<br>경고 :단백질 하루 기준치 25%이상
											</span>
										</td>
									</tr>
									<tr>
										<td width="200">지방</td>
										<td>{{food_detail.fat}}g
											<span style="color: red;" v-if="refval.fat*0.25 <= food_detail.fat">
												<br>경고 :지방 하루 기준치 25%이상
											</span>
										</td>
									</tr>
									<tr>
										<td width="200">포화지방</td>
										<td>{{food_detail.fattyacid}}g
											<span style="color: red;"
												v-if="refval.saturedfat*0.25 <= food_detail.fattyacid">
												<br>경고 :포화지방 하루 기준치 25%이상
											</span>
										</td>
									</tr>
									<tr>
										<td width="200">트랜스지방</td>
										<td>{{food_detail.transfat}}g
											<span style="color: red;"
												v-if="refval.transfat*0.25 <= food_detail.transfat">
												<br>경고 :트랜스지방 하루 기준치 25%이상
											</span>
										</td>
									</tr>
									<tr>
										<td width="200">나트륨</td>
										<td>{{food_detail.natrium}}mg
											<span style="color: red;" v-if="refval.natrium*0.25 <= food_detail.natrium">
												<br>경고 :나트륨 하루 기준치 25%이상
											</span></td>
									</tr>
									<tr>
										<td width="200">콜레스테롤</td>
										<td>{{food_detail.chole}}mg
											<span style="color: red;"
												v-if="refval.cholesterol*0.25 <= food_detail.chole">
												<br>경고 :콜레스테롤 하루 기준치 25%이상
											</span>
										</td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>



				</section>
			</div>

			<h4 id="recommend" class="space-top"> 비슷한 영양성분을 가진 식품들</h4>
			<div class="container">
				<div class="row mb-2" id="foodlist"></div>
			</div>

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


	<script src='https://cdn.jsdelivr.net/npm/vue/dist/vue.js'></script>
	<script src=' https://unpkg.com/vue-router@2.0.0/dist/vue-router.js'></script>
	<script src='https://unpkg.com/axios/dist/axios.min.js'></script>

	<script type="text/javascript">
		var foodDetailInfo = new Vue({

			el: "#foodDetailInfo",

			data: {

				quantity: 0,
				eatdate: "",

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

				axios.get("/rest/Food/" + this.code)
					.then(response => {



						this.food_detail = response.data.data;
						this.foodAllergyList = this.getAllergy(this.food_detail.material);
						this.expectedAllergyList = this.checkAllergy(this.userAllergyList, this.foodAllergyList);
						this.drawChart(this.food_detail);
					})
					.catch((error) => {})
					.finally(() => {});



			},
			methods: {
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
								yAxes: [{
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

				},

				addwishlist() {

					let target_id = this.userid;
					console.log("id", target_id)
					let tmp_wishlist = this.userwishlist;
					console.log(tmp_wishlist);
					if (tmp_wishlist != null) {
						tmp_wishlist = tmp_wishlist.split(',')
					} else
						tmp_wishlist = [];

					let flag = true;

					for (let i = 0; i < tmp_wishlist.length; i++) {
						const foodcode = tmp_wishlist[i];
						if (this.code == foodcode) {
							flag = false;
							break;
						}
					}

					let new_wishlist = "";

					console.log(tmp_wishlist);
					if (flag) {

						tmp_wishlist.push(this.code);
						for (let i = 0; i < tmp_wishlist.length; i++) {
							const foodcode = tmp_wishlist[i];
							new_wishlist += foodcode + ',';
						}
					} else {
						for (let i = 0; i < tmp_wishlist.length; i++) {
							const foodcode = tmp_wishlist[i];
							if (this.code != foodcode)
								new_wishlist += foodcode + ',';
						}

					}


					new_wishlist = new_wishlist.substr(0, new_wishlist.length - 1);
					axios.put('/rest/Member/wishlist', {

							"id": target_id,
							"wishlist": new_wishlist

						}).then(response => {

							if (flag) {
								document.getElementById("wishbtn").firstChild.style.color = "red";
								alert("찜 목록에 추가되었습니다");
							} else {
								document.getElementById("wishbtn").firstChild.style.color = "";
								alert("찜 목록에서 제외되었습니다");
							}
							this.userwishlist = new_wishlist;

						})
						.catch((error) => {})
						.finally(() => {});


				},


				addeatlist() {
					var target_date = document.getElementById('calander').value;
					axios.post('/rest/Eatlist', {

							"cnt": this.quantity,
							"code": this.code,
							"eatdate": target_date,
							"id": this.userid,
							"no": 0

						}).then(response => {

							alert("섭취목록에 추가되었습니다");

						})
						.catch((error) => {})
						.finally(() => {});

				}
			},
			




		});
	</script>


</body>

</html>