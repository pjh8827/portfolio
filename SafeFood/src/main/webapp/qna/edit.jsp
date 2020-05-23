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
    </style>




</head>

<body id="page-top">

    <!-- Navigation -->
    <jsp:include page="/title.jsp" />

    <!-- Main Contents -->
    <!-- Portfolio Section -->
    <section class="page-section portfolio" id="qnaEdit">
        <div class="container">

            <!-- Portfolio Section Heading -->
            <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">
                {{current_title}}
            </h2>

            <!-- Icon Divider -->
            <div class="divider-custom">
                <div class="divider-custom-line"></div>
                <div class="divider-custom-icon">
                    <i class="fas fa-star"></i>
                </div>
                <div class="divider-custom-line"></div>
            </div>
            <div class="row justify-content-center"></div>
            <div class="d-flex justify-content-center">
                <input type="hidden" value="${edit_no}" id="no">
                <input type="hidden" value="${edit_mode}" id="mode">
                <input type="hidden" value="${id}" id="writer_id">
                <table>
                    <tr id='main'>
                        <td id="rightColumn"><input id="article_title" name="title" placeholder="제목" v-model="title" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div id="editor"></div>
                        </td>
                    </tr>
                </table>

            </div>
            <div class="text-center">
                <button class="btn btn-primary" v-on:click="post()">{{btnmode}}</button>
                <button class="btn btn-secondary " id="cancelbtn" onclick="location.href='/notice.do'">취소</button>
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
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="/js/jqBootstrapValidation.js"></script>
    <script src="/js/contact_me.js"></script>

    <!-- Custom scripts for this template -->
    <script src="/js/freelancer.min.js"></script>



    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    <!-- Include the Quill library -->
    <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>

    <!-- Initialize Quill editor -->
    <script src="/js/notice.js"></script>
    <script src='https://cdn.jsdelivr.net/npm/vue/dist/vue.js'></script>
    <script src=' https://unpkg.com/vue-router@2.0.0/dist/vue-router.js'></script>
    <script src='https://unpkg.com/axios/dist/axios.min.js'></script>

    <script>
        var noticeEdit = new Vue({
            el: '#qnaEdit',
            data: {

                quill: "",
                qna: "",
                current_title: "",
                title: "",
                id: "",
                content: "",
                mode: "",
                no: "",
                writerId: "",
                btnmode: "등록"


            },
            mounted() {
                this.mode = document.getElementById("mode").value;
                if (this.mode == "modify") {
                    this.btnmode = "수정";
                    this.current_title = "Q&A" + this.btnmode;
                } else {

                }
                this.current_title = ""
                this.quill = new Quill('#editor', {
                    theme: 'snow'
                });
                console.log(this.quill);
                this.quill.clipboard.dangerouslyPasteHTML('<p></p><p></p><p></p><p></p>');


                // quill.clipboard.dangerouslyPasteHTML(0, "<p></p><p></p><p></p><p></p>");

                this.no = document.getElementById("no").value;
                this.writerId = document.getElementById("writer_id").value;
                if (no == "") {
                    return;
                }
                axios
                    .get("/rest/Qna/" + this.no)
                    .then(response => {
                        this.qna = response.data.data;
                        this.quill.clipboard.dangerouslyPasteHTML(this.qna.content);
                        this.title = this.qna.title;

                    })
                    .catch((error) => {})
                    .finally(() => {});
            },
            methods: {

                cancelpost() {

                    this.qna = "";

                },
                post() {

                    console.log("신규등록버튼");

                    this.qna = "";
                    this.content = this.quill.container.firstChild.innerHTML;

                    switch (this.mode) {

                        case "modify":
                            axios.put('/rest/Qna', {


                                    "content": this.content,
                                    "id": this.writerId,
                                    "no": this.no,
                                    "title": this.title

                                }).then(response => {

                                    alert("등록성공");

                                    location.href = "/qna.do";
                                })
                                .catch((error) => {})
                                .finally(() => {});

                            break;

                        case "regist":

                            axios.post('/rest/Qna', {
                                    "content": this.content,
                                    "id": this.writerId,
                                    "no": this.no,
                                    "title": this.title

                                }).then(response => {

                                    alert("등록성공");
                                    location.href = "/qna.do";

                                })
                                .catch((error) => {})
                                .finally(() => {});
                            break;
                    }
                }
            }
        });
    </script>
</body>

</html>