package com.mtms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mtms.persistence.ScheduleMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ScheduleServiceImpl implements ScheduleService{
	@Setter(onMethod_ = @Autowired)
	private ScheduleMapper scheduleMapper;
}
