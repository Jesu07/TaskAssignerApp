package com.project.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.config.PasswordEncryptionDecryption;
import com.project.customvalidator.ChangePassword;
import com.project.customvalidator.ForgotPassword;
import com.project.customvalidator.OTP;
import com.project.customvalidator.SignIn;
import com.project.model.Users;
import com.project.service.MailService;
import com.project.service.UserService;

@Controller
public class MainController {

	@Autowired
	UserService userService;
	
	@Autowired
	MailService mailService;
	
	@Autowired
	PasswordEncryptionDecryption pwdEncDcy;
	
	Users userExist;
	int otp;
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public PagedListHolder pagination(List<?> list, HttpServletRequest request) {
		PagedListHolder pageListHolder = new PagedListHolder(list);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pageListHolder.setPage(page);
		pageListHolder.setPageSize(10);
		return pageListHolder;
	}
	
	@RequestMapping("/")
	public ModelAndView getHome() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("redirect:/SignIn");
		return mv;
	}

	@RequestMapping("SignIn")
	public ModelAndView getSignInForm(@RequestParam(value = "session", required = false) String session,
			@RequestParam(value = "updated", required = false) String updated) {
		ModelAndView mv = new ModelAndView();
		
		if (!(session == null))
			mv.addObject("session", "expired");
		if(!(updated == null))
			mv.addObject("updated", "Success");
	
//		for(int i = 1; i <= 9; i++) {
//			System.out.println("mca0" + i + " : " + pwdEncDcy.encrypt("mca0"+ i +""));
//		}
//		System.out.println("==============================");
//		for(int i = 10; i <= 15; i++) {
//			System.out.println("mca" + i + " : " + pwdEncDcy.encrypt("mca"+ i +""));
//		}
		
		mv.setViewName("SignIn");
		mv.addObject("signin", new SignIn());
		mv.addObject("forgotPassword", new ForgotPassword());
		mv.addObject("otp", new OTP());
		mv.addObject("changePassword", new ChangePassword());
		return mv;
	}
	
	@PostMapping("Login")
	public ModelAndView checkUser(@Valid @ModelAttribute("signin") SignIn signin,
			BindingResult result,HttpSession session,
			@ModelAttribute("forgotPassword") ForgotPassword forgotPasswrod,
			@ModelAttribute("otp")OTP otpObj,
			@ModelAttribute("changePassword") ChangePassword changePassword) {

		ModelAndView mv = new ModelAndView();
		if (result.hasErrors()) {
			mv.setViewName("SignIn");
			return mv;
		}
		try {
			
			Users userloc = userService.findByUsername(signin.getUsername());
			
			if (userloc.getPassword().equals(pwdEncDcy.encrypt(signin.getPassword()))) {
				
				session.setAttribute("name", userloc.getName());
				session.setAttribute("id", userloc.getUser_id());
				session.setAttribute("role", userloc.getRole());
				session.setAttribute("email", userloc.getEmail());
								
				mv.setViewName("redirect:/Home");
			} else {
				mv.setViewName("SignIn");
				mv.addObject("msg", "fail");
			}
		} catch (NullPointerException e) {
			mv.setViewName("SignIn");
			mv.addObject("msg", "fail");
		}
		return mv;
	}

	@RequestMapping("logout")
	public ModelAndView logout(@RequestParam(value = "session", required = false) String s, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (!(s == null))
			mv.addObject("session", "Expired");
		session.invalidate();
		mv.setViewName("redirect:/SignIn");
		return mv;
	}
	
	@PostMapping("SendOTP")
	public ModelAndView getOtpVerification(@Valid @ModelAttribute("forgotPassword") ForgotPassword forgotPassword,
			BindingResult result, 
			@ModelAttribute("signin")SignIn signin,
			@ModelAttribute("otp")OTP otpObj,
			@ModelAttribute("changePassword") ChangePassword changePassword) {
		ModelAndView mv = new ModelAndView();
		
		if(result.hasErrors()) {
			mv.setViewName("SignIn");
			mv.addObject("forgotModal", "Error");
			return mv;
		}
		
		Random rand = new Random();
		otp = 100000 + rand.nextInt(900000);
		
		try {
			Users userExist = userService.findByEmail(forgotPassword.getEmail());
			
			Users user = new Users();
			user.setEmail(forgotPassword.getEmail());
			user.setName(userExist.getName());
	
			mailService.sendEmail(user, otp);
			mv.setViewName("SignIn");
			mv.addObject("otpModal", "Message");
			mv.addObject("id",userExist.getUser_id());
			mv.addObject("email", forgotPassword.getEmail());
			return mv;
		}catch(NullPointerException e) {
			mv.setViewName("SignIn");
			mv.addObject("forgotModal", "Error");
			mv.addObject("emailError", "Oops! This Email id is not Registerd...");
			return mv;
		}
	}
	
	@PostMapping("VerifyOTP")
	public ModelAndView verifyOTP(@Valid @ModelAttribute("otp") OTP useotp,
			BindingResult result,
			@ModelAttribute("signin")SignIn signin,
			@ModelAttribute("forgotPassword")ForgotPassword forgotPassword,
			@ModelAttribute("changePassword") ChangePassword changePassword) {
		ModelAndView mv = new ModelAndView();
		
		if(result.hasErrors()) {
			mv.setViewName("SignIn");
			mv.addObject("otpModal", "Message");
			return mv;
		}
		if(otp != (int)useotp.getOtp()) {
			mv.setViewName("SignIn");
			mv.addObject("otpModal", "Error");
			mv.addObject("otpError","Invalid OTP, Please try later");
			return mv;
		}else {
			mv.setViewName("SignIn");
			mv.addObject("resetModal", "Message");
			return mv;
		}
	}
	
	@PostMapping("ResetPassword")
	public ModelAndView resetPassword(@Valid @ModelAttribute("changePassword") ChangePassword changePassword,
			BindingResult result,
			@ModelAttribute("signin")SignIn signin,
			@ModelAttribute("forgotPassword")ForgotPassword forgotPassword,
			@ModelAttribute("otp")OTP otpObj) {
		ModelAndView mv = new ModelAndView();
		if (result.hasErrors()) {
			mv.setViewName("SignIn");
			mv.addObject("resetModal", "Error");
			return mv;
		}
	
		if(!(changePassword.getNew_pwd().equalsIgnoreCase(changePassword.getConfirm_pwd()))) {
			mv.setViewName("SignIn");
			mv.addObject("resetModal", "Error");
			mv.addObject("passwordMismatch", "Error");
			return mv;
		}
		
		userService.updatePassword(pwdEncDcy.encrypt(changePassword.getNew_pwd()),changePassword.getId());
		
		mv.setViewName("redirect:/SignIn");
		mv.addObject("updated", "Success");
		return mv;
	}
	
	@GetMapping("Home")
	public ModelAndView getHome(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("id") == null) {
			mv.setViewName("redirect:/logout");
			mv.addObject("session", "Expired");
			return mv;
		}
		
		mv.setViewName("Home");
		return mv;
	}
}