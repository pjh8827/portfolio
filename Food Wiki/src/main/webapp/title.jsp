<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<c:url value="/" var="ctx"></c:url>
<div id="head">
	<div id="title">
		<!--  <h1>Board Manager: ${ctx }</h1> -->
		<!-- Navigation -->
		<nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
			<div class="container">
				<a class="navbar-brand js-scroll-trigger" href="/">Ssafy Food</a>
				<button
					class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded"
					type="button" data-toggle="collapse" data-target="#navbarResponsive"
					aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
					Menu <i class="fas fa-bars"></i>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav ml-auto">
						<!-- 공통 항목 -->


						<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/notice.do">공지 사항</a>
						</li>

						<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/qna.do">Q&A</a></li>

						<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/list.do">상품 정보</a>
						</li>

						<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/video.do">안전 식품
								영상</a></li>
						<c:choose>


							<c:when test="${not empty id }">
								<li class="nav-item mx-0 mx-lg-1"><a
										class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/report.do">내
										섭취 정보</a></li>

								<li class="nav-item mx-0 mx-lg-1"><a
										class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
										href="/logout.do">Log-Out</a></li>

								<li class="nav-item mx-0 mx-lg-1"><a
										class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
										href="/restMember.do">회원정보수정</a></li>

							</c:when>


							<c:otherwise>
								<li class="nav-item mx-0 mx-lg-1"><a
										class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger portfolio-item mx-auto"
										data-toggle="modal" data-target="#portfolioModal0">Log-In</a></li>

								<li class="nav-item mx-0 mx-lg-1"><a
										class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
										href="/restMember.do">회원가입</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</nav>
	</div>
</div>
<hr>

<div class="portfolio-modal modal fade" id="portfolioModal0" tabindex="-1" role="dialog"
	aria-labelledby="portfolioModal3Label" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true"> <i class="fas fa-times"></i>
				</span>
			</button>
			<div class="modal-body text-center">
				<div class="limiter">
					<div class="container-login100">
						<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">

							<article id="mainContent">
								<c:choose>
									<c:when test="${ empty id }">
										<c:if test="${not empty cookie.id}">
											<c:set var="idSave" value="value='${cookie.id.value}'" />
											<c:set var="checked" value="checked='checked'" />
										</c:if>
										<center>
											<article class='loginForm'>
												<form action="/login.do" method="post" id="frm">
													<table>
														<c:if test="${not empty referer}">
															<input type="hidden" name="referer" value='${referer}' />
														</c:if>
														<tr>
															<td>아 이 디</td>
															<td><input type="text" name="id" ${idSave} id="id" />
															</td>
														</tr>
														<tr>
															<td>비밀번호</td>
															<td><input type="password" name="password" id="password" />
															</td>
														</tr>
														<tr>
															<td align='right' colspan="2"><input type="checkbox"
																	name='idsave' value='t' ${checked}> 아이디 저장 <input
																	type="submit" value="로그인" /></td>
														</tr>
													</table>
												</form>
											</article>
										</center>
									</c:when>
								</c:choose>
							</article>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>