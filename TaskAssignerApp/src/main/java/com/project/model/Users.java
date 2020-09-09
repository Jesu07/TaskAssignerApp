package com.project.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="users")
public class Users {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int user_id;
	
	String role;
	String name;
	String email;
	String username;
	String password;
	int personal_status;
	int inn;
	
	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Users(String role, String name, String email, String username, String password,
			int personal_status, int inn) {
		super();
		this.role = role;
		this.name = name;
		this.email = email;
		this.username = username;
		this.password = password;
		this.personal_status = personal_status;
		this.inn = inn;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getPersonal_status() {
		return personal_status;
	}
	public void setPersonal_status(int personal_status) {
		this.personal_status = personal_status;
	}
	public int getInn() {
		return inn;
	}
	public void setInn(int inn) {
		this.inn = inn;
	}
	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", role=" + role + ", name=" + name + ", email=" + email + ", username="
				+ username + ", password=" + password + ", personal_status=" + personal_status + ", inn="
				+ inn + "]";
	}
}
