package com.project.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.model.Bloodgroup;
import com.project.model.CSDMapping;
import com.project.model.Community;
import com.project.model.Country;
import com.project.model.Designation;
import com.project.model.District;
import com.project.model.Language;
import com.project.model.Notifications;
import com.project.model.Personal;
import com.project.model.Religion;
import com.project.model.State;
import com.project.model.TaskMapping;
import com.project.model.TaskMaster;
import com.project.model.Users;
import com.project.service.BloodgroupService;
import com.project.service.CSDService;
import com.project.service.CommunityService;
import com.project.service.CountryService;
import com.project.service.DesignationService;
import com.project.service.DistrictService;
import com.project.service.LanguageService;
import com.project.service.NotificationsService;
import com.project.service.PersonalService;
import com.project.service.ReligionService;
import com.project.service.StateService;
import com.project.service.TaskMappingService;
import com.project.service.TaskMasterService;
import com.project.service.UserService;

@RestController
@RequestMapping("api")
public class ApiController {

	@Autowired
	UserService userService;
	
	@Autowired
	DesignationService desService;
	
	@Autowired
	CommunityService communityService;
	
	@Autowired
	StateService stateService;

	@Autowired
	CountryService countryService;

	@Autowired
	ReligionService religionService;
	
	@Autowired
	DistrictService districtService;

	@Autowired
	LanguageService languageService;
	
	@Autowired
	BloodgroupService bloodService;

	@Autowired
	CSDService csdService;
	
	@Autowired
	TaskMasterService tmService;
	
	@Autowired
	TaskMappingService tamService;
	
	@Autowired
	NotificationsService notifyService;
	
	@Autowired
	PersonalService pslService;
	
	@GetMapping("/getAllUsers")
	public List<Users> getAllUsers(){
		return userService.selectAllUsers();
	}
	
	@GetMapping("/getAllAdmin")
	public List<Users> getAllAdmin(){
		return userService.selectAllAdministrators();
	}
	
	@GetMapping("/getAllCountry")
	public List<Country> getAllCountry(){
		return countryService.selectAll();
	}
	
	@GetMapping("/getAllState")
	public List<State> getAllState(){
		return stateService.selectAll();
	}
	
	@GetMapping("/getAllDistrict")
	public List<District> getAllDistrict(){
		return districtService.selectAll();
	}
	
	@GetMapping("/getAllDesignation")
	public List<Designation> getAllDesignation(){
		return desService.selectAll();
	}
	
	@GetMapping("/getAllBlood")
	public List<Bloodgroup> getAllBlood(){
		return bloodService.selectAll();
	}
	
	@GetMapping("/getAllLanguage")
	public List<Language> getAllLanguage(){
		return languageService.selectAll();
	}
	
	@GetMapping("/getAllReligion")
	public List<Religion> getAllReligion(){
		return religionService.selectAll();
	}
	
	@GetMapping("/getAllCommunity")
	public List<Community> getAllCommunity(){
		return communityService.selectAll();
	}
	
	@GetMapping("/getAllCSD")
	public List<CSDMapping> getAllCSD(){
		return csdService.selectAll();
	}
	
	@GetMapping("getAllStateByCountryId/{id}")
	public List<CSDMapping> getAllStateByCountry(@PathVariable("id")int id){
		return csdService.selectAllStateByCountryId(id);
	}
	
	@GetMapping("getAllDistrictByStateId/{countryId}/{stateId}")
	public List<CSDMapping> getAllDistrictByState(@PathVariable("stateId")int stateid,@PathVariable("countryId")int countryid){
		return csdService.selectAllDistrictByStateId(countryid,stateid);
	}	
	
	@GetMapping("/getAllTask")
	public List<TaskMaster> getAllTask(){
		return tmService.selectAll();
	}
	
	@GetMapping("/getAllTaskMapping")
	public List<TaskMapping> getAllTaskMapping(){
		return tamService.selectAll();
	}
	
	@GetMapping("/getAllTaskByUserId/{id}")
	public List<TaskMapping> getAllTaskByUserId(@PathVariable("id")int id){
		return tamService.selectAllTasksByUserID(id);
	}
	
	@GetMapping("/getAllNotificationsByUserId/{user}")
	public List<Notifications> getAllNotificationsByUserId(@PathVariable("user")int user){
		return notifyService.selectAllNotificationsByUserId(user);
	}
	
	@PostMapping("/update_is_viewed/{id}")
	public void updateIsViewedNotifications(@PathVariable("id")int id) {
		
		LocalDateTime myDateObj = LocalDateTime.now();
		DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String formattedDate = myDateObj.format(myFormatObj);
		
		notifyService.updateIsViewed(id,formattedDate);
	}
	
	@GetMapping("/getAdminNotificationsCount")
	public List<Notifications> getAdminNotificationsCount(){
		return notifyService.selectAdminNotificationCount();
	}
	
	@GetMapping("/getUserNotificationsCount")
	public List<Notifications> getUserNotificationsCount() {
		return notifyService.selectUserNotificationCount();
	}
	
	@GetMapping("/getUserImageByUserID/{user}")
	public List<Personal> getUserImageByUserID(@PathVariable("user") int user) {
		return pslService.selectUserImageByUserID(user);
	}
	 
}