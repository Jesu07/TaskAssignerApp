package com.project.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="notifications")
public class Notifications {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	
	@ManyToOne(cascade= CascadeType.MERGE)
	@JoinColumn(name="user_ref",referencedColumnName="user_id")
	Users user_ref;
	
	@ManyToOne(cascade= CascadeType.MERGE)
	@JoinColumn(name="task",referencedColumnName="id")
	TaskMapping task;
	
	int created_by;
	
	String created_for;
	
	String created_date_time;
	
	String notification_type;
	
	int is_viewed;
	
	String viewed_date_time;
	
	int inn;

	public Notifications() {
		super();
	}

	public Notifications(Users user_ref, TaskMapping task, int created_by, String created_for,
			String created_date_time, String notification_type, int is_viewed, String viewed_date_time, int inn) {
		super();
		this.user_ref = user_ref;
		this.task = task;
		this.created_by = created_by;
		this.created_for = created_for;
		this.created_date_time = created_date_time;
		this.notification_type = notification_type;
		this.is_viewed = is_viewed;
		this.viewed_date_time = viewed_date_time;
		this.inn = inn;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Users getUser_ref() {
		return user_ref;
	}

	public void setUser_ref(Users user_ref) {
		this.user_ref = user_ref;
	}

	public TaskMapping getTask() {
		return task;
	}

	public void setTask(TaskMapping task) {
		this.task = task;
	}

	public int getCreated_by() {
		return created_by;
	}

	public void setCreated_by(int created_by) {
		this.created_by = created_by;
	}

	public String getCreated_for() {
		return created_for;
	}

	public void setCreated_for(String created_for) {
		this.created_for = created_for;
	}

	public String getCreated_date_time() {
		return created_date_time;
	}

	public void setCreated_date_time(String created_date_time) {
		this.created_date_time = created_date_time;
	}

	public String getNotification_type() {
		return notification_type;
	}

	public void setNotification_type(String notification_type) {
		this.notification_type = notification_type;
	}

	public int getIs_viewed() {
		return is_viewed;
	}

	public void setIs_viewed(int is_viewed) {
		this.is_viewed = is_viewed;
	}

	public String getViewed_date_time() {
		return viewed_date_time;
	}

	public void setViewed_date_time(String viewed_date_time) {
		this.viewed_date_time = viewed_date_time;
	}

	public int getInn() {
		return inn;
	}

	public void setInn(int inn) {
		this.inn = inn;
	}

	@Override
	public String toString() {
		return "Notifications [id=" + id + ", user_ref=" + user_ref + ", task=" + task + ", created_by=" + created_by
				+ ", created_for=" + created_for + ", created_date_time=" + created_date_time + ", notification_type="
				+ notification_type + ", is_viewed=" + is_viewed + ", viewed_date_time=" + viewed_date_time + ", inn="
				+ inn + "]";
	}

}
