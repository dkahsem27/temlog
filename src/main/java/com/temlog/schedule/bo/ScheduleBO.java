package com.temlog.schedule.bo;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.temlog.schedule.dao.ScheduleDAO;

@Service
public class ScheduleBO {

	@Autowired
	private ScheduleDAO scheduleDAO;
	
	public void addSchedule(int userId, Date startDate, Date endDate, String subject, String content) {
		scheduleDAO.insertSchedule(userId, startDate, endDate, subject, content);
	}
}
