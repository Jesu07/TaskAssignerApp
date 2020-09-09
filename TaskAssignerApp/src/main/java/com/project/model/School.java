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
@Table(name="school")
public class School {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;
	
	@ManyToOne(cascade= CascadeType.MERGE)
	@JoinColumn(name="user_ref",referencedColumnName="user_id")
	Users user_ref;
	
	String school_category;
	String school_name;
	String board;
	int marks;
	double percentage;
	int inn;
	
	public School() {
		super();
		// TODO Auto-generated constructor stub
	}

	public School(int id, Users user_ref, String school_category, String school_name, String board, int marks,
			double percentage, int inn) {
		super();
		this.id = id;
		this.user_ref = user_ref;
		this.school_category = school_category;
		this.school_name = school_name;
		this.board = board;
		this.marks = marks;
		this.percentage = percentage;
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

	public String getSchool_category() {
		return school_category;
	}

	public void setSchool_category(String school_category) {
		this.school_category = school_category;
	}

	public String getSchool_name() {
		return school_name;
	}

	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}

	public String getBoard() {
		return board;
	}

	public void setBoard(String board) {
		this.board = board;
	}

	public int getMarks() {
		return marks;
	}

	public void setMarks(int marks) {
		this.marks = marks;
	}

	public double getPercentage() {
		return percentage;
	}

	public void setPercentage(double percentage) {
		this.percentage = percentage;
	}

	public int getInn() {
		return inn;
	}

	public void setInn(int inn) {
		this.inn = inn;
	}

	@Override
	public String toString() {
		return "School [id=" + id + ", user_ref=" + user_ref + ", school_category=" + school_category + ", school_name="
				+ school_name + ", board=" + board + ", marks=" + marks + ", percentage=" + percentage + ", inn=" + inn
				+ "]";
	}

}
