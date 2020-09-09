package com.project.customvalidator;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import com.project.customannotations.NotEmpty;
import com.project.customannotations.Select;

public class ContactValidation {

	int id;
	
	int user_ref;
	
	@NotEmpty(message="* Please Select Any Category...")
	String contact_category;
	
	@NotEmpty(message="* Please enter Door Number...")
	@Pattern(regexp="^[0-9/ -]+$",message="* Please Enter Only Numbers...")
	String door_no;
	
	@NotEmpty(message="* Please enter Street Name...")
	@Pattern(regexp = "^[a-zA-Z\\s]*$",message="* Please Enter Alphabet only")
	String street;
	
	String village;

	String city;
	
	@Select(message="* Please Select any Country...")
	int country;
	
	@Select(message="* Please Select any State...")
	int state;
	
	@Select(message="* Please Select any District...")
	int district;
	
	@NotEmpty(message="* Please enter pincode...")
	@Size(min=6,max=6,message="* Please enter 6 digit pincode...")
	String pincode;
	
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

	public String getContact_category() {
		return contact_category;
	}

	public void setContact_category(String contact_category) {
		this.contact_category = contact_category;
	}

	public String getDoor_no() {
		return door_no;
	}

	public void setDoor_no(String door_no) {
		this.door_no = door_no;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getVillage() {
		return village;
	}

	public void setVillage(String village) {
		this.village = village;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getCountry() {
		return country;
	}

	public void setCountry(int country) {
		this.country = country;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getDistrict() {
		return district;
	}

	public void setDistrict(int district) {
		this.district = district;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public boolean isInn() {
		return inn;
	}

	public void setInn(boolean inn) {
		this.inn = inn;
	}

	@Override
	public String toString() {
		return "ContactValidation [id=" + id + ", user_ref=" + user_ref + ", contact_category=" + contact_category
				+ ", door_no=" + door_no + ", street=" + street + ", village=" + village + ", city=" + city
				+ ", country=" + country + ", state=" + state + ", district=" + district + ", pincode=" + pincode
				+ ", inn=" + inn + "]";
	}
}
