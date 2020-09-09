package com.project.customannotations;

import java.util.Date;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class FutureValidator implements ConstraintValidator<Future, Date> {

	    public final void initialize(final Future annotation) {}

	    public final boolean isValid(final Date value,
	        final ConstraintValidatorContext context) {

	        Date today = value;

	        // Your date must be after today or today (== not before today)
	        return value.after(today);

	    }
}
