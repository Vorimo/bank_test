package com.ilya.bank.repository;

import com.ilya.bank.domain.Bank;

public interface BankRepository {

  long create(Bank bank);

  Bank read(Long id);

  boolean update(Bank bank);

  boolean delete(Long id);
}