package com.ilya.bank.service;

import com.ilya.bank.domain.Account;
import com.ilya.bank.repository.AccountRepository;

import java.util.List;

public class AccountService {
  private final AccountRepository accountRepository;

  public AccountService(AccountRepository accountRepository) {

    this.accountRepository = accountRepository;
  }

  public Account getAccountByNumber(String number) {
    return accountRepository.readByNumber(number);
  }

  public List<Account> getClientAllAccounts(Long clientId) {
    return accountRepository.readAllByClientId(clientId);
  }

  public boolean deleteAccount(Long id) {
    return accountRepository.delete(id);
  }
}