package com.mtms.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mtms.mapper.MemberMapper;
import com.mtms.mapper.MovieMapper;
import com.mtms.mapper.ReserveMapper;
import com.mtms.mapper.ScheduleMapper;
import com.mtms.domain.ReserveVO;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ReserveServiceImpl implements ReserveService{
	
//	@Setter(onMethod_ = @Autowired)
	private ReserveMapper reserveMapper;
	private MovieMapper movieMapper;
	private MemberMapper memberMapper;
	private ScheduleMapper scheduleMapper;

	@Override
	public ReserveVO get(String reserveNo) {
		// 예매 내역 불러오기
		return reserveMapper.read(reserveNo);
	}

	@Override
	public List<ReserveVO> getList(String memberId) {
		// TODO Auto-generated method stub
		//mapper.getList
		return null;
	}

	@Override
	public void register(ReserveVO rvo) {
		// 예매내역에 등록하기^^
		System.out.println("★★★★★reserve si - rvo");
		System.out.println("RESERVE NO : " + rvo.getReserveNo());
		System.out.println("memberid : " + rvo.getMemberId());
		System.out.println("scheduleno : " + rvo.getScheduleNo());
		System.out.println("seat : " + rvo.getSeat());
		System.out.println("status : " + rvo.getStatus());
		System.out.println("teen num : " + rvo.getTeenNum());
		System.out.println("adult num : " + rvo.getAdultNum());
		
		reserveMapper.insert(rvo);
	}

	@Override
	public boolean refund(String reserveNo) {
		// TODO Auto-generated method stub
		//mapper.update
		return false;
	}
}
