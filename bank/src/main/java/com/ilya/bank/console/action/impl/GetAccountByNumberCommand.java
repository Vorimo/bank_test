package com.ilya.bank.console.action.impl;

import com.ilya.bank.console.action.Command;
import com.ilya.bank.repository.AccountRepository;
import com.ilya.bank.repository.impl.AccountRepositoryImpl;
import com.ilya.bank.service.AccountService;

public class GetAccountByNumberCommand implements Command {

  @Override
  public void execute(String[] params) {
    AccountRepository accountRepository = new AccountRepositoryImpl();
    AccountService accountService = new AccountService(accountRepository);
    accountService.getAccountByNumber(params[0]);
  }
}