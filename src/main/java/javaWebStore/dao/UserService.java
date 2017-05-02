package javaWebStore.dao;

import java.util.List;

import javaWebStore.entity.Account;

public interface UserService {

    public Account add(AccountDAO added);

    public Account deleteById(Long id);

    public List<Account> findAll();

    public Account findById(Long id);

    public Account update(AccountDAO updated);
}
