package com.mtms.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mtms.mapper.MemberMapper;
import com.mtms.mapper.MovieMapper;
import com.mtms.mapper.ReserveMapper;
import com.mtms.mapper.ScheduleMapper;
import com.mtms.domain.Criteria;
import com.mtms.domain.ReserveVO;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ReserveServiceImpl implements ReserveService{
	
	private ReserveMapper reserveMapper;
	private MovieMapper movieMapper;
	private MemberMapper memberMapper;
	private ScheduleMapper scheduleMapper;

	@Override
	public ReserveVO get(String reserveNo) {
		// 예매 완료! 페이지로 보내기
		return reserveMapper.read(reserveNo);
	}

	@Override
	public List<ReserveVO> getList(String memberId, Criteria cri) {
		// 회원별 예매내역 조회 (내 예매내역)
		System.out.println("r si memberId : " + memberId);
		System.out.println("r si cri - page : " + cri.getPageNum());
		System.out.println("r si cri - amount : " + cri.getAmount());
		
		List<ReserveVO> list = reserveMapper.getList(memberId, cri);
		System.out.println("r si list size : " + list.size());
		return list;
	}

	@Override
	public int getTotal(String memberId, Criteria cri) {
		// 회원별 총 예매 수 (페이징)
		return reserveMapper.getTotalCount(memberId, cri);
	}
	
	@Override
	public void register(ReserveVO rvo) {
		// 예매내역에 등록하기^^
//		System.out.println("★★★★★reserve si - rvo");
//		System.out.println("RESERVE NO : " + rvo.getReserveNo());
//		System.out.println("memberid : " + rvo.getMemberId());
//		System.out.println("scheduleno : " + rvo.getScheduleNo());
//		System.out.println("seat : " + rvo.getSeat());
//		System.out.println("status : " + rvo.getStatus());
//		System.out.println("teen num : " + rvo.getTeenNum());
//		System.out.println("adult num : " + rvo.getAdultNum());
		
		reserveMapper.insert(rvo);
	}

	@Override
	public boolean refund(String reserveNo) {
		// TODO Auto-generated method stub
		//mapper.update
		return false;
	}

}
