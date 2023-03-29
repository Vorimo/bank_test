package com.ilya.bank.console.action.impl;

import com.ilya.bank.console.action.Command;
import com.ilya.bank.repository.AccountRepository;
import com.ilya.bank.repository.BankRepository;
import com.ilya.bank.repository.ClientsAccountsRepository;
import com.ilya.bank.repository.impl.AccountRepositoryImpl;
import com.ilya.bank.repository.impl.BankRepositoryImpl;
import com.ilya.bank.repository.impl.ClientsAccountsRepositoryImpl;
import com.ilya.bank.service.BankService;

public class AddBankClientCommand implements Command {

  @Override
  public void execute(String[] params) {
    BankRepository bankRepository = new BankRepositoryImpl();
    AccountRepository accountRepository = new AccountRepositoryImpl();
    ClientsAccountsRepository clientsAccountsRepository = new ClientsAccountsRepositoryImpl();
    BankService bankService = new BankService(bankRepository, accountRepository, clientsAccountsRepository);
    bankService.addClient(Long.valueOf(params[0]), Long.valueOf(params[1]),
        Double.valueOf(params[2]), Long.valueOf(params[3]));
  }
}