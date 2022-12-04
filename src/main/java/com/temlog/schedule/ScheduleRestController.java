package com.temlog.schedule;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.temlog.schedule.bo.ScheduleBO;

@RestController
public class ScheduleRestController {

	@Autowired
	private ScheduleBO scheduleBO;
	
	@PostMapping("/schedule/create")
	public Map<String, Object> scheduleCreate(
			@RequestParam("startDate") @DateTimeFormat(pattern="yyyy-MM-dd") Date startDate,
			@RequestParam(value="endDate", required=false) @DateTimeFormat(pattern="yyyy-MM-dd") Date endDate,
			@RequestParam("subject") String subject,
			@RequestParam(value="content", required=false) String content,
			HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		Map<String, Object> result = new HashMap<>();
		
		// insert schedule
		scheduleBO.addSchedule(userId, startDate, endDate, subject, content);
		result.put("code", 100);
		result.put("result", "success");
		result.put("errorMessage", "일정 등록에 실패했습니다. 관리자에게 문의해주세요.");
		
		return result;
	}
	
	@DeleteMapping("/schedule/delete")
	public Map<String, Object> scheduleDelete(
			@RequestParam("scheduleId") int scheduleId) {
		
		Map<String, Object> result = new HashMap<>();
		
		// delete schedule
		scheduleBO.deleteSchedule(scheduleId);
		result.put("code", 100);
		result.put("errorMessage", "일정 삭제에 실패했습니다. 관리자에게 문의해주세요.");
		
		return result;
	}
	
	@PutMapping("/schedule/update")
	public Map<String, Object> update(
			@RequestParam("scheduleId") int scheduleId,
			@RequestParam("startDate") @DateTimeFormat(pattern="yyyy-MM-dd") Date startDate,
			@RequestParam(value="endDate", required=false) @DateTimeFormat(pattern="yyyy-MM-dd") Date endDate,
			@RequestParam("subject") String subject,
			@RequestParam(value="content", required=false) String content) {
		
		Map<String, Object> result = new HashMap<>();
		
		// update schedule
		scheduleBO.updateSchedule(scheduleId, startDate, endDate, subject, content);
		
		result.put("code", 100);
		result.put("result", "success");
		result.put("errorMessage", "일정 수정에 실패했습니다. 관리자에게 문의해주세요.");
		
		return result;
	}
}
