package com.temlog.schedule.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.temlog.schedule.dao.ScheduleDAO;
import com.temlog.schedule.model.Schedule;

@Service
public class ScheduleBO {

	@Autowired
	private ScheduleDAO scheduleDAO;
	
	public void addSchedule(int userId, Date startDate, Date endDate, String subject, String content) {
		scheduleDAO.insertSchedule(userId, startDate, endDate, subject, content);
	}
	
	public void deleteSchedule(int scheduleId) {
		scheduleDAO.deleteSchedule(scheduleId);
	}
	
	public List<Schedule> getScheduleList() {
		return scheduleDAO.selectScheduleList();
	}
	
	public Schedule getScheduleById(int scheduleId) {
		return scheduleDAO.selectScheduleById(scheduleId);
	}
}
