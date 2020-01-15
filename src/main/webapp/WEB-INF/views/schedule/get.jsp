<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 

<%@ include file="../include/header.jsp" %>



	<div class="hanna_head">
		<h3>TIME TABLE</h3>
	</div>
	
	<!-- 상영 날짜 선택 탭 -->
	<hr>
	<div class="schedule_item">
		<a href="#" class="schedule_item_date">
			<h3>15</h3>
			<p>Jan</p>
		</a>
		<a href="#" class="schedule_item_date">
			<h3>16</h3>
			<p>Jan</p>
		</a>
		<a href="#" class="schedule_item_date">
			<h3>17</h3>
			<p>Jan</p>
		</a>
	</div> <!-- 상영 날짜 선택 탭 END -->
	
	<!-- 상영시간표  -->
	<c:forEach items="${schedule }" var="s">
		<div class="hanna_container">
			<br>
			<div class="hanna_schedule_movie"> 겨울왕국2 </div>
			<div class="hanna_schedule_screen"> 1관 3층 </div>
			<hr>	
			<div class="hanna_schedule_time_wrap">
				<div class="hanna_schedule_time"> 10:00 </div>
				<div class="hanna_schedule_time"> 12:00 </div>
				<div class="hanna_schedule_time"> 14:00 </div>
				<div class="hanna_schedule_time"> 16:00 </div>
				<div class="hanna_schedule_time"> 18:00 </div>
				<div class="hanna_schedule_time"> 20:00 </div>
			</div>
		</div>
	</c:forEach>
	
					<c:forEach items="${list }" var="l">
                        <tr class="odd gradeX">
                            <td>${l.bno}</td>
                            <td><a href="${l.bno }" class="move">${l.title} 
								<c:choose>
									<c:when test="${l.replyCnt == 0}"> </c:when>
									<c:when test="${l.replyCnt != 0}"> <b>[<c:out value="${l.replyCnt}"/>]</b></c:when>   
								</c:choose>
                            	</a>  </td>
                            <td>${l.writer}</td>
                            <td class="center"><fmt:formatDate pattern="yyyy-MM-dd" value = "${l.regdate}"/></td>
                            <td class="center"><fmt:formatDate pattern="yyyy-MM-dd" value = "${l.updateDate}"/></td>
                        </tr>
                      </c:forEach>
	
	<div class="hanna_container">
		<br>
		<div class="hanna_schedule_movie"> 미드웨이 </div>
		<div class="hanna_schedule_screen"> 2관 3층 </div>
		<hr>
		<div class="hanna_schedule_time_wrap">
			<div class="hanna_schedule_time"> 09:00 </div>
			<div class="hanna_schedule_time"> 11:00 </div>
			<div class="hanna_schedule_time"> 13:00 </div>
			<div class="hanna_schedule_time"> 15:00 </div>
			<div class="hanna_schedule_time"> 17:00 </div>
			<div class="hanna_schedule_time"> 19:00 </div>
		</div>
	</div>
	
	<div class="hanna_container">
		<br>
		<div class="hanna_schedule_movie"> 백두산 </div>
		<div class="hanna_schedule_screen"> 3관 3층 </div>
		<hr>
		<div class="hanna_schedule_time_wrap">
			<div class="hanna_schedule_time"> 09:30 </div>
			<div class="hanna_schedule_time"> 11:30 </div>
			<div class="hanna_schedule_time"> 13:30 </div>
			<div class="hanna_schedule_time"> 15:30 </div>
			<div class="hanna_schedule_time"> 17:30 </div>
			<div class="hanna_schedule_time"> 19:30 </div>
		</div>
	</div>
	<!-- 상영시간표 END -->

	<!-- 관리자에게만 보임 : 시간표 등록/수정/삭제 버튼 -->
<!--     <div class="container"> -->
<!--         <div class="row"> -->
<!--             <div class="col-xl-10 offset-xl-1 col-md-12"> -->
<!--                 <div class="Query_border"> -->
<!--                     <div class="row align-items-center justify-content-center"> -->
<!--                         <div class="col-xl-6 col-md-6"> -->
<!-- 							<a href="#" class="hanna_button">시간표 등록</a> -->
<!-- 							<a href="#" class="hanna_button">시간표 수정</a> -->
<!-- 							<a href="#" class="hanna_button delete_button">시간표 삭제</a> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
    
    <div class="hanna_container">
<!--     	<div class="container"> -->
<!--     	<div class="row"> -->
<!-- 			<div class="col-xl-12"> -->
<!-- 				<div class="section_title text-center"> -->
			    	<button class="hanna_button">시간표 등록</button>
					<button class="hanna_button">시간표 수정</button>
					<button class="hanna_button delete_button">시간표 삭제</button>
<!-- 				</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
    </div>
	
	
	
	
<%@ include file="../include/footer.jsp" %>