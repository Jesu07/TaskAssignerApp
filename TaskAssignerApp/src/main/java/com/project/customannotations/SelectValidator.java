package com.project.customannotations;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class SelectValidator implements ConstraintValidator<Select,Object> {

	@Override
	public boolean isValid(Object value, ConstraintValidatorContext context) {
		int i = (Integer) value;
		if(i == 0)
			return false;
		else
			return true;
	}

}
