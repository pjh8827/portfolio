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
	<link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet"
		type="text/css">

	<!-- Theme CSS -->
	<link href="/css/freelancer.min.css" rel="stylesheet">
	<link href="/css/custom.css" rel="stylesheet">
	<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
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

		#foodlist img {
			width: 250px;
			heigth: 250px;
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

		table {
			width: 60%;
		}

		td {
			padding: 0px;
			margin: 0px;
		}

		#article_title {
			width: 100%;
			margin-bottom: 5px;
			padding: 0;
		}

		button {
			margin: 2px;
		}

		.search-container {
			float: left;
		}
	</style>




</head>

<body id="page-top">

	<!-- Navigation -->
	<jsp:include page="/title.jsp" />

	<!-- Main Contents -->
	<!-- Portfolio Section -->
	<section class="page-section portfolio" id="noticelist">
		<div class="container">

			<!-- Portfolio Section Heading -->
			<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">공지사항
			</h2>

			<!-- Icon Divider -->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>

			<div class="d-flex justify-content-center">



				<table class="table table-striped text-center">
					<thead>
						<tr>
							<th style="width: 15%">작성자</th>
							<th style="width: 15%">번호</th>
							<th style="width: 70%">제목</th>
							<th style="width: 15%">조회수</th>
						</tr>
					</thead>
					<tbody>


						<template v-for="p in noticelist">

							<tr>
								<td>{{p.id}}</td>
								<td>{{p.no}}</td>
								<td><a :href="p.url">{{p.title}}</a></td>
								<td>{{p.viewcnt}}</td>
							</tr>


						</template>



					</tbody>


				</table>


			</div>

			<ul class="pagination">

				<li class="page-item"><a class="page-link" href="#" v-on:click.prevent="prev()">Previous</a></li>
				<template v-for="idx in idxlist">
					<li class="page-item"><a class="page-link" href="#" v-on:click.prevent="gotoPage(idx)">{{idx}}</a>
					</li>
				</template>
				<li class="page-item"><a class="page-link" href="#" v-on:click.prevent="next()">Next</a></li>
			</ul>
			<div class="d-left justify-content-center">



				<form action="/notice/search.do" v-on:submit.prevent="searchNotice()">
					<div style="display: flex;">
						<select class="form-control" style="width: inherit;" name="condition" v-model="condition">
							<option value="title">제목</option>
							<option value="content">내용</option>

						</select> <input type="text" placeholder="검색할 제목 입력" name="key" id="searchbox" v-model="key">
						<button type="submit" id="search_btn">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</form>

				<c:if test="${!empty id}">
					<div class="text-center">
						<button class="btn btn-primary " id="addbtn" onclick="location.href='/notice/regist.do'">공지사항
							등록</button>
					</div>
				</c:if>

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
	<script src="/vendor/jquery/jquery.min.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Contact Form JavaScript -->
	<script src="/js/jqBootstrapValidation.js"></script>
	<script src="/js/contact_me.js"></script>

	<!-- Custom scripts for this template -->
	<script src="/js/freelancer.min.js"></script>

	<script type="text/javascript">
		$("#searchbox").on("keyup", function (e) {
			if (e.keyCode == 13) {
				$("#search_btn").trigger("click");
			}
		});
	</script>
	<script src='https://cdn.jsdelivr.net/npm/vue/dist/vue.js'></script>
	<script src=' https://unpkg.com/vue-router@2.0.0/dist/vue-router.js'></script>
	<script src='https://unpkg.com/axios/dist/axios.min.js'></script>
	<script>
		var noticelist = new Vue({
			el: '#noticelist',
			data: {
				noticelist: [],
				condition: "title",
				key: "",

				pagination: "",
				idxlist: []


			},

			mounted() {

				axios.get("/rest/Notice/Page?page=1&range=1")
					.then(response => {

						response = response.data.data;

						this.noticelist = response.items;
						this.noticelist.forEach(p => {
							p["url"] = "/notice/detail.do?no=" + p.no;
						});
						this.pagination = response.pagination;
						this.setidxlist();

					})
					.catch((error) => {})
					.finally(() => {});

			},

			methods: {

				gotoPage(pagenum) {
					let page = parseInt(pagenum);
					let range = parseInt((page - 1) / (parseInt(this.pagination.rangeSize))) + 1;

					console.log(page, range);

					axios.get("/rest/Notice/Page?page=" + page + "&range=" + range)
						.then(response => {

							response = response.data.data;

							this.noticelist = response.items;
							this.noticelist.forEach(p => {
								p["url"] = "/notice/detail.do?no=" + p.no;
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

					axios.get("/rest/Notice/Page?page=" + page + "&range=" + range)
						.then(response => {

							response = response.data.data;

							this.noticelist = response.items;
							this.noticelist.forEach(p => {
								p["url"] = "/notice/detail.do?no=" + p.no;
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

					axios.get("/rest/Notice/Page?page=" + page + "&range=" + range)
						.then(response => {

							response = response.data.data;

							this.noticelist = response.items;
							this.noticelist.forEach(p => {
								p["url"] = "/notice/detail.do?no=" + p.no;
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

				searchNotice() {

					console.log("test");
					let k = this.key;
					let c = this.condition;
					let url = 'rest/notice/search?condition=' + c + '&key=' + k;

					axios.get(url)
						.then(response => {
							this.noticelist = response.data.data;
							this.noticelist.forEach(p => {
								p["url"] = "/notice/detail.do?no=" + p.no;
							});


						})
						.catch((error) => {})
						.finally(() => {});

				},


			}

		});
	</script>




</body>

</html>