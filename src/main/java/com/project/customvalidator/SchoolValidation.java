package com.project.customvalidator;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import com.project.customannotations.NotEmpty;

public class SchoolValidation {

	int id;
	int user_ref;
	
	@NotEmpty(message="* Please Select Any Category...")
	String school_category;
	
	@NotEmpty(message="* Please Enter The School Name...")
	@Pattern(regexp="^[a-zA-Z\\s\\.]*$",message="* Please Enter Only Characters...")
	String school_name;
	
	@NotEmpty(message="* Please Enter Board...")
	@Pattern(regexp="^[a-zA-Z\\s\\.]*$",message="* Please Enter Only Characters...")
	String board;
	
	@NotEmpty(message="* Please Enter Marks...")
	@Pattern(regexp="^[0-9]*$",message="* Please Enter Only Numbers...")
	@Size(min=3,max=4,message="* Please Enter the Valid Percentage...")
	String marks;
	
	@NotEmpty(message="* Please Enter Percentage...")
	@Pattern(regexp="^[0-9\\.]*$",message="* Please Enter Only Numbers...")
	@Size(min=1,max=6,message="* Please Enter the Valid Percentage...")
	String percentage;
	
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

	public String getMarks() {
		return marks;
	}

	public void setMarks(String marks) {
		this.marks = marks;
	}

	public String getPercentage() {
		return percentage;
	}

	public void setPercentage(String percentage) {
		this.percentage = percentage;
	}

	public boolean isInn() {
		return inn;
	}

	public void setInn(boolean inn) {
		this.inn = inn;
	}

	@Override
	public String toString() {
		return "SchoolValidation [id=" + id + ", user_ref=" + user_ref + ", school_category=" + school_category
				+ ", school_name=" + school_name + ", board=" + board + ", marks=" + marks + ", percentage="
				+ percentage + ", inn=" + inn + "]";
	}
}
