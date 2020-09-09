package com.project.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="district_master")
public class District {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	
	String name;
	String acronym;
	int inn;

	public District() {}
	
	public District(String name2, String acronym2, int i) {
		name = name2;
		acronym = acronym2;
		inn = i;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAcronym() {
		return acronym;
	}
	public void setAcronym(String acronym) {
		this.acronym = acronym;
	}
	public int getInn() {
		return inn;
	}
	public void setInn(boolean inn) {
		this.inn = District.check(inn);
	}

	private static int check(boolean bool) {
		int status = 0;
		if(bool == true)
			status = 1;
		else
			status = 0;
		return status;
	}

	@Override
	public String toString() {
		return "District [id=" + id + ", name=" + name + ", acronym=" + acronym + ", inn=" + inn + "]";
	}
}
