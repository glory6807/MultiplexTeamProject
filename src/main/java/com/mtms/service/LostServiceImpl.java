package com.mtms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

<<<<<<< HEAD
import com.mtms.domain.Criteria;
import com.mtms.domain.LostVO;
import com.mtms.persistence.LostMapper;
=======
import com.mtms.mapper.LostMapper;
>>>>>>> 73ca32040d3a453aedf362b28c130b17afc58b54

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class LostServiceImpl implements LostService{
	@Setter(onMethod_= @Autowired)
	private LostMapper lostMapper;

	@Override
	public int getTotalCount(Criteria cri) {
//		public int getTotalCount(Criteria cri) 
		return 0;
	}

	@Override
	public List<LostVO> getList(Criteria cri) {
//		public List<LostVo> getList(Criteria cri)
		return null;
	}

	@Override
	public List<LostVO> getList() {
//		public List<LostVo> getList() 
		return null;
	}

	@Override
	public boolean modify(LostVO lvo) {
//		public boolean modify(LostVo lvo)
		return false;
	}

	@Override
	public boolean remove(int lostNo) {
//		public boolean remove(LostVo lvo) 
		return false;
	}

	@Override
	public LostVO get(int lostNo) {
//		public LosstVO get(Long lostNo) 
		return null;
	}

	@Override
	public void register(LostVO lvo) {
		// TODO Auto-generated method stub
		
	}
}
