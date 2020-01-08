package com.mtms.service;

import java.util.List;

import com.mtms.domain.Criteria;
import com.mtms.domain.ReviewReportVO;

public interface ReviewReportService {
	public int getTotalCount(Criteria cri);
	public List<ReviewReportVO> getList(Criteria cri);
	public List<ReviewReportVO> getList();
	public boolean modify(ReviewReportVO rrvo);
	public boolean remove(int lostNo);
	public ReviewReportVO get(long reportNo);
	public void register(ReviewReportVO rrvo);
}
