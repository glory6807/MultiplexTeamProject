package com.mtms.service;

import java.util.List;
import java.util.Map;

import com.mtms.domain.MovieVO;
import com.mtms.domain.ScheduleVO;

public interface ScheduleService {
	
	/*				 __
	 * 		   .___(  .)<  duck
	 * 			\____)
	 * ~~~~~~~~~~~~~~
	 */
	
	// 상영스케줄 등록 - 리스트로 안받아와짐 왜?
	public int register(ScheduleVO rvo);
	
	// 상영스케줄 수정
	public boolean modify(int scheduleNo);
	
	// 상영스케줄 삭제
	public boolean remove(int scheduleNo);
	
	// 날짜별 상영스케줄 삭제 - fin
	public boolean removeDay(String scheduleDate);
	
	// 날짜별 상영스케줄 조회 - 리스트로 안받아와짐 왜?
	public List<ScheduleVO> get(String scheduleDate, String screen);
	
	// 예매) 상영중인 영화 목록 - fin
	public List<ScheduleVO> getMovie(String startDate, String endDate, String time);
	
	// 예매) 해당 영화의 상영 스케줄 조회 - fin
	public List<String> getDay(int movieNo, String startDate, String endDate, String time);
	
	// 예매) 해당 영화, 해당 날짜의 상영 시간 조회 - fin
	public List<String> getTime(int movieNo, String scheduleDate, String time);
	
	// 상영스케줄 등록) 방금 삽입한 스케줄 번호 알아오기 - fin
	public int getSeq();
	
	// 예매) 영화번호, 영화날짜, 영화시간으로 상영스케줄 번호 알아오기
	public int getScheduleNo(int movieNo, String scheduleDate, String scheduleTime);
	
	// 예매 결과) 스케줄 번호로 스케줄 정보 알아오기
	public ScheduleVO getSchedule(int scheduleNo);

}
