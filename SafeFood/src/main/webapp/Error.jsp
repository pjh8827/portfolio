<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/title.jsp"></jsp:include>
	<h1>처리중문제가 발생하였습니다.</h1>
	<h2>${message }</h2>
	<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>