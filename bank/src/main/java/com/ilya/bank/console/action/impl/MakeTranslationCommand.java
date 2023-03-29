package com.ilya.bank.console.action.impl;

import com.ilya.bank.console.action.Command;
import com.ilya.bank.repository.AccountRepository;
import com.ilya.bank.repository.BankRepository;
import com.ilya.bank.repository.ClientRepository;
import com.ilya.bank.repository.TranslationRepository;
import com.ilya.bank.repository.impl.AccountRepositoryImpl;
import com.ilya.bank.repository.impl.BankRepositoryImpl;
import com.ilya.bank.repository.impl.ClientRepositoryImpl;
import com.ilya.bank.repository.impl.TranslationRepositoryImpl;
import com.ilya.bank.service.TranslationService;

public class MakeTranslationCommand implements Command {

  @Override
  public void execute(String[] params) {
    BankRepository bankRepository = new BankRepositoryImpl();
    AccountRepository accountRepository = new AccountRepositoryImpl();
    ClientRepository clientRepository = new ClientRepositoryImpl();
    TranslationRepository translationRepository = new TranslationRepositoryImpl();
    TranslationService translationService = new TranslationService(translationRepository, accountRepository,
        bankRepository, clientRepository);
    translationService.makeTranslation(Long.valueOf(params[0]), Long.valueOf(params[1]), Double.valueOf(params[2]));
  }
}