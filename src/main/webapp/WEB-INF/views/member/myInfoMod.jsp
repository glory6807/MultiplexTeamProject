<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<c:if test="${! empty updateFail}">
	<script>
		alert('${updateFail}');
	</script>
</c:if>

<div class="offers_area padding_top">
	<div class="container">
		<div class="row">
			<div class="col-xl-12">
				<div class="section_title text-left mb-100 custom-border-bottom"
					id="memberIdNav">
					<h2>내 정보 수정</h2>
				</div>
			</div>
		</div>
		<div class="row justify-content-lg-center" name="regForm">
			<div class="col-lg-8 col-md-8">
				<form method="post" action="/member/myInfoMod" role="form" id="myInfoModifyForm">
					<div class="mt-10 custom-input">
						<div>아이디</div>
						<sec:authorize access="isAuthenticated()">
							<div><sec:authentication property="principal.username"/></div>
							<input type="hidden" name="memberId" value="<sec:authentication property="principal.username"/>">
						</sec:authorize>
					</div>
					<br>
					<div class="mt-10 custom-input">
						<div class="">이름</div>
						<sec:authorize access="isAuthenticated()">
							<div><c:out value="${memberInfo.memberName}"/></div>
						</sec:authorize>
					</div>
					<br>
					<div class="mt-10 custom-input">
						<div>비밀번호</div>
						<input type="password" name="memberPw" id="memberPw"
							class="single-input custom-text-right">
						<div class="custom-red-font custom-text-right"
							id="memberPwErrorMsg"></div>
					</div>
					<br>
					<div class="mt-10 custom-input">
						<div>비밀번호 확인</div>
						<input type="password" id="memberPwChk"
							class="single-input custom-text-right">
						<div class="custom-red-font custom-text-right"
							id="memberPwChkErrorMsg"></div>
					</div>
					<br>
					<div class="mt-10 custom-input">
						<div>핸드폰</div>
						<button type="button" class="btn btn-primary btn-sm"
							id='phoneAuthBtn' style="margin-left: 8px;">인증하기</button>
						<div class="default-select custom-text-left" id="default-select">
							<select name="memberPhoneFirst" id="memberPhoneFirst">
								<c:choose>
									<c:when test="${memberInfo.memberPhoneFirst eq 010}">
										<option value="${memberInfo.memberPhoneFirst}">${memberInfo.memberPhoneFirst}</option>
										<option value="011">011</option>
										<option value="018">018</option>
									</c:when>
									<c:when test="${memberInfo.memberPhoneFirst eq 011}">
										<option value="010">010</option>
										<option value="${memberInfo.memberPhoneFirst}">${memberInfo.memberPhoneFirst}</option>
										<option value="018">018</option>
									</c:when>
									<c:when test="${memberInfo.memberPhoneFirst eq 018}">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="${memberInfo.memberPhoneFirst}">${memberInfo.memberPhoneFirst}</option>
									</c:when>
								</c:choose>
							</select>
						</div>
						<div class="custom-text-left custom-my-auto">-</div>
						<input type="text" name="memberPhoneSecond" id="memberPhoneSecond"
							class="single-input custom-text-left custom-input-size-phone" value="${memberInfo.memberPhoneSecond}">
						<div class="custom-text-left custom-my-auto">-</div>
						<input type="text" name="memberPhoneThird" id="memberPhoneThird"
							class="single-input custom-text-left custom-input-size-phone" value="${memberInfo.memberPhoneThird}">
						<div class="custom-red-font custom-text-right"
							id="memberPhoneErrorMsg"></div>
						<input type="hidden" id="phoneAuthChk" value=""/>
					</div>
					<br>
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				</form>
				<form action="/member/myInfo" method="get" id="cancelForm">
					<input type="hidden" name="memberId" value="<sec:authentication property="principal.username"/>">
				</form>
				<button class="boxed-btn3 text-center" id="infoModifyBtn">수정 완료</button>
				<button class="boxed-btn3 text-center" id="infoModifyCancelBtn">취소</button>
			</div>
		</div>
	</div>
</div>
	<script type="text/javascript" src="/resources/js/memberFind.js"></script>
	<script>
		$(function(){
			var memberIdValidate = '${memberInfo.memberId}';
			var principalUsernmae = '<sec:authorize access="isAuthenticated()"><sec:authentication property="principal.username"/></sec:authorize>';
			
			if(memberIdValidate != principalUsernmae){
				location.href='/accessError';
			}
			
			function popup(url){
		        var name = "본인인증 서비스";
		        var popupX = (window.screen.width/2)-(200/2);
		 	    // 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

		     	var popupY= (window.screen.height / 2) - (300 / 2);
		     	// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
		        var option = "width = 500, height = 300, left = "+popupX+", top = "+popupY;
		        window.open(url, name, option);
		    }
			
			$('#phoneAuthBtn').on("click", function(e){
				e.preventDefault();
				var phoneRegExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
				
				var phoneAuthNullChk = false;	// 인증 버튼 눌렀을때 핸드폰 번호 널값 처리
				
				var phoneFirst = $('select#memberPhoneFirst').val();
				var phoneSecond = $('input#memberPhoneSecond').val();
				var phoneThird = $('input#memberPhoneThird').val();
				var phone = phoneFirst + phoneSecond + phoneThird;
				var regForPhoneNum = phoneFirst +"-"+ phoneSecond + "-" + phoneThird;
				var url = "/phoneAuthPopup?phone=" + phone;
				
				if(!phoneFirst){
					$('#memberPhoneErrorMsg').html('핸드폰 번호를 입력해주세요');
				}else if(!phoneSecond){
					$('#memberPhoneErrorMsg').html('핸드폰 번호를 입력해주세요');
				}else if(!phoneThird){
					$('#memberPhoneErrorMsg').html('핸드폰 번호를 입력해주세요');
				}else if(!phoneRegExp.test(regForPhoneNum)){
					$('#memberPhoneErrorMsg').html('번호 형식에 맞지않습니다');
				}else{
					$('#memberPhoneErrorMsg').html('');
					phoneAuthNullChk = true;
					if(phoneAuthNullChk == true){
						popup(url);
					}
				}
			});
			
			
			
			
			$('#infoModifyCancelBtn').on("click", function(e){
				$('#cancelForm').submit();
			});
			
			var memberPhoneFirst = '${memberPhoneFirst}';
			
			if(memberPhoneFirst == '010'){
				$('option').attr('selected','selected');
			}
			
			var registerResult = false;
			
			//id 중복 처리..
			$('input#memberId').blur(function(){
				var memberId = $('input#memberId').val();
				memberDuplicatedService.getId(memberId, function(result){
					if(result.memberId != memberId){
						$('#memberIdErrorMsg').html('사용 가능한 아이디 입니다');
					}else{
						$('#memberIdErrorMsg').html('중복된 아이디 입니다');	
					}
				});
			});
			
			// email 중복 처리 해야함
			$('select#memberEmailSecond').on('change', function(){
				var memberEmail = $('input#memberEmail').val()
				var memberEmailSecond = $('select#memberEmailSecond').val();
				
				var totalEmail = memberEmail + "@" + memberEmailSecond;
				
				memberDuplicatedService.getEmail(totalEmail, function(result){
					if(memberEmail == result.memberEmail && memberEmailSecond == result.memberEmailSecond){
						$('#memberEmailErrorMsg').html('중복된 이메일 입니다');
					}else{
						$('#memberEmailErrorMsg').html('사용 가능한 이메일 입니다');
					}
				});
			});
			
			var regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;

			$('input#memberPw').keyup(function(e) {
				
				v = $(this).val();

				if (regex.test(v)) {
					$('#memberPwErrorMsg').html('사용 가능합니다!');
					$(this).focus();
				}else{
					$('#memberPwErrorMsg').html('영어 대소문자/숫자/특수문자의 조합으로 8자리 이상으로 입력해주세요');
				}
				
			});

			
			$('input#memberPwChk').keyup(function(e) {
				if($(this).val() != $('input#memberPw').val()){
					$('#memberPwChkErrorMsg').html('비밀번호 항목과 일치하지 않습니다.');
				}else if(!$('input#memberPwChk').val()){
					$('#memberPwChkErrorMsg').html('필수 항목입니다.');
				}else {
					$('#memberPwChkErrorMsg').html('비밀번호 확인 되었습니다.');
				}
			});
			
			

			$('#infoModifyBtn').on("click", function(e) {
				
				var memberPw = $('input#memberPw').val();
				var memberPwChk = $('input#memberPwChk').val();
				var memberPhoneFirst = $('select#memberPhoneFirst').val();
				var memberPhoneSecond = $('input#memberPhoneSecond').val();
				var memberPhoneThird = $('input#memberPhoneThird').val();
				
				if(!registerResult){
					e.preventDefault();
				}
				
				var memberPwErrorMsg = $('#memberPwErrorMsg').html('');
				var memberPwChkErrorMsg = $('#memberPwChkErrorMsg').html('');
				var memberPhoneErrorMsg = $('#memberPhoneErrorMsg').html('');
				
				v = $('input#memberPw').val();
				
				//memberId select 해서 없으면 중복된 id 처리해야함
				if(!memberPw) {
					$('#memberPwErrorMsg').html('필수 항목입니다');
				}else if(!memberPwChk) {
					$('#memberPwChkErrorMsg').html('필수 항목입니다');
				}else if(!memberPhoneFirst) {
					$('#memberPhoneErrorMsg').html('필수 항목입니다');
				}else if(!memberPhoneSecond) {
					$('#memberPhoneErrorMsg').html('필수 항목입니다');
				}else if(!memberPhoneThird) {
					$('#memberPhoneErrorMsg').html('필수 항목입니다');
				}else if(!$('#phoneAuthChk').val()){
					$('#memberPhoneErrorMsg').html('휴대폰 인증이 필요합니다');
				}else{
					registerResult = true;
				}
				
				
				if (regex.test(v)) {
					$('#memberPwErrorMsg').html('사용 가능합니다!');
				}else{
					registerResult = false;
					$('#memberPwErrorMsg').html('영어 대소문자/숫자/특수문자의 조합으로 8자리 이상으로 입력해주세요');
				}
					
				if($('input#memberPwChk').val() != $('input#memberPw').val()){
					$('#memberPwChkErrorMsg').html('비밀번호 항목과 일치하지 않습니다.');
					registerResult = false;
				}else if(!$('input#memberPwChk').val()){
					$('#memberPwChkErrorMsg').html('필수 항목입니다.');
				}else {
					$('#memberPwChkErrorMsg').html('비밀번호 확인 되었습니다.');
				}
				
				var modifyInfoConfirm = confirm('수정 하시겠습니까?');
				
				if(modifyInfoconfirm == true){
					if(registerResult){
						$('#myInfoModifyForm').submit();
					}
				}
				
				
			});
		})
	</script>

<%@ include file="../include/footer.jsp" %>