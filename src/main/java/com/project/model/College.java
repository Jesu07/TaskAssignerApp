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
@Table(name="college")
public class College {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;
	
	@ManyToOne(cascade= CascadeType.MERGE)
	@JoinColumn(name="user_ref",referencedColumnName="user_id")
	Users user_ref;
	
	String college_category;
	String clg_name;
	String course;
	String university;
	double cgpa;
	int inn;
	
	public College() {
		super();
		// TODO Auto-generated constructor stub
	}

	public College(Users user_ref, String college_category, String clg_name, String course, String university,
			double cgpa, int inn) {
		super();
		this.user_ref = user_ref;
		this.college_category = college_category;
		this.clg_name = clg_name;
		this.course = course;
		this.university = university;
		this.cgpa = cgpa;
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

	public double getCgpa() {
		return cgpa;
	}

	public void setCgpa(double cgpa) {
		this.cgpa = cgpa;
	}

	public int getInn() {
		return inn;
	}

	public void setInn(int inn) {
		this.inn = inn;
	}

	@Override
	public String toString() {
		return "College [id=" + id + ", user_ref=" + user_ref + ", college_category=" + college_category + ", clg_name="
				+ clg_name + ", course=" + course + ", university=" + university + ", cgpa=" + cgpa + ", inn=" + inn
				+ "]";
	}	
}
