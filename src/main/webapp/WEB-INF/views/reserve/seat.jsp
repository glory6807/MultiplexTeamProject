<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ include file="../include/header.jsp" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

	<div class="hanna_head">
		<h3>RESERVE_SEAT</h3>
		<p> ${reserveTime.movieNo } / ${reserveTime.scheduleDate } / ${reserveTime.scheduleTime } / ${movieName } </p>
	</div>
	
	<!-- 예매 화면 -->
	<div class="hanna_container">
		<div class="section-top-border">
			<h3 class="mb-30">영화 예매</h3>
			<div class="row">
				<div class="col-md-4">
					<div class="single-defination">
						<h4 class="mb-20">인원 선택</h4>
						<div class="">
							<h6 class="mb-10">성인</h6>
							<h6 class="mb-10" id="adultNum">0</h6>
								<button class="hanna_button3" id="adultPlus"><i class="fa fa-plus" aria-hidden="true"></i></button>
								<button class="hanna_button3" id="adultMinus"><i class="fa fa-minus" aria-hidden="true"></i></button>
								<br><br>
							<h6 class="mb-10">청소년</h6>
							<h6 class="mb-10" id="teenNum">0</h6>
								<button class="hanna_button3" id="teenPlus"><i class="fa fa-plus" aria-hidden="true"></i></button>
								<button class="hanna_button3" id="teenMinus"><i class="fa fa-minus" aria-hidden="true"></i></button>
								<br>
						</div>
					</div>
				</div>
				<div class="col-md-8">
					<div class="single-defination">
						<h4 class="mb-20">좌석 선택</h4>
						<div style="padding-left:30px;"> ---- SCREEN ---- </div>
						
						<div class="hanna_seat">
							&nbsp&nbsp 1 &nbsp 2 &nbsp 3 &nbsp 4 &nbsp 5 <br>
							<c:forEach items="${seatStatus}" var="seat" varStatus="status">
									<c:if test="${status.count == 1 }"> A </c:if>
									<c:choose> 
										<c:when test="${seat.seatStatus == 0 }">
											<input type="checkbox" id="${seat.seatNo }" value="${seat.seatNo }" name="seatNo">
											<label for="${seat.seatNo }"></label>
										</c:when>
										<c:when test="${seat.seatStatus == 1 }">
											<input type="checkbox" id="${seat.seatNo }" value="${seat.seatNo }" name="seatNo" class="reserved_seat" disabled="disabled">
											<label for="${seat.seatNo }"></label>
										</c:when>
									</c:choose>
									
									<c:choose>
										<c:when test="${status.count == 5 }"><br>B</c:when>
										<c:when test="${status.count == 10 }"><br>C</c:when>
										<c:when test="${status.count == 15 }"><br>D</c:when>
										<c:when test="${status.count == 20 }"><br>E</c:when>
									</c:choose>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-xl-12 text-right">
					
				<form id="seatForm" action="/reserve/reserve" method="post">
					<input type="hidden" name="scheduleDate" value="${reserveTime.scheduleDate }">
					<input type="hidden" name="scheduleNo" value="${scheduleNo }">
					
					<sec:authorize access="isAuthenticated()">
						<input type="hidden" name="memberId" id="memberId"
							value="<sec:authentication property="principal.username"/>">
					</sec:authorize>
					
					<input type="hidden" name="adultNum">
					<input type="hidden" name="teenNum">
					<input type="hidden" name="seat">
					<input type="hidden" name="status" value="0">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">		
					<button id="goPayment" class="hanna_button2">>결제하기</button>
				</form>
			</div>
		</div>
	</div> <!-- END hanna_container -->
	
	<script>
	

		$('#goPayment').click(function(e){
			e.preventDefault();
			var adultNum = Number($('#adultNum').html());
			var teenNum = Number($('#teenNum').html());
			var clickedNum = $("input[type=checkbox]:checked").length;
			
			if(adultNum+teenNum < 1){
				alert('인원을 선택 후 이용해주세요.');
				return ;
			}
			
			if(adultNum+teenNum != clickedNum){
				alert('인원수에 맞게 좌석을 선택 후 이용해주세요.');
				return ;
			}
						
			var buyerName = $('#memberId').html();
			
			var IMP = window.IMP;
			IMP.init('imp75857452');
			IMP.request_pay({
				pg : 'inicis',
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime()+30,
				name : "s-cinema", //결제 내용 이름
				amount : adultNum * 10 + teenNum * 9, // 결제금액
				buyer_email : 'iamport@siot.do',
				buyer_name : buyerName,
				buyer_tel : '010-5287-5061',
				buyer_addr : '인천시',
				buyer_postcode : '12345',
				m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp){
				if(rsp.success){
					$("input[name=adultNum]").val(adultNum);
					$("input[name=teenNum]").val(teenNum);
					
					var seatStr = "";
					$("input[type=checkbox]:checked").each(function(index, item){
						if(index!=0){
							seatStr += ', ';
						}
						seatStr += "'" + $(this).val() + "'";
					});
					$("input[name=seat]").val(seatStr);
					
					$("#seatForm").submit();
					
				} else {
					var msg = '결제가 실패되었습니다.';
					msg += '\n에러 내용 : ' + rsp.error_msg;
					alert(msg);
				}
			});
		});
		
		$(function(){

			var seatsNum = $("input[type=checkbox]").length;
			var reservedNum = $(".reserved_seat").length;
			
			$("input[type=checkbox]").on("click", function(){
				var peopleNum = Number($("#adultNum").html()) + Number($("#teenNum").html());
				var clickedNum = $("input[type=checkbox]:checked").length;
				if(peopleNum < clickedNum){
					alert("인원 수에 맞게 좌석을 선택해주세요.");
					$(this).prop("checked", false);
				}
			});
			
			$('#adultPlus').on("click", function() {
				if(Number($('#adultNum').html()) == 2){
					alert('최대 2명까지 선택 가능합니다.');
				} else {
					var nowNum = Number($("#adultNum").html())+1 + Number($("#teenNum").html());
					if(seatsNum - reservedNum < nowNum){
						alert('좌석이 부족합니다.');
					} else {
						$('#adultNum').html(Number($('#adultNum').html()) + 1);
					}
				}
			});
			
			$('#adultMinus').on("click", function() {
				if(Number($('#adultNum').html()) == 0){
					alert('0이하로는 선택하실 수 없습니다.');
				} else {
					var clickNum = $("input[type=checkbox]:checked").length;
					var nowNum = Number($("#adultNum").html())-1 + Number($("#teenNum").html());
					if(clickNum > nowNum){
						alert('현재 선택된 좌석보다 적은 인원수입니다. 좌석 선택을 해제하신 후에 인원 수를 조정해주세요.');
					} else {
						$('#adultNum').html(Number($('#adultNum').html()) - 1);
					}
				}
			});
			
			$('#teenPlus').on("click", function() {
				if(Number($('#teenNum').html()) == 2){
					alert('최대 2명까지 선택 가능합니다.');
				}  else {
					var nowNum = Number($("#adultNum").html()) + Number($("#teenNum").html())+1;
					if(seatsNum - reservedNum < nowNum){
						alert('좌석이 부족합니다.');
					} else {
						$('#teenNum').html(Number($('#teenNum').html()) + 1);
					}
				}
			});
			
			$('#teenMinus').on("click", function() {
				if(Number($('#teenNum').html()) == 0){
					alert('0이하로는 선택하실 수 없습니다.');
				} else {
					var clickNum = $("input[type=checkbox]:checked").length;
					var nowNum = Number($("#teenNum").html()) - 1 + Number($("#adultNum").html());
					if(clickNum > nowNum){
						alert('현재 선택된 좌석보다 적은 인원수입니다. 좌석 선택을 해제하신 후에 인원 수를 조정해주세요.');
					} else {
						$('#teenNum').html(Number($('#teenNum').html()) - 1);
					}
				}
			});
			
		});	
	</script>

<%@ include file="../include/footer.jsp" %>