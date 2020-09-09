package com.project.customannotations;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class NotEmptyValidator implements ConstraintValidator<NotEmpty, Object> {

    @Override
    public void initialize(NotEmpty notEmpty) { }

	@Override
	public boolean isValid(Object obj, ConstraintValidatorContext cxt) {
		return ( (obj != null) && ( !(obj.toString().trim().equals("")) ) );
	}

}