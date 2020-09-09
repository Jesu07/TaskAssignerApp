package com.project.customvalidator;

import com.project.customannotations.NotEmpty;

public class TaskMasterValidation {

	int id;
	
	int user_ref;
	
	@NotEmpty(message="* Please Provide A Task Name...")
	String task_name;
	
	@NotEmpty(message="* Please Enter Task Description...")
	String description;
	
	String created_on;
	
	int status;
	
	boolean inn;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUser_ref() {
		return user_ref;
	}

	public void setUser_ref(int user_ref) {
		this.user_ref = user_ref;
	}

	public String getTask_name() {
		return task_name;
	}

	public void setTask_name(String task_name) {
		this.task_name = task_name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCreated_on() {
		return created_on;
	}

	public void setCreated_on(String created_on) {
		this.created_on = created_on;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public boolean isInn() {
		return inn;
	}

	public void setInn(boolean inn) {
		this.inn = inn;
	}

	@Override
	public String toString() {
		return "TaskMasterValidation [id=" + id + ", user_ref=" + user_ref + ", task_name=" + task_name
				+ ", description=" + description + ", created_on=" + created_on + ", status=" + status + ", inn=" + inn
				+ "]";
	}
}
