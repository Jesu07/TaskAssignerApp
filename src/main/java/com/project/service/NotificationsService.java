package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.model.Notifications;
import com.project.repository.NotificationsRepository;

@Service
public class NotificationsService {

	@Autowired
	NotificationsRepository notifyRepo;
	
	public List<Notifications> selectAll(){
		List<Notifications> list = notifyRepo.findAll();
		return list;
	}
	
	public void saveNotifications(Notifications n) {
		notifyRepo.save(n);
	}

	public List<Notifications> selectAllNotificationsByUserId(int user) {
		return notifyRepo.findAllNotificationsByUserId(user);
	}

	public void updateIsViewed(int id, String date) {
		notifyRepo.updateIsViewed(id,date);
	}

	public List<Notifications> selectAdminNotificationCount() {
		return notifyRepo.findAdminNotificationCount();
	}

	public List<Notifications> selectUserNotificationCount() {
		return notifyRepo.findUserNotificationCount();
	}
	 
}
