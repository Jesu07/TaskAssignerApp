package com.project.customvalidator;

import javax.validation.constraints.Size;

import com.project.customannotations.NotEmpty;

public class ChangePassword {

	int id;

	@NotEmpty(message="* Please Enter the Password...")
	@Size(min=7,max=15,message="* Please Enter the Password with 7 to 15 characters length...")
	String new_pwd;
	
	@NotEmpty(message="* Please Enter the Password...")
	@Size(min=7,max=15,message="* Please Enter the Password with 7 to 15 characters length...")
	String confirm_pwd;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNew_pwd() {
		return new_pwd;
	}
	public void setNew_pwd(String new_pwd) {
		this.new_pwd = new_pwd;
	}
	public String getConfirm_pwd() {
		return confirm_pwd;
	}
	public void setConfirm_pwd(String confirm_pwd) {
		this.confirm_pwd = confirm_pwd;
	}
	@Override
	public String toString() {
		return "ChangePassword [id=" + id + ", new_pwd=" + new_pwd + ", confirm_pwd=" + confirm_pwd + "]";
	}
}