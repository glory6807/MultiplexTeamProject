package com.mtms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

<<<<<<< HEAD
import com.mtms.mapper.GiftMapper;
=======
import com.mtms.domain.Criteria;
import com.mtms.domain.GiftAttachVO;
import com.mtms.domain.GiftVO;
import com.mtms.persistence.GiftMapper;
import com.mtms.persistence.MyGiftMapper;
>>>>>>> d47745afa78514a48ab8d8d27ff650741a180262

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class GiftServiceImpl implements GiftService{
	@Setter(onMethod_= @Autowired)
	private GiftMapper giftMapper;

	@Setter(onMethod_ = @Autowired)
	private MyGiftMapper myGiftMapper;
	
	@Override
	public void register(GiftVO gift) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<GiftVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public GiftVO get(int giftNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modify(GiftVO gift) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(int giftNo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<GiftAttachVO> getAttachList(int giftNo) {
		// TODO Auto-generated method stub
		return null;
	}
}
