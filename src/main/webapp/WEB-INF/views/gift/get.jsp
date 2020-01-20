<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../include/header.jsp" %>

<!--board s -->
<section id="tabs" class="project-tab">
	<div class="container custom-mobile">
		<div class="custom-gift-divide-border">
			<h3 class="custom-font-bold">
				<input class="giftName" value="${gift.giftName}" />
			</h3>
		</div>
		<div class="section-top-border">
			<div class="row">
				<div class="col-md-3">
					<div class="panel panel-default">
						<div class="panel-body">
							<!-- 사진 s -->
							<div class="uploadResult">
								<ul>

								</ul>
							</div>
							<!-- 사진 e -->
						</div>
					</div>
				</div>
				<!-- 내용 s -->
				<div class="col-md-9 mt-sm-20">
					<div class="form-group">
						<label>No&emsp; : &ensp;</label><span name="giftNo"><c:out value="${gift.giftNo}" /></span>
					</div>
					<div class="form-group">
						<label>가격&ensp; : &ensp;</label><input pattern="###,###" name="giftPrice" class="giftPrice" value="${gift.giftPrice}" readonly>
					</div>
					<div class="form-group">
						<label>구성&ensp; : &ensp;</label> <span name="giftSet"><c:out value="${gift.giftSet}" /></span>
					</div>
					<div class="qty mt-5">
						<span class="minus bg-dark">-</span> 
							<input type="number" class="num-count" name="qty" value="1"> 
						<span class="plus bg-dark">+</span>
						<span class="custom-price"><input name="totalPrice" class="totalPrice" value="${gift.giftPrice}" readonly></span>
					</div>
				</div>
				<!-- 내용 e -->
			</div>
		</div>
		<div class="custom-divide-border-top">
			<span class="custom-pull-right">
				<label>총 구매금액&emsp; : &emsp;</label><input name="totalPrice" class="totalPrice" value="${gift.giftPrice}" readonly>
			</span><br>	
			<br>
		</div>
		<!-- 버튼 s -->
		<div class="">
			<button class="btn btn-primary float-left custom-button-gift" data-oper='list'>LIST</button>
			
			<form method="post" action="/gift/remove" role="form">				
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">	
				<input value="${gift.giftNo}" name="giftNo" type="hidden">				
				<button type="submit" class="btn btn-danger float-right custom-button-gift" data-oper="remove">삭제</button>
			</form>
			
			<form action="/gift/modify" id="operForm" method="get">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">	
				<input value="${gift.giftNo}" name="giftNo" type="hidden">		
				<button type="submit" class="btn btn-primary float-right custom-button-gift" data-oper='modify' onclick="location.href='/gift/modify?giftNo=${gift.giftNo}'">수정</button>
			</form>
			
			<form action="/mygift/register" id="payForm" method="post">
				<input type="hidden" id="giftNo" name="giftNo" value="${gift.giftNo}"> 
				<input type="hidden" name="giftName" value="${gift.giftName}"> 
				<input type="hidden" name="giftSet" value="${gift.giftSet}"> 
				<input type="hidden" name="giftPrice" value="${gift.giftPrice}"> 
				<input type="hidden" name="totalPrice">
				<input type="button" id="payment" class="btn btn-primary float-right custom-button-gift" value="구입"/>
			</form>
		</div>
		<!-- 버튼 e -->
	</div>
</section>
<!-- board e -->

<script>
	
//결제


function payment(giftNo, giftName, giftPrice) {	
	
	var IMP = window.IMP; // 생략가능
	IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

	IMP.request_pay({
		pg: 'inicis', // version 1.1.0부터 지원.
		pay_method: 'card',
		merchant_uid: 'merchant_' + new Date().getTime()+30,
		name: $('.giftName').val(),
		amount: $('.totalPrice').val(),
		buyer_email: 'iamport@siot.do',
		buyer_name: '박진주',
		buyer_tel: '010-6626-2818',
		buyer_addr: '서울특별시 강남구 삼성동',
		buyer_postcode: '123-456',
		m_redirect_url: '/gift/pay'
	}, function(rsp) {
		if (rsp.success) {
			//컨트롤러로 값
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '상품명 : ' + rsp.name;
			msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;				
			} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
		}
		alert(msg);			
	});
}
	
	//form 전송
	$(function(){
	   var formObj = $("form");
	   $('button').on("click", function(e){
	      e.preventDefault();	      
	      var operation = $(this).data("oper");
	      if(operation === 'remove'){	//삭제 버튼
	    	   if(confirm("정말로 삭제하시겠습니까?") == true) { 
		         formObj.attr("action", "/gift/remove");
		         formObj.submit();
	    	   } else {
	    		   false;
	    	   }
	      }else if (operation === 'list') {
				formObj.attr("action", "/gift/list").attr("method", "get"); 
				formObj.submit();
	      }else if(operation === 'modify'){
	         formObj.attr("action", "/gift/modify");
	         formObj.submit();
	      } 
	      
	   });	  	
	}); 

	//첨부파일 목록 가져오기
	(function() {	
		$.getJSON("/gift/getAttachList", { giftNo : ${gift.giftNo}}, function(data) {
					console.log(data);
			var li = "";
			$(data).each(function(index, obj){								
				//이미지이면 그대로 표시				
				var filePath = encodeURIComponent(obj.giftUploadPath + obj.giftUuid + "_" + obj.giftFileName);				
				li += "<li data-path='"+obj.giftUploadPath+"' data-uuid='"+obj.giftUuid+"' data-fileName='"+obj.giftFileName+"'><div>" + 
					  "<img src='/giftUpload/display?giftFileName="+filePath+"' style='width:100%'></div></li>";		
			});	
					$('.uploadResult ul').append(li);		
				}).fail(function(xhr, status, err) {
					/* if(error) {
						error(err);
					} */
		});//END JSON	
	})();

    //기프티콘 수량 변경
    $(document).ready(function () {
        $('.num-count').prop('disabled', true);
        $(document).on('click', '.plus', function () {
            $('.num-count').val(parseInt($('.num-count').val()) + 1);
            $('.totalPrice').val(parseInt($('.giftPrice').val() * $('.num-count').val()));         
        });
        $(document).on('click', '.minus', function () {
            $('.num-count').val(parseInt($('.num-count').val()) - 1);
            $('.totalPrice').val(parseInt($('.totalPrice').val() - $('.giftPrice').val()));
            if ($('.num-count').val() == 0) {
                $('.num-count').val(1);
                alert("1개 이상 구입 가능");
                $('.totalPrice').val(parseInt($('.giftPrice').val() * 1));
            }
        });
    });
    
    
</script>

<%@include file="../include/footer.jsp"%>
