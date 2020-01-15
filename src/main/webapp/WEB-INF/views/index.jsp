
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
	<div class="offers_area padding_top">
		<div class="container">
			<div class="row">
				<div class="col-xl-4 col-md-4">
					<div class="single_offers">
						<div class="gj-text-align-center">
							<img class="customImgSize" src="/resources/img/banner/joker.jpg" alt="">
						</div>
						<div class="gj-text-align-center"><br>
							<p class="custom-movie-title-font">조커</p>
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-md-4">
					<div class="single_offers">
						<div class="gj-text-align-center">
							<img class="customImgSize" src="/resources/img/banner/frozen.jpg" alt="">
						</div>
						<div class="gj-text-align-center"><br>
							<p class="custom-movie-title-font">겨울왕국</p>
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-md-4">
					<div class="single_offers">
						<div class="gj-text-align-center">
							<img class="customImgSize" src="/resources/img/banner/interstellar.jpg" alt="">
						</div>
						<div class="gj-text-align-center"><br>
							<p class="custom-movie-title-font">인터스텔라</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- offers_area_end -->

	<!-- footer -->
	<footer class="footer">
		<div class="footer_top">
			<div class="container">
			
			</div>
		</div>
		<div class="copy-right_text">
			<div class="container">
				<div class="footer_border"></div>
				<div class="row">
					<div class="col-xl-8 col-md-7 col-lg-9">
						<p class="copy_right">
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;<script>
								document.write(new Date().getFullYear());

							</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</div>
					<div class="col-xl-4 col-md-5 col-lg-3">
						<div class="socail_links">
							<ul>
								<li>
									<a href="#">
										<i class="fa fa-facebook-square"></i>
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fa fa-twitter"></i>
									</a>
								</li>
								<li>
									<a href="#">
										<i class="fa fa-instagram"></i>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<!-- link that opens popup -->

	<!-- form itself end-->
	<form id="test-form" class="white-popup-block mfp-hide">
		<div class="popup_box ">
			<div class="popup_inner">
				<h3>Check Availability</h3>
				<form action="#">
					<div class="row">
						<div class="col-xl-6">
							<input id="datepicker" placeholder="Check in date">
						</div>
						<div class="col-xl-6">
							<input id="datepicker2" placeholder="Check out date">
						</div>
						<div class="col-xl-6">
							<select class="form-select wide" id="default-select" class="">
								<option data-display="Adult">1</option>
								<option value="1">2</option>
								<option value="2">3</option>
								<option value="3">4</option>
							</select>
						</div>
						<div class="col-xl-6">
							<select class="form-select wide" id="default-select" class="">
								<option data-display="Children">1</option>
								<option value="1">2</option>
								<option value="2">3</option>
								<option value="3">4</option>
							</select>
						</div>
						<div class="col-xl-12">
							<select class="form-select wide" id="default-select" class="">
								<option data-display="Room type">Room type</option>
								<option value="1">Laxaries Rooms</option>
								<option value="2">Deluxe Room</option>
								<option value="3">Signature Room</option>
								<option value="4">Couple Room</option>
							</select>
						</div>
						<div class="col-xl-12">
							<button type="submit" class="boxed-btn3">Check Availability</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</form>
	<!-- form itself end -->

	<%@ include file="include/footer.jsp" %>
