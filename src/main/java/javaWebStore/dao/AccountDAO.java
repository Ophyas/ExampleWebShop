package javaWebStore.dao;

import javaWebStore.entity.Account;
import javaWebStore.model.CustomerInfo;

public interface AccountDAO {
    
    public Account findAccount(String userName );
    
    public void save(CustomerInfo customerInfo);
    
}
