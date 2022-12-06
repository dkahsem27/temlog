package com.temlog.schedule;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.temlog.schedule.bo.ScheduleBO;
import com.temlog.schedule.model.Schedule;

@Controller
public class ScheduleController {

	@Autowired
	private ScheduleBO scheduleBO;
	
	@RequestMapping("/schedule/schedule_main_view")
	public String scheduleMainView(Model model, HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		List<Schedule> scheduleList = scheduleBO.getScheduleList(userId);
		model.addAttribute("scheduleList", scheduleList);
		
		model.addAttribute("viewName", "schedule/scheduleMain");
		return "template/layout";
	}
	
	@RequestMapping("/schedule/schedule_create_view")
	public String scheduleCreateView(Model model) {
		model.addAttribute("viewName", "schedule/scheduleCreate");
		return "template/layout";
	}
	
	@RequestMapping("/schedule/schedule_update_view")
	public String scheduleUpdateView(
			@RequestParam("scheduleId") int scheduleId,
			Model model) {
		
		Schedule schedule = scheduleBO.getScheduleById(scheduleId);
		model.addAttribute("schedule", schedule);
		
		model.addAttribute("viewName", "schedule/scheduleUpdate");
		return "template/layout";
	}
}
