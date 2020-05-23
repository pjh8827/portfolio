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
  <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

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
	box-shadow: 0 .125rem .25rem rgba(0,0,0,.075)!important;
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
	height:140px;
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
#main_food_search_btn, #search_spinner {
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
</style>
</head>
<script type="text/javascript">

</script>
<body id="page-top">
  
  <!-- Navigation -->
  <jsp:include page ="/title.jsp" />

  <!-- Masthead -->
  <header class="masthead bg-primary text-white text-center">
    <div class="container d-flex align-items-center flex-column">

      <!-- Masthead Heading -->
      <h1 class="masthead-heading text-uppercase mb-0">※함께하는 안전식품※</h1>

      <!-- Icon Divider -->
      <div class="divider-custom divider-light">
        <div class="divider-custom-line"></div>
        <div class="divider-custom-icon">
          <i class="fas fa-star"></i>
        </div>
        <div class="divider-custom-line"></div>
      </div>

      <!-- Masthead Subheading -->
      <p class="masthead-subheading font-weight-light mb-0">더 알아보려면 채널로 놀러오세요~!</p>
    </div>
    <iframe width="770" height="433" src="https://www.youtube.com/embed/c-gL-oIhIpI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    <iframe width="770" height="433" src="https://www.youtube.com/embed/8ROoXuXxo2U" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	<iframe width="770" height="433" src="https://www.youtube.com/embed/8Oim_StsOyk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    <iframe width="770" height="433" src="https://www.youtube.com/embed/yJMy9pAcsw8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	
 </header>

  <jsp:include page ="/footer.jsp" />

  <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
  <div class="scroll-to-top d-lg-none position-fixed ">
    <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top">
      <i class="fa fa-chevron-up"></i>
    </a>
  </div>

 
  
 

  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>
  
  <!-- Contact Form JavaScript -->
  <script src="${pageContext.request.contextPath}/js/jqBootstrapValidation.js"></script>
  <script src="${pageContext.request.contextPath}/js/contact_me.js"></script>

  <!-- Custom scripts for this template -->
  <script src="${pageContext.request.contextPath}/js/freelancer.min.js"></script>
  
  <script src="${pageContext.request.contextPath}/js/search.js"></script>

</body>

</html>