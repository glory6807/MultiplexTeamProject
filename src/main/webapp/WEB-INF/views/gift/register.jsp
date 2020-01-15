<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<!--board-start-->
<section id="tabs" class="project-tab">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="custom-board-title">
					<h3 class="custom-font-bold">기프티콘 등록</h3>
				</div>
				<form action="/gift/register" method="post" role="form">
					<div class="form-group">
						<label>이름</label> <input class="form-control" name="giftName">
					</div>
					<div class="form-group">
						<label>가격</label> <input class="form-control" name="giftPrice">
					</div>
					<div class="form-group">
						<label>구성</label> <input class="form-control" name="giftSet">
					</div>
					<div class="form-group text-center">
					<button type="submit" class="btn btn-primary btn-sm">등록</button>
					<button type="submit" class="btn btn-secondary btn-sm">취소</button>
				</div>
				</form>
				<div class="form-group">
					<label>사진</label><br>
					<div class="custom-photo">
						<input type="file" name="uploadFile" multiple>
					</div>
				</div>
				<hr>
				<div class="uploadResult">
					<ul>

					</ul>
				</div>
				
				
			</div>
		</div>
	</div>
</section>
<!--board-end-->
<script>
$(function(e){
		var formObj = $("form[role='form']");
		$("button[type='submit']").click(function(e){
			e.preventDefault();	//첨부파일 관련 처리를 할 수 있도록 기본 동작 막음
			console.log('submit clicked!');
			
			var tags = "";			
			$('.uploadResult ul li').each(function(i,obj){
				var o = $(obj);
				tags += "<input type='hidden' name='attachList["+i+"].giftFileName' value='" + o.data("giftFileName") + "'>";
				tags += "<input type='hidden' name='attachList["+i+"].giftUuid' value='" + o.data("giftUuid") + "'>";
				tags += "<input type='hidden' name='attachList["+i+"].giftUploadPath' value='" + o.data("giftUploadPath") + "'>";
			});	
			console.log(tags);
			$("form[role='form']").append(tags).submit();
		});
		
		//파일의 확장자와 크기를 설정하고 이를 검사하는 함수
		 var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		 var maxSize = 5242880; //5MB
		 
		 function checkExtension(fileName, fileSize) {
				if(fileSize >= maxSize) {	//파일 크기가 maxSize를 초과하는 경우
					alert("업로드 파일 사이즈가 초과되었습니다.");
					return false;				
				}
				if(regex.test(fileName)) {	//파일 확장자가 exe, sh, zip, alz인 경우
					alert("업로드 할 수 없는 파일입니다.");
					return false;
				}			
				return true;
			 }//END checkExetension()
			 
			 //var csrfHeaderName = "${_csrf.headerName}";
			 //var csrfTokenValue = "${_csrf.token}";
				 
				 $("input[type='file']").change(function(e){
					 var formData = new FormData();	//jQuery를 이용하는 경우 파일 업로드는 FormData라는 객체를 이용. 쉽게 말하면 가상의 <form>태그
					 var inputFile = $("input[name='uploadFile']");
					 var files = inputFile[0].files;
					
					console.log(files);		
					
					 /* add filedata to formdata */
					 for (var i = 0; i < files.length; i++) {
					 	alert('giftFileName : ' + files[i].name + '\nsize : ' + files[i].size);
					 	if(!checkExtension(files[i].name, files[i].size)) {					
							return false;
						} 
							formData.append('uploadFile',files[i]);			
					 }
					 
						$.ajax({					
							url : '/giftUpload/uploadAjaxAction',					
							processData : false,
							contentType : false,
							data : formData,
							type : 'POST',
							dataType : 'json',	//반환된 정보를 처리하도록 추가
							success : function(result) {	
								alert("upload ok");
								console.log(result);						
							},error : function(error) {
								alert("upload not ok");
								console.log(error);
							}		
						});//END ajax
						});//END click
					 
				$("button[type='submit']").click(function(e){
					e.preventDefault();
					console.log('submit clicked!');
				});
});
</script>
<%@include file="../include/footer.jsp"%>