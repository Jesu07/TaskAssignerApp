package com.project.customvalidator;

import javax.validation.constraints.Size;

import com.project.customannotations.NotEmpty;
import com.project.customannotations.Select;

public class PersonalValidation {

	int id;
	
	int user_ref;
	
	String email;
	
	@Select(message="* Please selct Any Designation...")
	int designation;
	
	@NotEmpty(message="* Please enter Mobile number...")
	@Size(min=10,max=10,message="* Please Enter 10 digit Mobile Number...")
	String mobile;
	
	@NotEmpty(message="* Please Enter Gender Value...")
	String gender;
	
	@NotEmpty(message="* Please Enter Gender Value...")
	String dob;
	
	@NotEmpty(message="* Please Enter Gender Value...")
	String place_of_birth;
	
	@Select(message="* Please Select any Bloodgroup...")
	int blood_group;
	
	@Select(message="* Please Select any Mother Tongue...")
	int mother_tongue;
	
	@Select(message="* Please Select any Country...")
	int nationality;
	
	@Select(message="* Please Select any Religion...")
	int religion;
	
	@Select(message="* Please Select any Community...")
	int category;
	
	String image_name;
	String image_path;
	String image_size;
	String image_type;
	
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getDesignation() {
		return designation;
	}

	public void setDesignation(int designation) {
		this.designation = designation;
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

	public int getBlood_group() {
		return blood_group;
	}

	public void setBlood_group(int blood_group) {
		this.blood_group = blood_group;
	}

	public int getMother_tongue() {
		return mother_tongue;
	}

	public void setMother_tongue(int mother_tongue) {
		this.mother_tongue = mother_tongue;
	}

	public int getNationality() {
		return nationality;
	}

	public void setNationality(int nationality) {
		this.nationality = nationality;
	}

	public int getReligion() {
		return religion;
	}

	public void setReligion(int religion) {
		this.religion = religion;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
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

	public boolean isInn() {
		return inn;
	}

	public void setInn(boolean inn) {
		this.inn = inn;
	}

	@Override
	public String toString() {
		return "PersonalValidation [id=" + id + ", user_ref=" + user_ref + ", email=" + email + ", designation="
				+ designation + ", mobile=" + mobile + ", gender=" + gender + ", dob=" + dob + ", place_of_birth="
				+ place_of_birth + ", blood_group=" + blood_group + ", mother_tongue=" + mother_tongue
				+ ", nationality=" + nationality + ", religion=" + religion + ", category=" + category + ", image_name="
				+ image_name + ", image_path=" + image_path + ", image_size=" + image_size + ", image_type="
				+ image_type + ", inn=" + inn + "]";
	}

}