package javaWebStore.model;

public class CustomerInfo {
	 
    private String name;
    private String password;
    private String address;
    private String email;
    private String phone;
    private String pay;
    
    private boolean valid;
 
 
    public String getName() {
        return name;
    }
 
    public void setName(String name) {
        this.name = name;
    }
    
    public String getPassword() {
        return password;
    }
 
    public void setPassword(String passW) {
        this.password = passW;
    }
 
    public String getEmail() {
        return email;
    }
 
    public void setEmail(String email) {
        this.email = email;
    }
 
    public String getAddress() {
        return address;
    }
 
    public void setAddress(String address) {
        this.address = address;
    }
 
    public String getPhone() {
        return phone;
    }
 
    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public String getPay() {
        return pay;
    }
 
    public void setPay(String Pay) {
        this.pay = Pay;
    }
    
    public boolean isValid() {
        return valid;
    }
 
    public void setValid(boolean valid) {
        this.valid = valid;
    }
 
}
