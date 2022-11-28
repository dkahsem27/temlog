package com.temlog.schedule.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ScheduleDAO {

	public void insertSchedule(
			@Param("userId") int userId, 
			@Param("startDate") Date startDate, 
			@Param("endDate") Date endDate, 
			@Param("subject") String subject, 
			@Param("content") String content);
}
