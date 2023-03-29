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
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.text.ParseException;
import java.text.SimpleDateFormat;

public class GetTranslationExtractionCommand implements Command {
  private static final Logger LOGGER = LogManager.getLogger(GetTranslationExtractionCommand.class);

  @Override
  public void execute(String[] params) {
    BankRepository bankRepository = new BankRepositoryImpl();
    AccountRepository accountRepository = new AccountRepositoryImpl();
    ClientRepository clientRepository = new ClientRepositoryImpl();
    TranslationRepository translationRepository = new TranslationRepositoryImpl();
    TranslationService translationService = new TranslationService(translationRepository, accountRepository,
        bankRepository, clientRepository);
    var dateFormat = new SimpleDateFormat("dd-MM-yyyy");
    try {
      translationService.getExtractionByClientIdAndPeriod(Long.valueOf(params[0]), dateFormat.parse(params[1]),
          dateFormat.parse(params[2]));
    } catch (ParseException e) {
      LOGGER.error("Unable to parse date", e);
    }
  }
}