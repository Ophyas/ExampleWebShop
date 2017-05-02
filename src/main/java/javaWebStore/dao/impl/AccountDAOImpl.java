package javaWebStore.dao.impl;


import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import javaWebStore.dao.AccountDAO;
import javaWebStore.entity.Account;
import javaWebStore.model.CustomerInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
 
@Transactional
public class AccountDAOImpl implements AccountDAO {
    
    @Autowired
    private SessionFactory sessionFactory;
 
    @Override
    public Account findAccount(String userName ) {
        Session session = sessionFactory.getCurrentSession();
        Criteria crit = session.createCriteria(Account.class);
        crit.add(Restrictions.eq("userName", userName));
        return (Account) crit.uniqueResult();
    }
    
    @Override
    public void save(CustomerInfo customerInfo) {
    	System.out.println(customerInfo.getName());
    	System.out.println(customerInfo.getPassword());
        Account account = new Account();
        
        System.out.println("Account done");
        account.setUserName(customerInfo.getName());
        account.setPassword(customerInfo.getPassword());
        account.setActive(true);
        account.setUserRole(Account.ROLE_CUSTOMER);
 
        System.out.println("Prepersist");
        this.sessionFactory.getCurrentSession().persist(account);
        
        System.out.println("DONE");
        
        this.sessionFactory.getCurrentSession().flush();
    }
 
}
