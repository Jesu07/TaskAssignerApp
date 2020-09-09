package com.project.customannotations;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import com.project.customannotations.Dot;

public class DotValidator implements ConstraintValidator<Dot,Object> {

	@Override
	public boolean isValid(Object value, ConstraintValidatorContext context) {
		String grp = (String) value;
		int count = 0;
		for(int i=0;i<grp.length();i++) {
			if(grp.charAt(i) == '.')
				count+=1;
		}
		if(grp.contains(".") && grp.endsWith(".") && count<=3)
			return true;
		return false;
	}

}
