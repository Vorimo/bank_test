package com.ilya.bank.repository;

import com.ilya.bank.domain.Account;

import java.util.List;

public interface AccountRepository {

  Long create(Account account);

  Account read(Long id);

  Account readByNumber(String number);

  List<Account> readAllByClientId(Long clientId);

  boolean increaseAmount(Long id, Double amountToAdd);

  boolean delete(Long id);

}