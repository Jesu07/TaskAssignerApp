package com.project.customannotations;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class AlphabetsOnlyValidator implements ConstraintValidator<AlphabetsOnly,Object> {

	@Override
	public boolean isValid(Object value, ConstraintValidatorContext context) {
		String str = value.toString();
		return ((str != null) && (!str.equals("")) && (str.matches("^[a-zA-Z]*$")));
	}
	
}
