package com.project.customvalidator;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import com.project.customannotations.NotEmpty;

public class CollegeValidation {

	int id;
	
	int user_ref;
	
	@NotEmpty(message="* Please Select Any Category...")
	String college_category;
	
	@NotEmpty(message="* Please enter College Name...")
	@Pattern(regexp = "^[a-zA-Z\\s]*$",message="* Please Enter Alphabet only")
	String clg_name;
	
	@NotEmpty(message="* Please enter Course Name...")
	@Pattern(regexp = "^[a-zA-Z\\s\\.]*$",message="* Please Enter Alphabet only")
	String course;
	
	@NotEmpty(message="* Please enter University Name...")
	@Pattern(regexp = "^[a-zA-Z\\s]*$",message="* Please Enter Alphabet only")
	String university;
	
	@NotEmpty(message="* Please enter CGPA...")
	@Pattern(regexp="^[0-9]{1,2}([.][0-9]{1,2})?$",message="* Please Enter Only Numbers...")
	@Size(min=3,max=3,message="* Please Enter the Valid Percentage...")
	String cgpa;
	
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

	public String getCollege_category() {
		return college_category;
	}

	public void setCollege_category(String college_category) {
		this.college_category = college_category;
	}

	public String getClg_name() {
		return clg_name;
	}

	public void setClg_name(String clg_name) {
		this.clg_name = clg_name;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public String getUniversity() {
		return university;
	}

	public void setUniversity(String university) {
		this.university = university;
	}

	public String getCgpa() {
		return cgpa;
	}

	public void setCgpa(String cgpa) {
		this.cgpa = cgpa;
	}

	public boolean isInn() {
		return inn;
	}

	public void setInn(boolean inn) {
		this.inn = inn;
	}

	@Override
	public String toString() {
		return "CollegeValidation [id=" + id + ", user_ref=" + user_ref + ", college_category=" + college_category
				+ ", clg_name=" + clg_name + ", course=" + course + ", university=" + university + ", cgpa=" + cgpa
				+ ", inn=" + inn + "]";
	}

}
