<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
            border: 1px;
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
    </style>




</head>

<body id="page-top">

    <!-- Navigation -->
    <jsp:include page="/title.jsp" />

    <!-- Main Contents -->
    <!-- Portfolio Section -->
    <section class="page-section portfolio" id="QnaDetail">

        <!-- Portfolio Section Heading -->


        <!-- Icon Divider -->

        <div class="divider-custom">
            <h3 class="page-section-heading text-center text-uppercase text-secondary mb-0">Q&A</h3>
        </div>
        <div class="row justify-content-md-center">
            <input type="hidden" value="${QnaNo}" id="no">
            <div id="food_spec" class="col-lg-8 col-xl-7 pv-30">
                <table class="table table-bordered ">
                    <tbody>
                        <tr>
                            <td width="150">작성자</td>
                            <td>{{qna.id }}</td>
                        </tr>
                        <tr>
                            <td width="150">조회수</td>
                            <td>{{qna.viewcnt }}</td>
                        </tr>
                        <tr>
                            <td width="150">제목</td>
                            <td>{{qna.title }}</td>
                        </tr>

                        <tr>

                            <td colspan="2" height="500" v-html="qna.content"></td>
                        </tr>

                    </tbody>
                </table>

            </div>
        </div>
        <div class="row justify-content-md-center">
            <div class="container">
                <div id="commentListForm" name="commentListForm">
                    <div id="commentList">
                        <div v-for="(item,index) in comments" :key="index">
                            <table class='table'>
                                <h6>
                                    <string>{{item.writer}} {{item.reg_time.substring(0,10)}}</string>
                                </h6>
                                <string>{{item.commen}}</string>
                                <tr>
                                    <td></td>
                                </tr>
                                <button v-on:click="post_remove(item.c_code)">삭제</button>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-8 col-xl-7 pv-30">
                <br><br>
                <div>
                    <div>
                        <span><strong>Comments</strong></span> <span id="cCnt"></span>
                    </div>
                    <div>
                        <table class="table table-bordered">
                            <tr>
                                <td>
                                    <textarea style=" border: none;width: 840px" rows="3" cols="150" id="comm"
                                        name="comm" placeholder="댓글을 입력하세요"></textarea>
                                    <br>
                                    <div class="text-center">
                                        <button class="btn btn-primary" v-on:click="post()">등록</button>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <input type="hidden" id="no" name="no" value="${qna.no }" />
                <input type="hidden" id="memid" name="memid" value="${qna.id }">
            </div>
        </div>
        <c:if test="${!empty id}">
            <div class="text-center">
                <button class="btn btn-primary " onclick="location.href='/qna/modify.do?no=${QnaNo}'">Q&A
                    수정</button>
                <button class="btn btn-danger " id="delbtn" v-on:click="delpost">Q&A 삭제</button>
            </div>
        </c:if>

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
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="/js/jqBootstrapValidation.js"></script>
    <script src="/js/contact_me.js"></script>

    <!-- Custom scripts for this template -->
    <script src="/js/freelancer.min.js"></script>

    <!--<script src="/js/notice.js"></script>-->
    <script src='https://cdn.jsdelivr.net/npm/vue/dist/vue.js'></script>
    <script src=' https://unpkg.com/vue-router@2.0.0/dist/vue-router.js'></script>
    <script src='https://unpkg.com/axios/dist/axios.min.js'></script>


    <script type="text/javascript">
        var delpost = null;
        var App = new Vue({

            el: "#QnaDetail",

            data: {
                quill: "",
                qna: "",
                current_title: "",
                title: "",
                id: "",
                content: "",
                mode: "",
                no: "",
                commen: "",
                writerId: "",
                btnmode: "등록",
                comments: []
            },
            mounted() {

                let no = document.getElementById("no").value;
                axios
                    .get("/rest/Qna/" + no)
                    .then(response => {
                        this.qna = response.data.data;

                        axios.get("/rest/Comment/" + no)
                            .then(res => {
                                res = res.data;
                                console.log(res.data);
                                this.comments = res.data;
                            });
                    })
                    .catch((error) => {})
                    .finally(() => {});


            },
            methods: {

                delpost() {

                    let no = $("#no").val();
                    var input = confirm('삭제하시겠습니까?');
                    if (input == false) {
                        return;
                    }

                    $.ajax({
                        url: "/qna/delete.do?no=" + no,
                        type: "POST",
                        error: function (error) {
                            alert("삭제실패");
                            location.href = "/qna.do";
                        },
                        success: function (data) {
                            alert("삭제완료");
                            location.href = "/qna.do";
                        }
                    });

                },
                post() {
                    axios.post('/rest/Comment', {

                            "no": $("#no").val(),
                            "commen": $("textarea#comm").val(),
                            "writer": this.qna.id,
                            "reg_time": new Date(Date.now()).toISOString().substring(0, 10)

                        }).then(response => {
                            alert("등록성공");
                        })
                        .catch((error) => {
                            alert(error)
                        })
                        .finally(() => {});
                },
                post_remove(c_code1) {
                    let c_code2 = c_code1;
                    console.log(c_code2);
                    $.ajax({
                        url: "/rest/Comment/" + c_code2,
                        type: "delete",
                        // contentType: "application/json", //전송될 미디어 타입 지정 
                        success: function (resTxt) {
                            console.log(resTxt);
                            if (resTxt.status) {
                                alert("댓글 삭제 성공");
                                this.qna = resTxt.data.data;

                                axios.get("/rest/Comment/" + no)
                                    .then(resTxt => {
                                        resTxt = resTxt.data;
                                        console.log(resTxt.data);
                                        this.comments = resTxt.data;
                                    });

                            }
                        },
                        error: function (xhr) {
                            alert("댓글 삭제 실패 ")
                            console.log(xhr);
                        }
                    });

                },

            }
        });
    </script>

</body>
<script>
    Vue.config.devtools = true
</script>

</html>