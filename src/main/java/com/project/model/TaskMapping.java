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
@Table(name="task_assignment")
public class TaskMapping {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;
	
	@ManyToOne(cascade= CascadeType.MERGE)
	@JoinColumn(name="user_ref",referencedColumnName="user_id")
	Users user_ref;
	
	@ManyToOne(cascade= CascadeType.MERGE)
	@JoinColumn(name="task",referencedColumnName="id")
	TaskMaster task;
	
	String deadline;
	String extended_deadline;
	int reminder;
	String extension_description;
	String completion_date;
	String completion_description;
	int completion_status;
	int score;
	int inn;
	
	public TaskMapping() {}

	public TaskMapping(Users user_ref, TaskMaster task, String deadline, String extended_deadline, int reminder,
			String extension_description, String completion_date, String completion_description, int completion_status,
			int score, int inn) {
		super();
		this.user_ref = user_ref;
		this.task = task;
		this.deadline = deadline;
		this.extended_deadline = extended_deadline;
		this.reminder = reminder;
		this.extension_description = extension_description;
		this.completion_date = completion_date;
		this.completion_description = completion_description;
		this.completion_status = completion_status;
		this.score = score;
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

	public TaskMaster getTask() {
		return task;
	}

	public void setTask(TaskMaster task) {
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

	public int getInn() {
		return inn;
	}

	public void setInn(int inn) {
		this.inn = inn;
	}

	@Override
	public String toString() {
		return "TaskMapping [id=" + id + ", user_ref=" + user_ref + ", task=" + task + ", deadline=" + deadline
				+ ", extended_deadline=" + extended_deadline + ", reminder=" + reminder + ", extension_description="
				+ extension_description + ", completion_date=" + completion_date + ", completion_description="
				+ completion_description + ", completion_status=" + completion_status + ", score=" + score + ", inn="
				+ inn + "]";
	}

}
