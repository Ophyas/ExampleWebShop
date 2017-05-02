package javaWebStore.validator;

import org.apache.commons.validator.routines.EmailValidator;
import javaWebStore.model.CustomerInfo;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
 
@Component
public class CustomerInfoValidator implements Validator {
 
    private EmailValidator emailValidator = EmailValidator.getInstance();
 
    @Override
    public boolean supports(Class<?> clazz) {
        return clazz == CustomerInfo.class;
    }
 
    @Override
    public void validate(Object target, Errors errors) {
        CustomerInfo custInfo = (CustomerInfo) target;
 
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty.customerForm.name");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty.customerForm.email");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address", "NotEmpty.customerForm.address");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", "NotEmpty.customerForm.phone");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pay", "NotEmpty.customerForm.pay");
 
        if (!emailValidator.isValid(custInfo.getEmail())) {
            errors.rejectValue("email", "Pattern.customerForm.email");
        }
    }
 
}
