package com.temlog.schedule;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.temlog.schedule.bo.ScheduleBO;
import com.temlog.schedule.model.Schedule;

@Controller
public class ScheduleController {

	@Autowired
	private ScheduleBO scheduleBO;
	
	@RequestMapping("/schedule/schedule_main_view")
	public String scheduleMainView(Model model) {
		
		List<Schedule> scheduleList = scheduleBO.getScheduleList();
		model.addAttribute("scheduleList", scheduleList);
		
		//Schedule schedule = new Schedule();
		for (var i = 0; i < scheduleList.size(); i++) {
			Schedule schedule = scheduleBO.getScheduleById(scheduleList.get(i).getId());
			model.addAttribute("schedule", schedule);
		}
		 
		
		model.addAttribute("viewName", "schedule/scheduleMain");
		return "template/layout";
	}
	
	@RequestMapping("/schedule/schedule_create_view")
	public String scheduleCreateView(Model model) {
		model.addAttribute("viewName", "schedule/scheduleCreate");
		return "template/layout";
	}
	
	@RequestMapping("/schedule/schedule_update_view")
	public String scheduleUpdateView(Model model) {
		model.addAttribute("viewName", "schedule/scheduleUpdate");
		return "template/layout";
	}
}
