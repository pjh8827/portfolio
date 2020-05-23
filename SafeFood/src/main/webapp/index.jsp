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
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet"
    type="text/css">

  <!-- Theme CSS -->
  <link href="css/freelancer.min.css" rel="stylesheet">
  <link href="css/custom.css" rel="stylesheet">

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
            <h1 class="masthead-heading text-uppercase mb-0"><a href="/notice.do" id="tick_01">WHAT WE PROVIDE</a></h1>
            <h1 class="masthead-heading text-uppercase mb-0"><a href="/list.do" id="tick_01">What kinda food?</a></h1>
            <h1 class="masthead-heading text-uppercase mb-0"><a href="/restMember.do" id="tick_01">Check allergy</a>
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
            <p class="masthead-subheading font-weight-light mb-0"><a href="/notice.do" id="tick_02">건강한 삷을 위한 먹거리
                프로젝트</a></p>
            <p class="masthead-subheading font-weight-light mb-0"><a href="/list.do" id="tick_02">어떤 음식이든 푸드 위키에서
                검색하세요!</a></p>
            <p class="masthead-subheading font-weight-light mb-0"><a href="/restMember.do" id="tick_02">회원정보에서 알레르기를
                추가해보세요!</a></p>
          </div>
        </div>
      </div>
    </div>



    <section class="form-group d-flex align-items-center justify-content-center" id="main_food_search">
    </section>
  </header>

  <!-- Portfolio Section -->
  <section class="page-section portfolio" id="recentUpdatedFoodlist">
    <div class="container">

      <!-- Portfolio Section Heading -->
      <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Food List</h2>

      <!-- Icon Divider -->
      <div class="divider-custom">
        <div class="divider-custom-line"></div>
        <div class="divider-custom-icon">
          <i class="fas fa-star"></i>
        </div>
        <div class="divider-custom-line"></div>
      </div>

      <div class="row">
        <template v-for="food in foodlist">

          <div class="col-md-6 col-lg-4">
            <div v-on:click="showDetail(food.code)" class="portfolio-item mx-auto">
              <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i>
                </div>
              </div><img :src="food.img" :alt="food.name" class="img-fluid" v-on:click="showDetail(food.code)">
            </div>
          </div>

        </template>
      </div>

    </div>
  </section>

  <jsp:include page="footer.jsp"></jsp:include>

  <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
  <div class="scroll-to-top d-lg-none position-fixed ">
    <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top">
      <i class="fa fa-chevron-up"></i>
    </a>
  </div>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Contact Form JavaScript -->
  <script src="js/jqBootstrapValidation.js"></script>
  <script src="js/contact_me.js"></script>

  <!-- Custom scripts for this template -->
  <script src="js/freelancer.min.js"></script>


  <script>
    $(":button[type='submit']").on("click", function (e) {
      e.preventDefault();
    });
  </script>

</body>

<!--vue 적용-->
<script src='https://cdn.jsdelivr.net/npm/vue/dist/vue.js'></script>
<script src=' https://unpkg.com/vue-router@2.0.0/dist/vue-router.js'></script>
<script src='https://unpkg.com/axios/dist/axios.min.js'></script>
<script>
  var recentUpdatedFoodlist = new Vue({
    el: '#recentUpdatedFoodlist',
    data() {
      return {
        foodlist: []

      }
    },
    mounted() {

      let range = 1;
      let page = this.getRandomInt(1, 5);

      axios.get("/rest/Food/Page?page=" + page + "&range=" + range)
        .then(response => {

          data = response.data.data;

          this.foodlist = data.items.splice(0, 9);

          this.foodlist[8].img = 'img/etc.png';
          this.foodlist[8].code = '-1';
          /*
          this.foodlist.forEach(p => {
            p["url"] = "/notice/detail.do?no=" + p.no;
          });
          */

        })
        .catch((error) => {})
        .finally(() => {});
    },
    methods: {
      getRandomInt(min, max) {
        min = Math.ceil(min);
        max = Math.floor(max);
        return Math.floor(Math.random() * (max - min)) + min; //최댓값은 제외, 최솟값은 포함
      },
      showDetail(code) {
        if (code == "-1") {
          window.location.href = "/list.do";
        } else {
          window.location.href = "/detail.do?code=" + code;
        }

      }

    }

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

</html>