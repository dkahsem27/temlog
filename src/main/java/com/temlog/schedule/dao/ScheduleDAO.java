package com.temlog.schedule.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.temlog.schedule.model.Schedule;

@Repository
public interface ScheduleDAO {

	public void insertSchedule(
			@Param("userId") int userId, 
			@Param("startDate") Date startDate, 
			@Param("endDate") Date endDate, 
			@Param("subject") String subject, 
			@Param("content") String content);
	
	public void deleteSchedule(int scheduleId);
	
	public void updateSchedule(
			@Param("scheduleId") int scheduleId, 
			@Param("startDate") Date startDate, 
			@Param("endDate") Date endDate, 
			@Param("subject") String subject, 
			@Param("content") String content);
	
	public List<Schedule> selectScheduleList();
	
	public Schedule selectScheduleById(int scheduleId);
}
