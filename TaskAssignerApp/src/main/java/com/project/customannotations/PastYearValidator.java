package com.project.customannotations;

import java.util.Date;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class PastYearValidator implements ConstraintValidator<PastYear,Object> {

	@SuppressWarnings("deprecation")
	@Override
	public boolean isValid(Object value, ConstraintValidatorContext context) {
		Integer in = Integer.parseInt((String) value);
		Date date = new Date();
		if(date.getYear()+1900 >= in) {
			return true;
		}
		return false;
	}

}
