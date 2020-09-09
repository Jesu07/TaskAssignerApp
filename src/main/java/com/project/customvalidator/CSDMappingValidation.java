package com.project.customvalidator;

import com.project.customannotations.Select;

public class CSDMappingValidation {

	int id;
	
	@Select(message="* Please Select Any One Country...")
	int country;
	
	@Select(message="* Please Select Any One State...")
	int state;
	
	@Select(message="* Please Select Any One District...")
	int district;
	
	boolean inn;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public boolean isInn() {
		return inn;
	}

	public void setInn(boolean inn) {
		this.inn = inn;
	}

}
