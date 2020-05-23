/*
 * 댓글 등록하기(Ajax)
 */
function fn_comment(numb) {

    let comment_new = {
        no = numb,
        commen = $().val(),
        writer = $().val(),
        reg_time = $().val(),
    }

    $.ajax({
        url: "http://localhost:8080/rest/Comment",
        type: 'post',
        data: $("#commentForm").serialize(),
        success: function (data) {
            if (data == "success") {
                getCommentList();
                $("#comment").val("");
            }
        },
        error: function (xhr) {
            alert("댓글 등록 실패")
            console.log(xhr);
            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }

    });
}

/**
 * 초기 페이지 로딩시 댓글 불러오기
 */
$(function () {

    getCommentList();

});

/**
 * 댓글 불러오기(Ajax)
 */
function getCommentList() {

    $.ajax({
        type: 'GET',
        url: "<c:url value='/board/commentList.do'/>",
        dataType: "json",
        data: $("#commentForm").serialize(),
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        success: function (data) {

            var html = "";
            var cCnt = data.length;

            if (data.length > 0) {

                for (i = 0; i < data.length; i++) {
                    html += "<div>";
                    html += "<div><table class='table'><h6><strong>" + data[i].writer +
                        "</strong></h6>";
                    html += data[i].comment + "<tr><td></td></tr>";
                    html += "</table></div>";
                    html += "</div>";
                }

            } else {

                html += "<div>";
                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>";

            }

            $("#cCnt").html(cCnt);
            $("#commentList").html(html);

        },
        error: function (request, status, error) {

        }

    });
}