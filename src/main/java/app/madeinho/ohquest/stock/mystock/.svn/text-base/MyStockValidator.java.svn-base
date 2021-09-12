package app.madeinho.ohquest.stock.mystock;

import java.io.Serializable;
import java.util.Date;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.validation.ValidationUtils;
 
public class MyStockValidator implements Validator {
 
	public boolean supports(Class clazz) {
		return MyStock.class.isAssignableFrom(clazz);
	}
 
	public void validate(Object target, Errors errors) {
 
		MyStock myStock = (MyStock)target;
 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "idohMember", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "scCode", "required");
 
		/*if(myStock.getIdohMember()==null || department.getDescription().length()<10){ //부서설명 프로퍼티는 입력값의 길이가 10 이상인가?
			errors.rejectValue("description", "lengthsize", new Object[]{10}, "description's length must be larger than 10.");
		}*/		
	}
}
