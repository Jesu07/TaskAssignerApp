package com.project.customannotations;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class BloodGroupValidator implements ConstraintValidator<Blood,Object> {

	@Override
	public boolean isValid(Object value, ConstraintValidatorContext context) {
		String grp = (String) value;
		if(grp.contains("+") && grp.contains("-"))
			return false;
		return true;
	}

}
