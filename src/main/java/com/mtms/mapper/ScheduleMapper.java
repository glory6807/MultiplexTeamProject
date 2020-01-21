package com.mtms.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.mtms.domain.MovieVO;
import com.mtms.domain.ScheduleVO;

public interface ScheduleMapper {
	
	// 상영스케줄 등록
	public int insert(ScheduleVO rvo);

//	// 상영스케줄 수정
//	public int update(int scheduleNo);
//	
//	// 상영스케줄 삭제
//	public int delete(int scheduleNo);
	
	// 날짜별 상영스케줄 삭제
	public int deleteAll(@Param("scheduleDate") String scheduleDate);
	
	// 날짜별 상영스케줄 조회
	public List<ScheduleVO> get(@Param("scheduleDate") String scheduleDate, @Param("screen") String screen);
	
	// 현재 상영중인 영화 목록 가져오기 - fin
	public List<ScheduleVO> getMovie(@Param("startDate") String startDate, @Param("endDate") String endDate, @Param("time") String time);
	
	// 해당 영화의 상영 날짜 받아오기 - fin
	public List<String> getDay(@Param("movieNo") int movieNo, @Param("startDate") String startDate, @Param("endDate") String endDate, @Param("time") String time);
	
	// 해당 영화, 해당 날짜의 상영 시간 조회 - fin
	public List<String> getTime(@Param("movieNo") int movieNo, @Param("scheduleDate") String scheduleDate, @Param("time") String time);
	
	// 방금 삽입한 스케줄의 번호 알아오기 - fin
	public int getSeq();
	
	// 영화번호, 날짜, 시간으로 스케줄 번호 알아오기 - fin
	public int getScheduleNo(@Param("movieNo") int movieNo, @Param("scheduleDate") String scheduleDate, @Param("scheduleTime") String scheduleTime);
	
	// 스케줄 번호로 스케줄 정보 알아오기 - fin
	public ScheduleVO getSchedule(@Param("scheduleNo") int scheduleNo);

}