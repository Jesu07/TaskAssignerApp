package com.project.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.project.config.PasswordEncryptionDecryption;
import com.project.model.TaskMapping;
import com.project.model.Users;

@Service
public class MailService {
	
	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	PasswordEncryptionDecryption pwdEncDcy;
	
	public void sendEmail(Users user, int otp) {
		MimeMessage msg = mailSender.createMimeMessage();
		String msg1 = "Hi, "+user.getName()+"<br>Your verification code is :<b> "+otp+"</b>";
		try {
			MimeMessageHelper helper = new MimeMessageHelper(msg,true);
			helper.setSubject("OTP");
			helper.setFrom(new InternetAddress("jesuraj3040@gmail.com","Task Assigner Verification"));
			helper.setTo(user.getEmail());
			helper.setText(msg1,true);
			mailSender.send(helper.getMimeMessage());
		}catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
	}
	
	public void sendDetails(Users user) {
		MimeMessage msg  = mailSender.createMimeMessage();
		String msg1="Hi, " + user.getName() + 
				"<br> Your account has been successfully verified and created.<br><b>Account Details:</b><br>" + 
				"<b>Mail id :</b>" + user.getEmail() + "<br>" + 
				"<b>User name :</b>" + user.getUsername() + "<br>" + 
				"<b>Password :</b>" + pwdEncDcy.decrypt(user.getPassword()) + "<br><br>Thank you.";
		try {
			MimeMessageHelper helper = new MimeMessageHelper(msg,true);
			helper.setSubject("Account Created");
			helper.setFrom(new InternetAddress("jesuraj3040@gmail.com","Task Assigner Account Created"));
			helper.setTo(user.getEmail());
			helper.setText(msg1,true);
			mailSender.send(helper.getMimeMessage());
		}catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
	}
	
	public void sendTaskDetails(TaskMapping tm) {
		MimeMessage msg  = mailSender.createMimeMessage();
		String msg1="Hi, " + tm.getUser_ref().getName() + 
				"<br> You have to complete the below task bofore the deadline and submit the task completion Report.<br>" + 
				"<b>Task Details:</b><br>"+
				"<b>Task Name :</b>" + tm.getTask().getTask_name() + "<br>" +
				"<b>Task Description :</b>" + tm.getTask().getDescription() + "<br>" +
				"<b>Last Date to Complete:</b>" + tm.getDeadline() + "<br>" + 
				"<br><br>Thank you...";
		try {
			MimeMessageHelper helper = new MimeMessageHelper(msg,true);
			helper.setSubject("New Task Assigned For You...");
			helper.setFrom(new InternetAddress("jesuraj3040@gmail.com","New Task Assigned to you"));
			helper.setTo(tm.getUser_ref().getEmail());
			helper.setText(msg1,true);
			mailSender.send(helper.getMimeMessage());
		}catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
	}
}