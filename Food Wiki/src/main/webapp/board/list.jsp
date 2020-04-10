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

	<style>
		/*
.container>.mb-2>.col-md-6 {
	 max-width: 100% !important;
	 width: 100% !important;
	 flex: none !important;
}
*/
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
			padding-top: 20px;
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

		#foodlist img {
			width: 250px;
			height: 250px;
			padding: 2px;
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

		#searchrecommandlist {

			position: inherit;
			display: none;
			top: 0;
			left: 0;
			width: 100%;
		}


		#searchbar {}

		.noti {
			width: 100%;
			height: 50px;
			overflow: hidden;
		}

		.rolling {
			position: relative;
			width: 100%;
			height: auto;
		}

		.rolling h1 {
			width: 100%;
			height: 50px;
			line-height: 50px;
		}

		.noti2 {
			width: 100%;
			height: 30px;
			overflow: hidden;
		}

		.rolling2 {
			position: relative;
			width: 100%;
			height: auto;
		}

		.rolling2 p {
			width: 100%;
			height: 30px;
			line-height: 30px;
		}

		#tick_01 {
			margin-bottom: 0.5rem;
			font-family: "Montserrat", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
			font-weight: 700;
			line-height: 1.2;
			font-size: 2.5rem;
			color: #fff
		}

		#tick_02 {
			margin-bottom: 0.5rem;
			font-family: "Montserrat", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
			font-weight: 700;
			line-height: 1.2;
			font-size: 1.2rem;
			color: #fff
		}
	</style>
</head>

<body id="page-top">

	<!-- Navigation -->
	<jsp:include page="/title.jsp" />

	<!-- Masthead -->
	<header class="masthead bg-primary text-white text-center">
		<div class="banner">
			<div class="container d-flex align-items-center flex-column">
				<div class="noti">
					<div class="rolling" id="ticker_01">
						<!-- Masthead Heading -->
						<h1 class="masthead-heading text-uppercase mb-0"><a href="/notice.do" id="tick_01">WHAT WE
								PROVIDE</a></h1>
						<h1 class="masthead-heading text-uppercase mb-0"><a href="/list.do" id="tick_01">What kinda
								food?</a></h1>
						<h1 class="masthead-heading text-uppercase mb-0"><a href="/restMember.do" id="tick_01">Check
								allergy</a>
						</h1>
					</div>
				</div>
			</div>
			<div class="container d-flex align-items-center flex-column">
				<!-- Icon Divider -->
				<div class="divider-custom divider-light">
					<div class="divider-custom-line"></div>
					<div class="divider-custom-icon">
						<i class="fas fa-star"></i>
					</div>
					<div class="divider-custom-line"></div>
				</div>
			</div>
			<div class="container d-flex align-items-center flex-column">
				<div class="noti2">
					<div class="rolling2" id="ticker_02">
						<!-- Masthead Subheading -->
						<p class="masthead-subheading font-weight-light mb-0"><a href="/notice.do" id="tick_02">건강한 삷을
								위한 먹거리
								프로젝트</a></p>
						<p class="masthead-subheading font-weight-light mb-0"><a href="/list.do" id="tick_02">어떤 음식이든 푸드
								위키에서
								검색하세요!</a></p>
						<p class="masthead-subheading font-weight-light mb-0"><a href="/restMember.do"
								id="tick_02">회원정보에서 알레르기를
								추가해보세요!</a></p>
					</div>
				</div>
			</div>
		</div>
		<section class="form-group d-flex  justify-content-center " id="main_food_search">
			<section>
				<label for="query_cond" id="label_for_query">검색 조건</label> <select id="query_cond" name="query_cond"
					class="form-control">
					<option value="name">상품명</option>
					<option value="maker">제조사</option>
					<option value="material">재료</option>
				</select>
			</section>

			<section style="z-index: 1000; ">

				<label for="query" id="label_for_query">검색 단어</label>

				<input class="form-control" id="query" name="query" type="text" title="검색어 입력" class="maininput"
					placeholder="식품명을 입력하세요 (ex.스낵)">

				<div class="dropdown-menu" id="searchrecommandlist">

				</div>

			</section>


			<section id="foodSearchApp">
				<label for="main_food_search_btn" class="hidden" id="label_for_query">검색</label>
				<button id="main_food_search_btn" name="query_btn" type="submit" title="검색"
					class="btn btn-outline-light">검색</button>
			</section>
			<section>
				<label for="search_spinner" class="hidden" id="label_for_query">로딩중</label>
				<div id="search_spinner" class="spinner-border hidden" role="status">
					<span class="sr-only">Loading...</span>
				</div>
			</section>
		</section>
	</header>

	<!-- Portfolio Section -->
	<section class="page-section portfolio" id="foodlistApp">
		<input type="hidden" id="user_id" value="${id}" v-model="userid">
		<input type="hidden" id="wishlist_user" value="" v-model="userwishlist">
		<div class="container">

			<!-- Portfolio Section Heading -->
			<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Food
				List</h2>

			<!-- Icon Divider -->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>

			<div class="row mb-2" id="foodlist">

				<template v-for="food in foodlist">

					<div class="col-md-6">
						<div class="card flex-md-row mb-4 box-shadow h-md-250"><img
								class="card-img-left flex-auto d-none d-lg-block" alt="food.name" :src="food.img">
							<div class="card-body d-flex flex-column align-items-start">
								<h3 class="mb-0"><a class="text-dark" :href="food.url">{{food.name}}</a></h3>
								<div class="mb-1 text-muted">Nov 12</div>
								<p class="card-text mb-auto">
									{{food.material}}
								</p>
								<p style="padding-top: 5px;">


									<c:if test="${not empty id}">
										<div class="btn-group"><button class="btn btn-primary btn-outline-secondary"
												name="wishbtn" :value="food.code" v-on:click="addwishlist($event)"><span
													class="glyphicon glyphicon-heart"
													:value="food.code"></span>&nbsp찜</button><button
												class="btn btn-primary btn-outline-secondary" :value="food.code" v-on:click="addeatlist($event)"><span
													class="glyphicon glyphicon-bookmark" :value="food.code"></span>&nbsp추가</button></div>
									</c:if>


								</p>
							</div>
						</div>
					</div>

				</template>

			</div>

			<ul class="pagination">

				<li class="page-item"><a class="page-link" href="#" v-on:click.prevent="prev()">Previous</a></li>
				<template v-for="idx in idxlist">
					<li class="page-item"><a class="page-link" href="#" v-on:click.prevent="gotoPage(idx)">{{idx}}</a>
					</li>
				</template>
				<li class="page-item"><a class="page-link" href="#" v-on:click.prevent="next()">Next</a></li>
			</ul>

		</div>
	</section>

	<jsp:include page="/footer.jsp" />

	<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
	<div class="scroll-to-top d-lg-none position-fixed ">
		<a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top"> <i
				class="fa fa-chevron-up"></i>
		</a>
	</div>





	<!-- Bootstrap core JavaScript -->
	<script src="/vendor/jquery/jquery.min.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Contact Form JavaScript -->
	<script src="/js/jqBootstrapValidation.js"></script>
	<script src="/js/contact_me.js"></script>

	<!-- Custom scripts for this template -->
	<script src="/js/freelancer.min.js"></script>


	<script src="/js/search.js"></script>

	<!--vue 적용-->
	<script src='https://cdn.jsdelivr.net/npm/vue/dist/vue.js'></script>
	<script src=' https://unpkg.com/vue-router@2.0.0/dist/vue-router.js'></script>
	<script src='https://unpkg.com/axios/dist/axios.min.js'></script>
	<script>
		Date.prototype.yyyymmdd = function () {
			var yyyy = this.getFullYear().toString();
			var mm = (this.getMonth() + 1).toString();
			var dd = this.getDate().toString();

			return yyyy + '-'+ (mm[1] ? mm : '0' + mm[0]) + '-' +(dd[1] ? dd : '0' + dd[0]);
		}


		var foodlistApp = new Vue({
			el: '#foodlistApp',
			data: {
				foodlist: [],
				condition: "",
				key: "",

				pagination: "",
				idxlist: [],

				userid: document.getElementById("user_id").value,
				userwishlist: "",
			},

			mounted() {




				axios.get("/rest/Food/Page?page=1&range=1")
					.then(response => {

						response = response.data.data;

						this.foodlist = response.items;
						this.foodlist.forEach(p => {
							p["url"] = "/detail.do?code=" + p.code;
						});
						this.pagination = response.pagination;
						this.setidxlist();

					})
					.catch((error) => {})
					.finally(() => {});


				axios.get("/rest/Member/" + this.userid)
					.then(response => {
						response = response.data;
						this.userwishlist = response.data.wishlist;



						wishbtns = document.getElementsByName("wishbtn");
						console.log(wishbtns);
						wishbtns.forEach(el => {

							let item_code = el.value;

							if (this.userwishlist.includes(item_code)) {
								console.log(item_code);
								el.firstChild.style.color = "red";

							}

						});

						if (this.userwishlist.includes(code)) {
							document.getElementById("wishbtn").firstChild.style.color = "red";
						}


					})
					.catch((error) => {})
					.finally(() => {});
			},

			methods: {

				gotoPage(pagenum) {
					let page = parseInt(pagenum);
					let range = parseInt((page - 1) / (parseInt(this.pagination.rangeSize))) + 1;

					console.log(page, range);

					axios.get("/rest/Food/Page?page=" + page + "&range=" + range)
						.then(response => {

							response = response.data.data;

							this.foodlist = response.items;
							this.foodlist.forEach(p => {
								p["url"] = "/detail.do?code=" + p.code;
							});
							this.pagination = response.pagination;
							this.setidxlist();

						})
						.catch((error) => {})
						.finally(() => {});

				},

				prev() {

					let page = parseInt(this.pagination.page);
					let range = parseInt(this.pagination.range);
					page = ((range - 2) * this.pagination.rangeSize) + 1;
					range = range - 1;

					axios.get("/rest/Food/Page?page=" + page + "&range=" + range)
						.then(response => {

							response = response.data.data;

							this.foodlist = response.items;
							this.foodlist.forEach(p => {
								p["url"] = "/detail.do?code=" + p.code;
							});
							this.pagination = response.pagination;
							this.setidxlist();

						})
						.catch((error) => {})
						.finally(() => {});





				},
				next() {

					let page = parseInt(this.pagination.page);
					let range = parseInt(this.pagination.range);
					page = parseInt(range * this.pagination.rangeSize) + 1;
					range = range + 1;

					axios.get("/rest/Food/Page?page=" + page + "&range=" + range)
						.then(response => {

							response = response.data.data;

							this.foodlist = response.items;
							this.foodlist.forEach(p => {
								p["url"] = "/detail.do?code=" + p.code;
							});
							this.pagination = response.pagination;
							this.setidxlist();

						})
						.catch((error) => {})
						.finally(() => {});



					location.href = url;

				},



				setidxlist() {

					this.idxlist = [];
					let a = this.pagination.startPage;
					let b = this.pagination.endPage;
					for (let index = a; index <= b; index++) {

						this.idxlist.push(index);
						console.log("test2");

					}

				},

				addwishlist(e) {

					console.log(e);

					let target_id = this.userid;
					console.log("id", target_id);
					console.log("targetfoodcode", e.target.value);
					let code = e.target.value;
					let tmp_wishlist = this.userwishlist;
					console.log(tmp_wishlist);
					if (tmp_wishlist != null) {
						tmp_wishlist = tmp_wishlist.split(',')
					} else
						tmp_wishlist = [];

					let flag = true;

					for (let i = 0; i < tmp_wishlist.length; i++) {
						const foodcode = tmp_wishlist[i];
						if (code == foodcode) {
							flag = false;
							break;
						}
					}

					let new_wishlist = "";


					console.log(flag);
					if (flag) {

						tmp_wishlist.push(code);
						for (let i = 0; i < tmp_wishlist.length; i++) {
							const foodcode = tmp_wishlist[i];
							new_wishlist += foodcode + ',';
						}
					} else {
						for (let i = 0; i < tmp_wishlist.length; i++) {
							const foodcode = tmp_wishlist[i];
							if (code != foodcode)
								new_wishlist += foodcode + ',';
						}

					}

					new_wishlist = new_wishlist.substr(0, new_wishlist.length - 1);


					axios.put('/rest/Member/wishlist', {

							"id": target_id,
							"wishlist": new_wishlist

						}).then(response => {

							if (flag) {
								e.target.firstChild.style.color = "red";
								alert("찜 목록에 추가되었습니다");
							} else {
								e.target.firstChild.style.color = "";
								alert("찜 목록에서 제외되었습니다");
							}
							this.userwishlist = new_wishlist;


						})
						.catch((error) => {})
						.finally(() => {});


				},
				
				addeatlist(e) {
					let target_date = new Date().yyyymmdd();
					let code = e.target.value;
					
					
					axios.post('/rest/Eatlist', {

							"cnt": 1,
							"code": code,
							"eatdate": target_date,
							"id": this.userid,
							"no": 0

						}).then(response => {

							alert("오늘 섭취목록에 추가되었습니다");

						})
						.catch((error) => {})
						.finally(() => {});

				}


			},

		

		});

		function tick() {
			$('#ticker_01 h1:first').slideUp(function () {
				$(this).appendTo($('#ticker_01')).slideDown();
			});
			$('#ticker_02 p:first').slideUp(function () {
				$(this).appendTo($('#ticker_02')).slideDown();
			});
		}

		setInterval(function () {
			tick()
		}, 3000);
	</script>


</body>

</html>