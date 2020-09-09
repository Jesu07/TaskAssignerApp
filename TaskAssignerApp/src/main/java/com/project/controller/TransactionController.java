package com.project.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.customvalidator.TaskMappingValidation;
import com.project.customvalidator.TaskMasterValidation;
import com.project.model.Notifications;
import com.project.model.TaskMapping;
import com.project.model.TaskMaster;
import com.project.model.Users;
import com.project.service.MailService;
import com.project.service.NotificationsService;
import com.project.service.TaskMappingService;
import com.project.service.TaskMasterService;
import com.project.service.UserService;


@Controller
public class TransactionController {

	@Autowired
	MainController mainController;
	
	@Autowired
	UserService userService;
	
	@Autowired
	TaskMasterService tmService;
	
	@Autowired
	TaskMappingService tamService;
	
	@Autowired
	MailService mailService;
	
	@Autowired
	NotificationsService notifyService;
	
	@GetMapping("GetTaskMaster")
	public ModelAndView getTaskMaster(HttpSession session, HttpServletRequest request,
			@RequestParam(value = "updated", required = false) String updated,
			@RequestParam(value = "added", required = false) String added,
			@RequestParam(value = "deleted", required = false) String deleted) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("id") == null) {
			mv.setViewName("redirect:/logout");
			mv.addObject("session", "Expired");
			return mv;
		}
		if (!(added == null))
			mv.addObject("added", "success");
		if (!(updated == null))
			mv.addObject("updated", "success");
		if (!(deleted == null))
			mv.addObject("deleted", "success");

		mv.setViewName("TaskMaster");
		mv.addObject("addTask", new TaskMasterValidation());
		mv.addObject("pagedListHolder", mainController.pagination(tmService.selectAll(), request));
		return mv;
	}
	
	@PostMapping("SaveTaskMaster")
	public ModelAndView saveTaskMaster(@Valid @ModelAttribute("addTask") TaskMasterValidation tm,BindingResult result,
			HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("id") == null) {
			mv.setViewName("redirect:/logout");
			mv.addObject("session", "Expired");
			return mv;
		}
		
		if(result.hasErrors()) {
			mv.setViewName("TaskMaster");
			mv.addObject("addError", "Error");
			mv.addObject("pagedListHolder", mainController.pagination(tmService.selectAll(), request));
			return mv;
		}
		
		List<TaskMaster> exist = tmService.selectAll();
		for (TaskMaster t : exist) {
			if (t.getTask_name().replaceAll("\\s", "").equalsIgnoreCase(tm.getTask_name().replaceAll("\\s", ""))) {
				mv.setViewName("TaskMaster");
				mv.addObject("pagedListHolder", mainController.pagination(tmService.selectAll(), request));
				mv.addObject("addError", "error");
				mv.addObject("addExist", "exist");
				return mv;
			}
		}
		
		TaskMaster t = new TaskMaster();
		t.setUser_ref(userService.selectById(tm.getUser_ref()));
		t.setTask_name(tm.getTask_name());
		t.setDescription(tm.getDescription());
		t.setCreated_on(tm.getCreated_on());
		t.setStatus(0);
		t.setInn(tm.isInn()?1:0);
		
		tmService.saveTaskMaster(t);
		
		mv.setViewName("redirect:/GetTaskMaster");
		mv.addObject("added", "Success");
		return mv;
	}
	
	@PostMapping("EditTask")
	public ModelAndView editTaskMaster(@Valid @ModelAttribute("addTask") TaskMasterValidation tm, BindingResult result,
			HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		if (result.hasErrors()) {
			mv.setViewName("TaskMaster");
			mv.addObject("editError", "error");
			mv.addObject("pagedListHolder", mainController.pagination(tmService.selectAll(), request));
			return mv;
		}
		if (session.getAttribute("id") == null) {
			mv.setViewName("redirect:/logout");
			mv.addObject("session", "Expired");
			return mv;
		}

		List<TaskMaster> exist = tmService.selectAllExceptId(tm.getId());
		for (TaskMaster t : exist) {
			if (t.getTask_name().replaceAll("\\s", "").equalsIgnoreCase(tm.getTask_name().replaceAll("\\s", ""))) {
				mv.setViewName("TaskMaster");
				mv.addObject("pagedListHolder", mainController.pagination(tmService.selectAll(), request));
				mv.addObject("editError", "error");
				mv.addObject("editExist", "exist");
				return mv;
			}
		}
		tmService.updateTaskMaster(tm.getId(),tm.getTask_name(),tm.getDescription(),tm.isInn()?1:0);

		mv.setViewName("redirect:/GetTaskMaster");
		mv.addObject("updated", "success");
		return mv;
	}

	@PostMapping("DeleteTask")
	public ModelAndView deleteTask(@RequestParam("id") int id, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("id") == null) {
			mv.setViewName("TaskMaster");
			mv.addObject("session", "Expired");
			return mv;
		}
		tmService.updateInnZero(id);
		mv.setViewName("redirect:/GetTaskMaster");
		mv.addObject("deleted", "success");
		return mv;
	}
	
	@GetMapping("GetTaskMapping")
	public ModelAndView getTaskMapping(HttpSession session,HttpServletRequest request,
			@RequestParam(value="added", required=false) String added,
			@RequestParam(value="active", required=false) String active,
			@RequestParam(value="inactive", required=false) String inactive) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("id") == null) {
			mv.setViewName("redirect:/logout");
			mv.addObject("session", "Expired");
			return mv;
		}
		
		if(added != null)
			mv.addObject("added", "Success");
		if(active != null)
			mv.addObject("active", "Success");
		if(inactive != null)
			mv.addObject("inactive", "Success");
		
		mv.setViewName("TaskMapping");
		mv.addObject("TaskMapping", new TaskMappingValidation());
		mv.addObject("userList", userService.selectAllUsers());
		mv.addObject("taskList", tmService.selectAll());
		mv.addObject("pagedListHolder", mainController.pagination(tamService.selectAll(), request));
		return mv;
	}
	
	@PostMapping("SaveTaskMapping")
	public ModelAndView saveTaskMapping(@Valid @ModelAttribute("TaskMapping") TaskMappingValidation tsk,
			BindingResult result,HttpSession session,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		if(session.getAttribute("id") == null) {
			mv.setViewName("redirect:/logout");
			mv.addObject("session", "Expired");
			return mv;
		}
		
		if(result.hasErrors()) {
			mv.setViewName("TaskMapping");
			mv.addObject("addError", "Error");
			mv.addObject("userList", userService.selectAllUsers());
			mv.addObject("taskList", tmService.selectAll());
			mv.addObject("pagedListHolder", mainController.pagination(tamService.selectAll(), request));
			return mv;
		}
		
		for (int i = 0; i < tsk.getUser_ref().size(); i++) {
			List<TaskMapping> existTask = tamService.selectAll();
			for (TaskMapping t : existTask) {
				if ( (t.getUser_ref().getUser_id() == tsk.getUser_ref().get(i)) && (t.getTask().getId() == tsk.getTask()) ) {
					mv.setViewName("TaskMapping");
					mv.addObject("addError", "Error");
					mv.addObject("addExist", t.getUser_ref().getName());
					mv.addObject("userList", userService.selectAllUsers());
					mv.addObject("taskList", tmService.selectAll());
					mv.addObject("pagedListHolder", mainController.pagination(tamService.selectAll(), request));
					return mv;
				}
			}
		}
		
		int userID = (int) session.getAttribute("id");
		
		for(int i = 0; i < tsk.getUser_ref().size(); i++) {
			List<Users> userList = userService.selectAllUsers();
			for(Users u : userList) {
				if(u.getUser_id() == tsk.getUser_ref().get(i)) {
					
					TaskMapping tm = new TaskMapping();
					
					tm.setUser_ref(userService.selectById(tsk.getUser_ref().get(i)));
					tm.setTask(tmService.selectById(tsk.getTask()));
					tm.setDeadline(tsk.getDeadline());
					tm.setExtended_deadline(tsk.getExtended_deadline());
					tm.setReminder(tsk.getReminder());
					tm.setExtension_description(tsk.getExtension_description());
					tm.setCompletion_date(tsk.getCompletion_date());
					tm.setCompletion_description(tsk.getCompletion_description());
					tm.setCompletion_status(tsk.getCompletion_status());
					tm.setScore(tsk.getScore());
					tm.setInn(tsk.isInn()?1:0);
					
					tamService.saveTaskMapping(tm);
					
					LocalDateTime myDateObj = LocalDateTime.now();
				    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
				    String formattedDate = myDateObj.format(myFormatObj);
					
					Notifications n = new Notifications();
					n.setUser_ref(userService.selectById(tsk.getUser_ref().get(i)));
					n.setTask(tamService.selectById(tsk.getTask()));
					n.setCreated_by(userID);
					n.setCreated_for("user");
					n.setCreated_date_time(formattedDate);
					n.setNotification_type("Task Assignment");
					n.setIs_viewed(0);
					n.setViewed_date_time(formattedDate);
					n.setInn(1);
					
					notifyService.saveNotifications(n);
					
					//mailService.sendTaskDetails(tm);
				}
			}
		}
		
		mv.setViewName("redirect:/GetTaskMapping");
		mv.addObject("added", "Success");
		return mv;
	}
	
	@GetMapping("changeStatusInTaskMapping")
	public ModelAndView changeCSDStatus(@RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView();

		TaskMapping tm = tamService.selectById(id);

		if (tm.getInn() == 1) {
			tamService.updateInn(id, 0);
			mv.setViewName("redirect:/GetTaskMapping");
			mv.addObject("inactive", "Success");
		}
		if (tm.getInn() == 0) {
			tamService.updateInn(id, 1);
			mv.setViewName("redirect:/GetTaskMapping");
			mv.addObject("active", "Success");
		}
		return mv;
	}
	
	@GetMapping("GetViewTaskMapping")
	public ModelAndView getViewTaskMapping(HttpSession session,HttpServletRequest request,
			@RequestParam(value="DateExtended", required=false) String DateExtended,
			@RequestParam(value="TaskReportValidated", required=false) String TaskReportValidated) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("id") == null) {
			mv.setViewName("redirect:/logout");
			mv.addObject("session", "Expired");
			return mv;
		}
		
		if(DateExtended != null)
			mv.addObject("DateExtended", "Success");
		if(TaskReportValidated != null)
			mv.addObject("TaskReportValidated", "Success");
		
		mv.setViewName("ViewTaskMapping");
		mv.addObject("UserList", userService.selectAllUsers());
		mv.addObject("TMList", tamService.selectAll());
		mv.addObject("pagedListHolder", mainController.pagination(tamService.selectAll(), request));
		return mv;
	}
	
	@PostMapping("RespondExtension")
	public ModelAndView respondExtension(HttpSession session, HttpServletRequest request,TaskMappingValidation tm) {
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("id") == null) {
			mv.setViewName("redirect:/logout");
			mv.addObject("session", "Expired");
			return mv;
		}
		
		int userID = (int) session.getAttribute("id");
		
		tamService.extendDeadline(tm.getId(),tm.getExtended_deadline(),tm.getReminder()+1);
		
		LocalDateTime myDateObj = LocalDateTime.now();
	    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	    String formattedDate = myDateObj.format(myFormatObj);
		
		Notifications n = new Notifications();
		n.setUser_ref(userService.selectById(tm.getUser_ref().get(0)));
		n.setTask(tamService.selectById(tm.getId()));
		n.setCreated_by(userID);
		n.setCreated_for("user");
		n.setCreated_date_time(formattedDate);
		n.setNotification_type("Deadline Extended");
		n.setIs_viewed(0);
		n.setViewed_date_time(formattedDate);
		n.setInn(1);
		
		notifyService.saveNotifications(n);
		
		mv.setViewName("redirect:/GetViewTaskMapping");
		mv.addObject("DateExtended", "Success");
		return mv;
	}
	
	@PostMapping("ValidateResponse")
	public ModelAndView validateResponse(HttpSession session, HttpServletRequest request,TaskMappingValidation tmv) {
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("id") == null) {
			mv.setViewName("redirect:/logout");
			mv.addObject("session", "Expired");
			return mv;
		}
		
		tamService.validateResponse(tmv.getId(),1,tmv.getScore());
		
		mv.setViewName("redirect:/GetViewTaskMapping");
		mv.addObject("TaskReportValidated", "Success");
		return mv;
	}
	
	@GetMapping("GetUserTasks")
	public ModelAndView getUserTasks(HttpSession session,HttpServletRequest request,
			@RequestParam(value="extended", required=false) String extended,
			@RequestParam(value="response", required=false) String response) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("id") == null) {
			mv.setViewName("redirect:/logout");
			mv.addObject("session", "Expired");
			return mv;
		}
		
		if(extended != null)
			mv.addObject("extended", "Success");
		if(response != null)
			mv.addObject("response", "Success");
		
		int user = (int) session.getAttribute("id");
		mv.setViewName("ViewUsersTasks");
		mv.addObject("pagedListHolder", mainController.pagination(tamService.selectAllTasksByUserID(user), request));
		return mv;
	}
	
	@PostMapping("RequestExtension")
	public ModelAndView saveExtension(HttpSession session, HttpServletRequest request,TaskMappingValidation tm) {
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("id") == null) {
			mv.setViewName("redirect:/logout");
			mv.addObject("session", "Expired");
			return mv;
		}		
		
		int userID = (int) session.getAttribute("id");
		
		tamService.requestExtension(tm.getId(),tm.getExtension_description());
		
		LocalDateTime myDateObj = LocalDateTime.now();
	    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	    String formattedDate = myDateObj.format(myFormatObj);
		
		Notifications n = new Notifications();
		n.setUser_ref(userService.selectById(tm.getUser_ref().get(0)));
		n.setTask(tamService.selectById(tm.getId()));
		n.setCreated_by(userID);
		n.setCreated_for("admin");
		n.setCreated_date_time(formattedDate);
		n.setNotification_type("Extension Request");
		n.setIs_viewed(0);
		n.setViewed_date_time(formattedDate);
		n.setInn(1);
		
		notifyService.saveNotifications(n);
		
		mv.setViewName("redirect:/GetUserTasks");
		mv.addObject("extended", "Success");
		return mv;
	}
	
	@PostMapping("SaveResponse")
	public ModelAndView saveResponse(HttpSession session, HttpServletRequest request,TaskMappingValidation tm) {
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("id") == null) {
			mv.setViewName("redirect:/logout");
			mv.addObject("session", "Expired");
			return mv;
		}
		
		int userID = (int) session.getAttribute("id");
		
		tamService.updateResponse(tm.getId(),tm.getCompletion_date(),tm.getCompletion_description());
		
		LocalDateTime myDateObj = LocalDateTime.now();
	    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	    String formattedDate = myDateObj.format(myFormatObj);
		
		Notifications n = new Notifications();
		n.setUser_ref(userService.selectById(tm.getUser_ref().get(0)));
		n.setTask(tamService.selectById(tm.getId()));
		n.setCreated_by(userID);
		n.setCreated_for("admin");
		n.setCreated_date_time(formattedDate);
		n.setNotification_type("Task Report Submission");
		n.setIs_viewed(0);
		n.setViewed_date_time(formattedDate);
		n.setInn(1);
		
		notifyService.saveNotifications(n);
		
		mv.setViewName("redirect:/GetUserTasks");
		mv.addObject("response", "Success");
		return mv;
	}
	
	@GetMapping("GetAdminNotifications")
	public ModelAndView GetAdminNotifications(HttpSession session,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("id") == null) {
			mv.setViewName("redirect:/logout");
			mv.addObject("session", "Expired");
			return mv;
		}
		
		mv.setViewName("AdminNotifications");
		mv.addObject("myNotifications", notifyService.selectAll());
		return mv;
	}
	
	@GetMapping("GetUserNotifications")
	public ModelAndView getNotifications(HttpSession session,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("id") == null) {
			mv.setViewName("redirect:/logout");
			mv.addObject("session", "Expired");
			return mv;
		}
		
		int user = (int) session.getAttribute("id");
		
		mv.setViewName("UserNotifications");
		mv.addObject("myNotifications", notifyService.selectAllNotificationsByUserId(user));
		return mv;
	}
	
	@GetMapping("GetAdminReports")
	public ModelAndView getAdminReports(HttpSession session,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("id") == null) {
			mv.setViewName("redirect:/logout");
			mv.addObject("session", "Expired");
			return mv;
		}
		
		mv.setViewName("AdminReports");
		return mv;
	}
	
	@GetMapping("GetUserReports")
	public ModelAndView getUserReports(HttpSession session,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("id") == null) {
			mv.setViewName("redirect:/logout");
			mv.addObject("session", "Expired");
			return mv;
		}
		
		mv.setViewName("UserReports");
		return mv;
	}
}