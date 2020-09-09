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
@Table(name="personal")
public class Personal {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;
	
	@ManyToOne(cascade= CascadeType.MERGE)
	@JoinColumn(name="user_ref",referencedColumnName="user_id")
	Users user_ref;
	
	@ManyToOne(cascade= CascadeType.MERGE)
	@JoinColumn(name="designation",referencedColumnName="id")
	Designation designation;
	
	String email;
	String mobile;
	String gender;
	String dob;
	String place_of_birth;
	
	@ManyToOne(cascade= CascadeType.MERGE)
	@JoinColumn(name="blood_group",referencedColumnName="id")
	Bloodgroup blood_group;
	
	@ManyToOne(cascade= CascadeType.MERGE)
	@JoinColumn(name="mother_tongue",referencedColumnName="id")
	Language mother_tongue;
	
	@ManyToOne(cascade= CascadeType.MERGE)
	@JoinColumn(name="nationality",referencedColumnName="id")
	Country nationality;
	
	@ManyToOne(cascade= CascadeType.MERGE)
	@JoinColumn(name="religion",referencedColumnName="id")
	Religion religion;
	
	@ManyToOne(cascade= CascadeType.MERGE)
	@JoinColumn(name="category",referencedColumnName="id")
	Community category;
	
	String image_name;
	String image_path;
	String image_size;
	String image_type;
	
	int inn;

	public Personal() {}

	public Personal(Users user_ref, Designation designation, String email, String mobile, String gender, String dob,
			String place_of_birth, Bloodgroup blood_group, Language mother_tongue, Country nationality,
			Religion religion, Community category, String image_name, String image_path, String image_size,
			String image_type, int inn) {
		super();
		this.user_ref = user_ref;
		this.designation = designation;
		this.email = email;
		this.mobile = mobile;
		this.gender = gender;
		this.dob = dob;
		this.place_of_birth = place_of_birth;
		this.blood_group = blood_group;
		this.mother_tongue = mother_tongue;
		this.nationality = nationality;
		this.religion = religion;
		this.category = category;
		this.image_name = image_name;
		this.image_path = image_path;
		this.image_size = image_size;
		this.image_type = image_type;
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

	public Designation getDesignation() {
		return designation;
	}

	public void setDesignation(Designation designation) {
		this.designation = designation;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getPlace_of_birth() {
		return place_of_birth;
	}

	public void setPlace_of_birth(String place_of_birth) {
		this.place_of_birth = place_of_birth;
	}

	public Bloodgroup getBlood_group() {
		return blood_group;
	}

	public void setBlood_group(Bloodgroup blood_group) {
		this.blood_group = blood_group;
	}

	public Language getMother_tongue() {
		return mother_tongue;
	}

	public void setMother_tongue(Language mother_tongue) {
		this.mother_tongue = mother_tongue;
	}

	public Country getNationality() {
		return nationality;
	}

	public void setNationality(Country nationality) {
		this.nationality = nationality;
	}

	public Religion getReligion() {
		return religion;
	}

	public void setReligion(Religion religion) {
		this.religion = religion;
	}

	public Community getCategory() {
		return category;
	}

	public void setCategory(Community category) {
		this.category = category;
	}

	public String getImage_name() {
		return image_name;
	}

	public void setImage_name(String image_name) {
		this.image_name = image_name;
	}

	public String getImage_path() {
		return image_path;
	}

	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}

	public String getImage_size() {
		return image_size;
	}

	public void setImage_size(String image_size) {
		this.image_size = image_size;
	}

	public String getImage_type() {
		return image_type;
	}

	public void setImage_type(String image_type) {
		this.image_type = image_type;
	}

	public int getInn() {
		return inn;
	}

	public void setInn(int inn) {
		this.inn = inn;
	}

	@Override
	public String toString() {
		return "Personal [id=" + id + ", user_ref=" + user_ref + ", designation=" + designation + ", email=" + email
				+ ", mobile=" + mobile + ", gender=" + gender + ", dob=" + dob + ", place_of_birth=" + place_of_birth
				+ ", blood_group=" + blood_group + ", mother_tongue=" + mother_tongue + ", nationality=" + nationality
				+ ", religion=" + religion + ", category=" + category + ", image_name=" + image_name + ", image_path="
				+ image_path + ", image_size=" + image_size + ", image_type=" + image_type + ", inn=" + inn + "]";
	}

}