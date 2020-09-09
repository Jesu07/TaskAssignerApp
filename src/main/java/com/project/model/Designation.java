package com.project.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="designation")
public class Designation {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;
	
	String name;
	int inn;
	
	public Designation() {}
	
	public Designation(String name, int inn) {
		super();
		this.name = name;
		this.inn = inn;
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
	public int getInn() {
		return inn;
	}
	public void setInn(int inn) {
		this.inn = inn;
	}
	@Override
	public String toString() {
		return "Designation [id=" + id + ", name=" + name + ", inn=" + inn + "]";
	}
}
