<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>SafeFood</title>

	<c:url value="/" var="ctx"></c:url>

	<!-- Custom fonts for this theme -->
	<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet"
		type="text/css">

	<!-- Theme CSS -->
	<link href="${pageContext.request.contextPath}/css/freelancer.min.css" rel="stylesheet">

	<link href="${pageContext.request.contextPath}/css/custom.css" rel="stylesheet">

	<style>
		#private {
			width: 100%;
			text-align: right
		}

		#head {
			display: flex;
			width: 100%;
			align-items: center;
		}

		#head>#title {
			width: 80%;
			text-align: center;
		}
	</style>
	<title>Insert title here</title>
</head>

<body>

	<jsp:include page="../title.jsp" />
	<section class="page-section" id="contact">
		<div class="container">

			<!-- Contact Section Heading -->
			<br> </br>
			<c:choose>
				<c:when test="${not empty id }">
					<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">회원정보</h2>
				</c:when>
				<c:otherwise>
					<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">회원가입</h2>
				</c:otherwise>
			</c:choose>
			<!-- Icon Divider -->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>

			<!-- Contact Section Form -->
			<div class="row">
				<div class="col-lg-8 mx-auto">
					<!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
					<form name="sentMessage" id="contactForm" novalidate="novalidate" action="" method="get">
						<div class="control-group">
							<div class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>ID</label> <input class="form-control" id="id2" type="text" placeholder="ID"
									required="required" data-validation-required-message="아이디를 입력하세요."
									value="${member.id }">
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="control-group">
							<c:choose>
								<c:when test="${not empty id }">
									<div class="form-group floating-label-form-group controls mb-0 pb-2">
										<label>비밀번호</label> <input class="form-control" id="password2" type="text"
											placeholder="비밀번호" required="required"
											data-validation-required-message="비밀번호를 입력하세요" value="${member.password }">
										<p class="help-block text-danger"></p>
									</div>
								</c:when>
								<c:otherwise>
									<div class="form-group floating-label-form-group controls mb-0 pb-2">
										<label>비밀번호</label> <input class="form-control" id="password2" type="password"
											placeholder="비밀번호" required="required"
											data-validation-required-message="비밀번호를 입력하세요" value="${member.password }">
										<p class="help-block text-danger"></p>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="control-group">
							<div class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>이름</label> <input class="form-control" id="name" type="text" placeholder="이름"
									data-validation-required-message="이름을 입력하세요" value="${member.name }">
								<p class="help-block text-danger"></p>
							</div>
						</div>

						<div class="control-group">
							<div class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>이메일 주소</label> <input class="form-control" id="email" type="email"
									placeholder="이메일" data-validation-required-message="이메일을입력하세요"
									value="${member.email }">

								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="control-group">
							<div class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>주소</label> <input class="form-control" id="address" type="text" placeholder="주소"
									data-validation-required-message="주소를 입력하세요" value="${member.address }">
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="control-group">
							<div class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>전화번호</label> <input class="form-control" id="phone" type="text"
									placeholder="전화번호" data-validation-required-message="전화번호를 입력하세요"
									value="${member.phone }">
								<p class="help-block text-danger"></p>
							</div>
						</div>

						<div class="control-group">
							<fieldset class="form-group">
								<legend class="col-form-legend">Check Allergy</legend>
								<div class="row">
									<div class="col-sm-10">
										<div class="form-check form-check-inline">
											<input name="allergy" class="form-check-input" id="inlineCheckbox2"
												type="checkbox" name="대두" value="대두">
											<label class="form-check-label">대두 </label>
										</div>
										<div class="form-check form-check-inline">
											<input name="allergy" class="form-check-input" id="inlineCheckbox2"
												type="checkbox" name="땅콩" value="땅콩">
											<label class="form-check-label">땅콩 </label>
										</div>
										<div class="form-check form-check-inline">
											<input name="allergy" class="form-check-input" id="inlineCheckbox2"
												type="checkbox" name="우유" value="우유">
											<label class="form-check-label">우유 </label>
										</div>
										<div class="form-check form-check-inline">
											<input name="allergy" class="form-check-input" id="inlineCheckbox2"
												type="checkbox" name="게" value="게">
											<label class="form-check-label">게</label>
										</div>
										<div class="form-check form-check-inline">
											<input name="allergy" class="form-check-input" id="inlineCheckbox2"
												type="checkbox" name="새우" value="새우">
											<label class="form-check-label">새우</label>
										</div>
										<div class="form-check form-check-inline">
											<input name="allergy" class="form-check-input" id="inlineCheckbox2"
												type="checkbox" name="참치" value="참치">
											<label class="form-check-label">참치</label>
										</div>
										<div class="form-check form-check-inline">
											<input name="allergy" class="form-check-input" id="inlineCheckbox2"
												type="checkbox" name="연어" value="연어">
											<label class="form-check-label">연어</label>
										</div>
										<div class="form-check form-check-inline">
											<input name="allergy" class="form-check-input" id="inlineCheckbox2"
												type="checkbox" name="쑥" value="쑥">
											<label class="form-check-label">쑥 </label>
										</div>
										<div class="form-check form-check-inline">
											<input name="allergy" class="form-check-input" id="inlineCheckbox2"
												type="checkbox" name="소고기" value="소고기">
											<label class="form-check-label">소고기</label>
										</div>
										<div class="form-check form-check-inline">
											<input name="allergy" class="form-check-input" id="inlineCheckbox2"
												type="checkbox" name="닭고기" value="닭고기">
											<label class="form-check-label">닭고기 </label>
										</div>
										<div class="form-check form-check-inline">
											<input name="allergy" class="form-check-input" id="inlineCheckbox2"
												type="checkbox" name="돼지고기" value="돼지고기"> <label
												class="form-check-label">돼지고기</label>
										</div>
										<div class="form-check form-check-inline">
											<input name="allergy" class="form-check-input" id="inlineCheckbox2"
												type="checkbox" name="복숭아" value="복숭아">
											<label class="form-check-label">복숭아 </label>
										</div>
										<div class="form-check form-check-inline">
											<input name="allergy" class="form-check-input" id="inlineCheckbox2"
												type="checkbox" name="민들레" value="민들레">
											<label class="form-check-label">민들레</label>
										</div>

										<div class="form-check form-check-inline">
											<input name="allergy" class="form-check-input" id="inlineCheckbox2"
												type="checkbox" value="계란흰자"> <label class="form-check-label">계란흰자
											</label>
										</div>
									</div>
								</div>
							</fieldset>
						</div>
						<br>
						<div id="success"></div>
						<div class="form-group">
							<c:choose>
								<c:when test="${not empty id }">
									<button type="button" class="btn btn-primary btn-xl" id="editButton">수정하기</button>
									<button type="button" class="btn btn-primary btn-xl" id="deleteButton">회원탈퇴</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-primary btn-xl" id="regButton">회원가입</button>
								</c:otherwise>
							</c:choose>
						</div>

					</form>
				</div>
			</div>

		</div>
	</section>
	<jsp:include page="../footer.jsp" />
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	var allergylist2 = "";
	var allergylist = "${member.allergylist}";

	allergylist = allergylist.split(",");
	for (var i = 0; i < allergylist.length; i++) {

		let elt = allergylist[i];
		$("input:checkbox[value='" + elt + "']").prop("checked", true);
	}
	$("#regButton").on("click", function () {

		$("input:checkbox").each(function () {

			if ($(this).is(":checked") == true) {
				allergylist2 = allergylist2 + $(this).val() + ',';

			}
		});
		allergylist2 = allergylist2.substr(0, allergylist2.length - 1);
		let member = {
			id: $("#id2").val(),
			password: $("#password2").val(),
			name: $("#name").val(),
			email: $("#email").val(),
			phone: $("#phone").val(),
			address: $("#address").val(),
			allergylist: allergylist2
		};
		console.log(member);
		$.ajax({
			url: "/rest/Member",
			type: "post",
			data: JSON.stringify(member), //객체를 문자열로 변환 
			contentType: "application/json", //전송될 미디어 타입 지정 
			success: function (resTxt) {
				console.log(resTxt);
				if (resTxt.status) {
					alert("회원 가입 성공")
				}
			},
			error: function (xhr) {
				alert("회원 가입 실패 ")
				console.log(xhr);
			}
		});
	});
	$("#editButton").on("click", function () {

		$("input:checkbox").each(function () {

			if ($(this).is(":checked") == true) {
				allergylist2 = allergylist2 + $(this).val() + ',';

			}
		});
		allergylist2 = allergylist2.substr(0, allergylist2.length - 1);
		let member = {
			id: $("#id2").val(),
			password: $("#password2").val(),
			name: $("#name").val(),
			email: $("#email").val(),
			phone: $("#phone").val(),
			address: $("#address").val(),
			allergylist: allergylist2
		};
		$.ajax({
			url: "/rest/Member",
			type: "put",
			data: JSON.stringify(member), //객체를 문자열로 변환 
			contentType: "application/json", //전송될 미디어 타입 지정 
			success: function (resTxt) {
				console.log(resTxt);
				if (resTxt.status) {
					alert("회원정보 수정 성공")
				}
			},
			error: function (xhr) {
				alert("회원정보 수정 실패 ")
				console.log(xhr);
			}
		});
	});
	$("#deleteButton").on("click", function () {
		let id = $("#id2").val();
		$.ajax({
			url: "/rest/Member/" + id,
			type: "delete",
			success: function (resTxt) {
				console.log(resTxt);
				if (resTxt.status) {
					alert("회원 탈퇴 성공");
					location.href = ""
				}
			},
			error: function (xhr) {
				alert("회원 탈퇴 실패 ")
				console.log(xhr);
			}
		});
	});
</script>

</html>