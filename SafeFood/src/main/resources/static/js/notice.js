var addpost = function () {
	
	let title = $("#article_title").val();
	let content = quill.root.innerHTML;
	
	console.log(title);
	console.log(content);
	
	$.ajax({
	  url: "/notice/add.do",
	  type:"POST",
	  data:{title:title, content:content},
	  error : function(error) {
	        alert("등록실패");
	        location.href="/notice.do";
	    },
	    success : function(data) {
	        alert("등록완료");
	        location.href="/notice.do";
	    }



	});
}

var modpost = function () {
	
	let no = $("#no").val();
	let title = $("#article_title").val();
	let content = quill.root.innerHTML;
	
	
	$.ajax({
	  url: "/notice/modify.do",
	  type:"POST",
	  data:{no:no,title:title, content:content},
	  error : function(error) {
	        alert("오류:수정실패");
	        location.href="/notice.do";
	    },
	    success : function(data) {
	    	
	    	if (data.result=="false") {
	    		alert("오류:수정실패");
			}
	    	else
	    	{
	    		 alert("수정완료");
	    	}
	       
	        location.href="/notice/detail.do?no="+no;
	    }



	});
}



var delpost = function () {
	
	let no = $("#no").val();
	
	
	$.ajax({
	  url: "/notice/delete.do?no="+no,
	  type:"POST",
	  error : function(error) {
	        alert("삭제실패");
	        location.href="/notice.do";
	    },
	    success : function(data) {
	        alert("삭제완료");
	        location.href="/notice.do";
	    }



	});
}


$("#addbtn").on("click",function(){
	addpost();
});
$("#delbtn").on("click",function(){
	delpost();
});
$("#modbtn").on("click",function(){
	modpost();
});

