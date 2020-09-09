package com.project.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Paths;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.config.PasswordEncryptionDecryption;
import com.project.config.PasswordGenerator;
import com.project.config.ResourceConfig;
import com.project.customvalidator.ChangePassword;
import com.project.customvalidator.CollegeValidation;
import com.project.customvalidator.ContactValidation;
import com.project.customvalidator.PersonalValidation;
import com.project.customvalidator.SchoolValidation;
import com.project.customvalidator.SignUp;
import com.project.model.College;
import com.project.model.Contact;
import com.project.model.Personal;
import com.project.model.School;
import com.project.model.Users;
import com.project.service.BloodgroupService;
import com.project.service.CollegeService;
import com.project.service.CommunityService;
import com.project.service.ContactService;
import com.project.service.CountryService;
import com.project.service.DesignationService;
import com.project.service.DistrictService;
import com.project.service.LanguageService;
import com.project.service.MailService;
import com.project.service.PersonalService;
import com.project.service.ReligionService;
import com.project.service.SchoolService;
import com.project.service.StateService;
import com.project.service.UserService;

@Controller
public class UserController {

	int otp;
	Users userLoc;

	@Autowired
	UserService userService;

	@Autowired
	MailService mailService;

	@Autowired
	MainController mainController;
	
	@Autowired
	PasswordGenerator pwdGen;
	
	@Autowired
	PasswordEncryptionDecryption pwdEncDcy;
	
	@Autowired
	DesignationService designationService;
	
	@Autowired
	BloodgroupService bloodgroupService;
	
	@Autowired
	CommunityService communityService;
	
	@Autowired
	CountryService countryService;
	
	@Autowired
	DistrictService districtService;
	
	@Autowired
	LanguageService languageService;
	
	@Autowired
	ReligionService religionService;
	
	@Autowired
	StateService stateService;
		
	@Autowired
	PersonalService pslService;
	
	@Autowired
	SchoolService sclService;
	
	@Autowired
	CollegeService clgService;
	
	@Autowired
	ContactService conService;
	
	@GetMapping("SignUp")
	public ModelAndView getSignup(HttpSession session,HttpServletRequest request,
			@RequestParam(value = "added", required = false) String added,
			@RequestParam(value = "updated", required = false) String updated,
			@RequestParam(value = "deleted", required = false) String deleted) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("id") == null) {
			mv.setViewName("redirect:/logout");
			mv.addObject("session", "Session Expired");
			return mv;
		}
		if (!(added == null))
			mv.addObject("added", "success");
		if (!(updated == null))
			mv.addObject("updated", "success");
		if (!(deleted == null))
			mv.addObject("deleted", "success");
		
		mv.setViewName("SignUp");
		//mv.addObject("pagedListHolder", mainController.pagination(userService.selectAllUser(), request));
		mv.addObject("pagedListHolder1", mainController.pagination(userService.selectAllAdministrators(), request));
		mv.addObject("pagedListHolder2", mainController.pagination(userService.selectAllUsers(), request));
		mv.addObject("signup", new SignUp());
		return mv;
	}

	@PostMapping("CreateUser")
	public ModelAndView createUser(@Valid @ModelAttribute("signup") SignUp signup, 
			BindingResult result,HttpSession session,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("id") == null) {
			mv.setViewName("redirect:/logout");
			mv.addObject("session", "Session Expired");
			return mv;
		}
		if (result.hasErrors()) {
			mv.setViewName("SignUp");
			mv.addObject("pagedListHolder", mainController.pagination(userService.selectAllUser(), request));
			mv.addObject("addError", "Error");
			return mv;
		}
		Users user = new Users();

		user.setRole(signup.getRole());
		user.setName(signup.getName());
		user.setEmail(signup.getEmail());
		user.setUsername(signup.getUsername());
		user.setPassword(pwdEncDcy.encrypt(pwdGen.generateRandomPassword(15)));
		
		userLoc = user;

		Users userExist1 = userService.findByEmail(user.getEmail());
		Users userExist2 = userService.findByUsername(user.getUsername());

		if (!(userExist1 == null)) {
			mv.setViewName("SignUp");
			mv.addObject("pagedListHolder", mainController.pagination(userService.selectAllUser(), request));
			mv.addObject("addEmailExist", "Email id already registerd. Please try Another Email id...");
			mv.addObject("addError", "Error");
		} else if (!(userExist2 == null)) {
			mv.setViewName("SignUp");
			mv.addObject("pagedListHolder", mainController.pagination(userService.selectAllUser(), request));
			mv.addObject("addUsernameExist", "Username already registerd. Please try Another Name...");
			mv.addObject("addError", "Error");
		} else {
			Users uu = new Users();
			uu.setPersonal_status(0);
			
			userService.createUser(
					signup.getRole().toLowerCase(),
					signup.getName().toLowerCase(),
					signup.getEmail().toLowerCase(),
					signup.getUsername().toLowerCase(),
					user.getPassword(),
					uu.getPersonal_status(),
					signup.isInn());
			//mailService.sendDetails(userLoc);
			
			mv.setViewName("redirect:/SignUp");
			mv.addObject("added", "success");
		}
		return mv;
	}
	
	@PostMapping("EditUser")
	public ModelAndView editUser(@Valid @ModelAttribute("signup") SignUp signup, 
			BindingResult result,HttpSession session,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("id") == null) {
			mv.setViewName("redirect:/logout");
			mv.addObject("session", "Session Expired");
			return mv;
		}
		if (result.hasErrors()) {
			mv.setViewName("SignUp");
			mv.addObject("pagedListHolder", mainController.pagination(userService.selectAllUser(), request));
			mv.addObject("editError", "Error");
			return mv;
		}
		
		List<Users> exist = userService.selectAllExceptId(signup.getUser_id());

		for(Users u : exist) {
			if (u.getEmail().equalsIgnoreCase(signup.getEmail())) {
				mv.setViewName("SignUp");
				mv.addObject("pagedListHolder", mainController.pagination(userService.selectAllUser(), request));
				mv.addObject("editError", "Error");
				mv.addObject("editEmailExist", "Email id already registerd. Please try Another Email id...");
			} else if (u.getUsername().equalsIgnoreCase(signup.getUsername())) {
				mv.setViewName("SignUp");
				mv.addObject("pagedListHolder", mainController.pagination(userService.selectAllUser(), request));
				mv.addObject("editError", "Error");
				mv.addObject("editUsernameExist", "Username already registerd. Please try Another Name...");
			}
		}

		userService.updateUser(signup.getUser_id(),signup.getRole().toLowerCase(),signup.getName().toLowerCase(),signup.getEmail().toLowerCase(),signup.getUsername(),pwdEncDcy.encrypt(signup.getPassword()),signup.isInn());
		
		mv.setViewName("redirect:/SignUp");
		mv.addObject("updated", "success");
		return mv;
	}
	
	@PostMapping("DeleteUser")
	public ModelAndView deleteuser(@RequestParam("user_id") int id, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("id") == null) {
			mv.setViewName("redirect:/logout");
			mv.addObject("session", "Expired");
			return mv;
		}
		
		userService.updateInnZero(id, 0);
		
		mv.setViewName("redirect:/SignUp");
		mv.addObject("deleted", "success");
		return mv;
	}
	
	@GetMapping("ChangePassword")
	public ModelAndView getChangePassword(HttpSession session,
			@RequestParam(value = "updated", required = false) String updated) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("id") == null) {
			mv.setViewName("redirect:/logout");
			mv.addObject("session", "Expired");
			return mv;
		}
		if (!(updated == null))
			mv.addObject("updated", "Success");

		mv.setViewName("ChangePassword");
		mv.addObject("changePassword", new ChangePassword());
		return mv;
	}

	@PostMapping("UpdatePassword")
	public ModelAndView updatePassword(@Valid @ModelAttribute("changePassword") ChangePassword changePassword,BindingResult result, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("id") == null) {
			mv.setViewName("redirect:/logout");
			mv.addObject("session", "Expired");
			return mv;
		}
		if (result.hasErrors()) {
			mv.setViewName("ChangePassword");
			return mv;
		}
	
		if(!(changePassword.getNew_pwd().equals(changePassword.getConfirm_pwd()))) {
			mv.setViewName("ChangePassword");
			mv.addObject("passwordMismatch", "Error");
			return mv;
		}
		
		userService.updatePassword(pwdEncDcy.encrypt(changePassword.getNew_pwd()),changePassword.getId());
		
		mv.setViewName("redirect:/ChangePassword");
		mv.addObject("updated", "Success");
		return mv;
	}
	
	@GetMapping("GetProfile")
	public ModelAndView getProfile(HttpSession session,HttpServletRequest request,
			@RequestParam(value="Personal", required=false) String Personal,
			@RequestParam(value="School", required=false) String School,
			@RequestParam(value="College", required=false) String College,
			@RequestParam(value="Contact", required=false) String Contact,
			@RequestParam(value="ProfileUpdate", required=false)String ProfileUpdate,
			@RequestParam(value="SchoolUpdate", required=false)String SchoolUpdate,
			@RequestParam(value="CollegeUpdate", required=false)String CollegeUpdate,
			@RequestParam(value="ContactUpdate", required=false)String ContactUpdate) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("id") == null) {
			mv.setViewName("redirect:/logout");
			mv.addObject("session", "Expired");
			return mv;
		}
		if(Personal != null)
			mv.addObject("Personal", "Success");
		if(School != null)
			mv.addObject("School", "Success");
		if(College != null)
			mv.addObject("College", "Success");
		if(Contact != null)
			mv.addObject("Contact", "Success");
		if(ProfileUpdate != null)
			mv.addObject("ProfileUpdate", "Success");
		if(SchoolUpdate != null)
			mv.addObject("SchoolUpdate", "Success");
		if(CollegeUpdate != null)
			mv.addObject("CollegeUpdate", "Success");
		if(ContactUpdate != null)
			mv.addObject("ContactUpdate", "Success");
		
		int user = (int) session.getAttribute("id");
		
		mv.setViewName("Profile");
		mv.addObject("personal", new PersonalValidation());
		mv.addObject("school", new SchoolValidation());
		mv.addObject("college", new CollegeValidation());
		mv.addObject("contact", new ContactValidation());
		mv.addObject("user", userService.selectById(user));
		mv.addObject("pv", pslService.selectByUserId(user));
		mv.addObject("sv", sclService.selectAll());
		mv.addObject("cv", clgService.selectAll());
		mv.addObject("con", conService.selectAll());
		return mv;
	}
	
	@PostMapping("SavePersonal")
	public ModelAndView savePersonal(@Valid @ModelAttribute("personal") PersonalValidation psl,BindingResult result,
			HttpSession session,HttpServletRequest request,
			@RequestParam("image") MultipartFile image,
			@ModelAttribute("school") SchoolValidation sch,
			@ModelAttribute("college") CollegeValidation clg,
			@ModelAttribute("contact") ContactValidation con) throws IOException {
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("id") == null) {
			mv.setViewName("redirect:/logout");
			mv.addObject("session", "Expired");
			return mv;
		}
		
		int user_id = (int) session.getAttribute("id");
		
		if(result.hasErrors()) {
			mv.setViewName("Profile");
			mv.addObject("user", userService.selectById(user_id));
			return mv;
		}
		
		String fileName = image.getOriginalFilename();
		String filePath = Paths.get(ResourceConfig.uploadDirectory, fileName).toString();
		String fileType = image.getContentType();
		long size = image.getSize();
		String fileSize = String.valueOf(size);
		
		BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(filePath)));
		stream.write(image.getBytes());
		stream.close();
		
		Personal ps = new Personal();
		
		ps.setUser_ref(userService.selectById(psl.getUser_ref()));
		ps.setDesignation(designationService.selectById(psl.getDesignation()));
		ps.setEmail(psl.getEmail());
		ps.setMobile(psl.getMobile());
		ps.setGender(psl.getGender());
		ps.setDob(psl.getDob());
		ps.setPlace_of_birth(psl.getPlace_of_birth());
		ps.setBlood_group(bloodgroupService.selectById(psl.getBlood_group()));
		ps.setMother_tongue(languageService.selectById(psl.getMother_tongue()));
		ps.setNationality(countryService.selectById(psl.getNationality()));
		ps.setReligion(religionService.selectById(psl.getReligion()));
		ps.setCategory(communityService.selectById(psl.getCategory()));
		ps.setImage_name(fileName);
		ps.setImage_path(filePath);
		ps.setImage_size(fileSize);
		ps.setImage_type(fileType);
		ps.setInn(psl.isInn()?1:0);
		
		pslService.savePersonal(ps);
		userService.updatePersonalStatus(user_id, 1);
		
		mv.setViewName("redirect:/GetProfile");
		mv.addObject("Personal", "Success");
		return mv;
	}
	
	@GetMapping("EditProfile")
	public ModelAndView editProfile(HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("id") == null) {
			mv.setViewName("redirect:/logout");
			mv.addObject("session", "Expired");
			return mv;
		}
		
		int user = (int) session.getAttribute("id");
		
		mv.setViewName("UpdateProfile");
		mv.addObject("personal", new PersonalValidation());
		mv.addObject("pv", pslService.selectByUserId(user));
		return mv;
	}
	
	@PostMapping("UpdateProfile")
	public ModelAndView updateProfile(@Valid @ModelAttribute("personal") PersonalValidation psl, BindingResult result,
			HttpSession session, HttpServletRequest request,@RequestParam("image") MultipartFile image) throws IOException {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("id") == null) {
			mv.setViewName("redirect:/logout");
			mv.addObject("session", "Expired");
			return mv;
		}
		
		int user = (int) session.getAttribute("id");
		
		if(result.hasErrors()) {
			mv.setViewName("UpdateProfile");
			mv.addObject("pv", pslService.selectByUserId(user));
			return mv;
		}
		
		String fileName = image.getOriginalFilename();
		String filePath = Paths.get(ResourceConfig.uploadDirectory, fileName).toString();
		String fileType = image.getContentType();
		long size = image.getSize();
		String fileSize = String.valueOf(size);
		
		BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(filePath)));
		stream.write(image.getBytes());
		stream.close();
		
		Personal ps = new Personal();
		
		ps.setImage_name(fileName);
		ps.setImage_path(filePath);
		ps.setImage_size(fileSize);
		ps.setImage_type(fileType);
		
		pslService.updatePersonal(
				psl.getId(), 
				designationService.selectById(psl.getDesignation()),
				psl.getMobile(),
				psl.getGender(), 
				psl.getDob(), 
				bloodgroupService.selectById(psl.getBlood_group()), 
				languageService.selectById(psl.getMother_tongue()), 
				psl.getPlace_of_birth(), 
				countryService.selectById(psl.getNationality()), 
				religionService.selectById(psl.getReligion()), 
				communityService.selectById(psl.getCategory()),
				ps.getImage_name(),
				ps.getImage_path(),
				ps.getImage_size(),
				ps.getImage_type() );
		
		mv.setViewName("redirect:/GetProfile");
		mv.addObject("ProfileUpdate", "Success");
		return mv;	
	}
	
	@PostMapping("SaveSchool")
	public ModelAndView saveSchool(@Valid @ModelAttribute("school") SchoolValidation sch,BindingResult result,
			HttpSession session,HttpServletRequest request,
			@ModelAttribute("personal") PersonalValidation psl,
			@ModelAttribute("college") CollegeValidation clg,
			@ModelAttribute("contact") ContactValidation con) {
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("id") == null) {
			mv.setViewName("redirect:/logout");
			mv.addObject("session", "Expired");
			return mv;
		}
		int user = (int) session.getAttribute("id");		
		if(result.hasErrors()) {
			mv.setViewName("Profile");
			mv.addObject("user", userService.selectById(user));
			mv.addObject("pv", pslService.selectByUserId(user));
			mv.addObject("sv", sclService.selectAll());
			mv.addObject("cv", clgService.selectAll());
			mv.addObject("con", conService.selectAll());
			mv.addObject("schoolAddError", "Error");
			return mv;
		}
		
		List<School> exist = sclService.selectAll();
		
		for(School s : exist) {
			if(s.getUser_ref().getUser_id() == user) {
				if(s.getSchool_category().equalsIgnoreCase(sch.getSchool_category())) {
					mv.setViewName("Profile");
					mv.addObject("user", userService.selectById(user));
					mv.addObject("pv", pslService.selectByUserId(user));
					mv.addObject("sv", sclService.selectAll());
					mv.addObject("cv", clgService.selectAll());
					mv.addObject("con", conService.selectAll());
					mv.addObject("schoolAddError", "Error");
					mv.addObject("schoolAddExist", "Error");
					return mv;
				}
			}
		}
		
		School scl = new School();
		scl.setUser_ref(userService.selectById(sch.getUser_ref()));
		scl.setSchool_category(sch.getSchool_category());
		scl.setSchool_name(sch.getSchool_name());
		scl.setBoard(sch.getBoard());
		scl.setMarks(Integer.parseInt(sch.getMarks()));
		scl.setPercentage(Double.parseDouble(sch.getPercentage()));
		scl.setInn(sch.isInn()?1:0);
		
		sclService.saveSchool(scl);
		
		mv.setViewName("redirect:/GetProfile");
		mv.addObject("School", "Success");
		return mv;
	}
	
	@PostMapping("EditSchool")
	public ModelAndView editSchool(@Valid @ModelAttribute("school") SchoolValidation school, BindingResult result,
			HttpSession session, HttpServletRequest request,
			@ModelAttribute("personal") PersonalValidation psl,
			@ModelAttribute("college") CollegeValidation clg,
			@ModelAttribute("contact") ContactValidation con) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("id") == null) {
			mv.setViewName("redirect:/logout");
			mv.addObject("session", "Expired");
			return mv;
		}
		int user = (int) session.getAttribute("id");
		if (result.hasErrors()) {
			mv.setViewName("Profile");
			mv.addObject("user", userService.selectById(user));
			mv.addObject("pv", pslService.selectByUserId(user));
			mv.addObject("sv", sclService.selectAll());
			mv.addObject("cv", clgService.selectAll());
			mv.addObject("con", conService.selectAll());
			mv.addObject("schoolEditError", "error");
			return mv;
		}
		
		sclService.update(school.getId(), school.getSchool_name(), school.getBoard(), Integer.parseInt(school.getMarks()), Double.parseDouble(school.getPercentage()), school.isInn());

		mv.setViewName("redirect:/GetProfile");
		mv.addObject("SchoolUpdate", "success");
		return mv;
	}
	
	@PostMapping("SaveCollege")
	public ModelAndView saveCollege(@Valid @ModelAttribute("college") CollegeValidation clg,BindingResult result,
			HttpSession session,HttpServletRequest request,
			@ModelAttribute("school") SchoolValidation sch,
			@ModelAttribute("personal") PersonalValidation psl,
			@ModelAttribute("contact") ContactValidation con) {
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("id") == null) {
			mv.setViewName("redirect:/logout");
			mv.addObject("session", "Expired");
			return mv;
		}
		int user = (int) session.getAttribute("id");
		if(result.hasErrors()) {
			mv.setViewName("Profile");
			mv.addObject("user", userService.selectById(user));
			mv.addObject("pv", pslService.selectByUserId(user));
			mv.addObject("sv", sclService.selectAll());
			mv.addObject("cv", clgService.selectAll());
			mv.addObject("con", conService.selectAll());
			mv.addObject("collegeAddError", "Error");
			return mv;
		}
		
		List<College> exist = clgService.selectAll();
		
		for(College c : exist) {
			if(c.getUser_ref().getUser_id() == user) {
				if(c.getCollege_category().equalsIgnoreCase(clg.getCollege_category())) {
					mv.setViewName("Profile");
					mv.addObject("user", userService.selectById(user));
					mv.addObject("pv", pslService.selectByUserId(user));
					mv.addObject("sv", sclService.selectAll());
					mv.addObject("cv", clgService.selectAll());
					mv.addObject("con", conService.selectAll());
					mv.addObject("collegeAddError", "Error");
					mv.addObject("collegeAddExist", "Error");
					return mv;
				}
			}
		}
		
		College cl = new College();
		cl.setUser_ref(userService.selectById(clg.getUser_ref()));
		cl.setCollege_category(clg.getCollege_category());
		cl.setClg_name(clg.getClg_name());
		cl.setCourse(clg.getCourse());
		cl.setUniversity(clg.getUniversity());
		cl.setCgpa(Double.parseDouble(clg.getCgpa()));
		cl.setInn(clg.isInn()?1:0);
		
		clgService.saveCollege(cl);
		
		mv.setViewName("redirect:/GetProfile");
		mv.addObject("College", "Success");
		return mv;
	}
	
	@PostMapping("EditCollege")
	public ModelAndView editCollege(@Valid @ModelAttribute("college") CollegeValidation college, BindingResult result,
			HttpSession session, HttpServletRequest request,
			@ModelAttribute("school") SchoolValidation sch,
			@ModelAttribute("personal") PersonalValidation psl,
			@ModelAttribute("contact") ContactValidation con) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("id") == null) {
			mv.setViewName("redirect:/logout");
			mv.addObject("session", "Expired");
			return mv;
		}
		int user = (int) session.getAttribute("id");
		if (result.hasErrors()) {
			mv.setViewName("Profile");
			mv.addObject("user", userService.selectById(user));
			mv.addObject("pv", pslService.selectByUserId(user));
			mv.addObject("sv", sclService.selectAll());
			mv.addObject("cv", clgService.selectAll());
			mv.addObject("con", conService.selectAll());
			mv.addObject("collegeEditError", "error");
			return mv;
		}
		
		clgService.update(college.getId(),college.getClg_name(), college.getCourse(), college.getUniversity(), Double.parseDouble(college.getCgpa()), college.isInn());

		mv.setViewName("redirect:/GetProfile");
		mv.addObject("CollegeUpdate", "success");
		return mv;
	}

	@PostMapping("SaveContact")
	public ModelAndView saveContact(@Valid @ModelAttribute("contact") ContactValidation con,BindingResult result,
			HttpSession session,HttpServletRequest request,
			@ModelAttribute("school") SchoolValidation sch,
			@ModelAttribute("college") CollegeValidation clg,
			@ModelAttribute("personal") PersonalValidation psl) {
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("id") == null) {
			mv.setViewName("redirect:/logout");
			mv.addObject("session", "Expired");
			return mv;
		}
		int user = (int) session.getAttribute("id");
		if(result.hasErrors()) {
			mv.setViewName("Profile");
			mv.addObject("user", userService.selectById(user));
			mv.addObject("pv", pslService.selectByUserId(user));
			mv.addObject("sv", sclService.selectAll());
			mv.addObject("cv", clgService.selectAll());
			mv.addObject("con", conService.selectAll());
			mv.addObject("contactAddError", "Error");
			return mv;
		}
		
		List<Contact> exist = conService.selectAll();
		
		for(Contact c : exist) {
			if(c.getUser_ref().getUser_id() == user) {
				if(c.getContact_category().equalsIgnoreCase(con.getContact_category())) {
					mv.setViewName("Profile");
					mv.addObject("user", userService.selectById(user));
					mv.addObject("pv", pslService.selectByUserId(user));
					mv.addObject("sv", sclService.selectAll());
					mv.addObject("cv", clgService.selectAll());
					mv.addObject("con", conService.selectAll());
					mv.addObject("contactAddError", "Error");
					mv.addObject("contactAddExist", "Error");
					return mv;
				}
			}
		}
		
		Contact cn = new Contact();
		cn.setUser_ref(userService.selectById(con.getUser_ref()));
		cn.setContact_category(con.getContact_category());
		cn.setDoor_no(con.getDoor_no());
		cn.setStreet(con.getStreet());
		cn.setVillage(con.getVillage());
		cn.setCity(con.getCity());
		cn.setCountry(countryService.selectById(con.getCountry()));
		cn.setState(stateService.selectById(con.getState()));
		cn.setDistrict(districtService.selectById(con.getDistrict()));
		cn.setPincode(Integer.parseInt(con.getPincode()));
		cn.setInn(con.isInn()?1:0);
		
		conService.saveContact(cn);
		
		mv.setViewName("redirect:/GetProfile");
		mv.addObject("Contact", "Success");
		return mv;
	}
	
	
	@PostMapping("EditContact")
	public ModelAndView editContact(@Valid @ModelAttribute("contact") ContactValidation contact, BindingResult result,
			HttpSession session, HttpServletRequest request,
			@ModelAttribute("school") SchoolValidation sch,
			@ModelAttribute("college") CollegeValidation clg,
			@ModelAttribute("personal") PersonalValidation psl) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("id") == null) {
			mv.setViewName("redirect:/logout");
			mv.addObject("session", "Expired");
			return mv;
		}
		int user = (int) session.getAttribute("id");
		if (result.hasErrors()) {
			mv.setViewName("Profile");
			mv.addObject("user", userService.selectById(user));
			mv.addObject("pv", pslService.selectByUserId(user));
			mv.addObject("sv", sclService.selectAll());
			mv.addObject("cv", clgService.selectAll());
			mv.addObject("con", conService.selectAll());
			mv.addObject("contactEditError", "error");
			return mv;
		}
		conService.update(contact.getId(),contact.getDoor_no(),contact.getStreet(),contact.getVillage(),contact.getCity(),contact.getCountry(),contact.getState(),contact.getDistrict(),Integer.parseInt(contact.getPincode()),contact.isInn());

		mv.setViewName("redirect:/GetProfile");
		mv.addObject("ContactUpdate", "success");
		return mv;
	}
}