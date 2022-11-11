package com.temlog.schedule;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ScheduleController {

	@RequestMapping("/schedule/schedule_main_view")
	public String scheduleMainView(Model model) {
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
