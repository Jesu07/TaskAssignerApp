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
@Table(name="contact")
public class Contact {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;
	
	@ManyToOne(cascade= CascadeType.MERGE)
	@JoinColumn(name="user_ref",referencedColumnName="user_id")
	Users user_ref;
	
	String contact_category;
	
	String door_no;
	
	String street;
	
	String village;
	
	String city;
	
	@ManyToOne(cascade= CascadeType.MERGE)
	@JoinColumn(name="country",referencedColumnName="id")
	Country country;
	
	@ManyToOne(cascade= CascadeType.MERGE)
	@JoinColumn(name="state",referencedColumnName="id")
	State state;
	
	@ManyToOne(cascade= CascadeType.MERGE)
	@JoinColumn(name="district",referencedColumnName="id")
	District district;
	
	int pincode;
	
	int inn;
	
	public Contact() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Contact(Users user_ref, String contact_category, String door_no, String street, String village,
			String city, Country country, State state, District district, int pincode, int inn) {
		super();
		this.user_ref = user_ref;
		this.contact_category = contact_category;
		this.door_no = door_no;
		this.street = street;
		this.village = village;
		this.city = city;
		this.country = country;
		this.state = state;
		this.district = district;
		this.pincode = pincode;
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

	public Country getCountry() {
		return country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	public State getState() {
		return state;
	}

	public void setState(State state) {
		this.state = state;
	}

	public District getDistrict() {
		return district;
	}

	public void setDistrict(District district) {
		this.district = district;
	}

	public int getPincode() {
		return pincode;
	}

	public void setPincode(int pincode) {
		this.pincode = pincode;
	}

	public int getInn() {
		return inn;
	}

	public void setInn(int inn) {
		this.inn = inn;
	}

	@Override
	public String toString() {
		return "Contact [id=" + id + ", user_ref=" + user_ref + ", contact_category=" + contact_category + ", door_no="
				+ door_no + ", street=" + street + ", village=" + village + ", city=" + city + ", country=" + country
				+ ", state=" + state + ", district=" + district + ", pincode=" + pincode + ", inn=" + inn + "]";
	}
}
