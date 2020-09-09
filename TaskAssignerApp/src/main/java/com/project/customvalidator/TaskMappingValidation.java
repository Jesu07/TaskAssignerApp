package com.project.customvalidator;

import java.util.List;

import javax.validation.constraints.NotEmpty;

import com.project.customannotations.Select;

public class TaskMappingValidation {

	int id;
	
	@NotEmpty(message="* Please Select Any User...")
	List<Integer> user_ref;
	
	@Select(message="* Please select Any Task...")
	int task;
	
	//@Future(message="* Please Enter the Future Date as Deadline...")
	//@NotNull(message="* Please Enter The Last date for Task Completion...")
	@NotEmpty(message="* Please Enter The Deadline...")
	String deadline;
	
	String extended_deadline;
	
	int reminder;
	
	String extension_description;
	
	String completion_date;
	
	String completion_description;
	
	int completion_status;
	
	int score;
	
	boolean inn;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<Integer> getUser_ref() {
		return user_ref;
	}

	public void setUser_ref(List<Integer> user_ref) {
		this.user_ref = user_ref;
	}

	public int getTask() {
		return task;
	}

	public void setTask(int task) {
		this.task = task;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public String getExtended_deadline() {
		return extended_deadline;
	}

	public void setExtended_deadline(String extended_deadline) {
		this.extended_deadline = extended_deadline;
	}

	public int getReminder() {
		return reminder;
	}

	public void setReminder(int reminder) {
		this.reminder = reminder;
	}

	public String getExtension_description() {
		return extension_description;
	}

	public void setExtension_description(String extension_description) {
		this.extension_description = extension_description;
	}

	public String getCompletion_date() {
		return completion_date;
	}

	public void setCompletion_date(String completion_date) {
		this.completion_date = completion_date;
	}

	public String getCompletion_description() {
		return completion_description;
	}

	public void setCompletion_description(String completion_description) {
		this.completion_description = completion_description;
	}

	public int getCompletion_status() {
		return completion_status;
	}

	public void setCompletion_status(int completion_status) {
		this.completion_status = completion_status;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public boolean isInn() {
		return inn;
	}

	public void setInn(boolean inn) {
		this.inn = inn;
	}

	@Override
	public String toString() {
		return "TaskMappingValidation [id=" + id + ", user_ref=" + user_ref + ", task=" + task + ", deadline="
				+ deadline + ", extended_deadline=" + extended_deadline + ", reminder=" + reminder
				+ ", extension_description=" + extension_description + ", completion_date=" + completion_date
				+ ", completion_description=" + completion_description + ", completion_status=" + completion_status
				+ ", score=" + score + ", inn=" + inn + "]";
	}
}