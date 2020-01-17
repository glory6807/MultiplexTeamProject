<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../include/header.jsp"%>

<!--board-start-->
<section id="tabs" class="project-tab">
	<div class="custom-container">
		<div class="row custom-mobile">
			<div class="col-md-12">
				<div class="custom-board-title">
					<h3 class="custom-font-bold">기프티콘</h3>
				</div>
				<a id="regGift" class="btn btn-primary btn-sm">등록</a>
				<!--search-start-->
				<div class="pull-right">
					<input type="text" placeholder="검색어를 입력하세요"
						class="input-group-btn ">
					<button type="submit" class="btn btn-primary btn-sm">검색</button>
				</div>
				<!--search-end-->
				<!--first-line-s-->
				<div class="container">
					<div class="custom-gift-divide-border">
						<h4 class="custom-divide">팝콘</h4>
					</div>
					<div class="row">

						<!-- data-start -->
						<div class="product-content">
							<div class="col-md-3 col-sm-6">
								<c:forEach items="${list}" var="gift">			
									<br>
									<b> <a class="move" href="/gift/get?giftNo=${gift.giftNo}"><c:out
												value="${gift.giftNo}" /></a> 
									</b>
									<div class="price">
										<c:out value="${gift.giftPrice}" />
									</div>
								</c:forEach>
								
								
								<div class="uploadResult">
										<ul>
										
										</ul>
									</div>
								
								
								
							</div>
						</div>

						<!-- data-end -->

					</div>
					<!--first-line-e-->

				</div>
			</div>
		</div>
		</div>
</section>
<!--board-end-->

<script>
//즉시 실행함수 - 첨부파일 목록 가져오기
	(function(){
	$.getJSON("/gift/giftPicList", function(data) {
		console.log(data);			
		var li = "";
		$(data).each(function(index, obj){								
			//이미지이면 그대로 표시				
				var filePath = encodeURIComponent(obj.giftUploadPath + obj.giftUuid + "_" + obj.giftFileName);				
				li += "<li data-path='"+obj.giftUploadPath+"' data-uuid='"+obj.giftUuid+"' data-fileName='"+obj.giftFileName+"' ><div>" + 
					  "<img src='/giftUpload/display?giftFileName="+filePath+"' style='float:left;'></div></li>";
		});		
		
				$('.uploadResult ul').append(li);		
			
	});//END JSON	
	})();


/* $('.move').click(
	function(e) {
		e.preventDefault();
		//actionForm에 hidden으로 name 속성 추가 값은 giftNo 지정, value 속성 추가 값은 ~~ 지정한 후 append
		$('#actionForm').append(
				"<input type='hidden' name='giftNo' value='"
						+ $(this).attr("href") + "'>");
		$('#actionForm').attr("action", "/gift/get");

		$('#actionForm').submit();
	}); */
	
$('#regGift').click(function() {
	self.location = "/gift/register";
});
</script>
<%@include file="../include/footer.jsp"%>