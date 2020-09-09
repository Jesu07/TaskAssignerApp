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
@Table(name="csd")
public class CSDMapping {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;
	
	@ManyToOne(cascade= CascadeType.MERGE)
	@JoinColumn(name="country",referencedColumnName="id")
	Country country;
	
	@ManyToOne(cascade= CascadeType.MERGE)
	@JoinColumn(name="state",referencedColumnName="id")
	State state;
	
	@ManyToOne(cascade= CascadeType.MERGE)
	@JoinColumn(name="district",referencedColumnName="id")
	District district;

	int inn;

	public CSDMapping(int id, Country country, State state, District district, int inn) {
		super();
		this.id = id;
		this.country = country;
		this.state = state;
		this.district = district;
		this.inn = inn;
	}

	public CSDMapping() {	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public int getInn() {
		return inn;
	}

	public void setInn(int inn) {
		this.inn = inn;
	}

	@Override
	public String toString() {
		return "CSDMapping [id=" + id + ", country=" + country + ", state=" + state + ", district=" + district
				+ ", inn=" + inn + "]";
	}		
}