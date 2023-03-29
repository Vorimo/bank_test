package com.ilya.bank.service;

import com.ilya.bank.connector.JDBCConnector;
import com.ilya.bank.domain.Bank;
import com.ilya.bank.domain.Client;
import com.ilya.bank.repository.AccountRepository;
import com.ilya.bank.repository.BankRepository;
import com.ilya.bank.repository.ClientRepository;
import com.ilya.bank.repository.ClientsAccountsRepository;
import com.ilya.bank.repository.TranslationRepository;
import com.ilya.bank.repository.impl.AccountRepositoryImpl;
import com.ilya.bank.repository.impl.BankRepositoryImpl;
import com.ilya.bank.repository.impl.ClientRepositoryImpl;
import com.ilya.bank.repository.impl.ClientsAccountsRepositoryImpl;
import com.ilya.bank.repository.impl.TranslationRepositoryImpl;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

import static org.junit.jupiter.api.Assertions.*;

class TranslationServiceTest {

  private static TranslationService translationService;
  private static AccountService accountService;
  private static BankService bankService;
  private static ClientService clientService;

  @BeforeEach
  void setUp() {
    TranslationRepository translationRepository = new TranslationRepositoryImpl();
    AccountRepository accountRepository = new AccountRepositoryImpl();
    BankRepository bankRepository = new BankRepositoryImpl();
    ClientRepository clientRepository = new ClientRepositoryImpl();
    ClientsAccountsRepository clientsAccountsRepository = new ClientsAccountsRepositoryImpl();
    translationService = new TranslationService(translationRepository, accountRepository, bankRepository,
        clientRepository);
    bankService = new BankService(bankRepository, accountRepository, clientsAccountsRepository);
    clientService = new ClientService(clientRepository);
    accountService = new AccountService(accountRepository);
  }

  @AfterEach
  void tearDown() {
    JDBCConnector.getInstance().closeConnection();
  }

  @Test
  void makeTranslation() {
    var bankIdPrior = bankService.createBank(new Bank(null, "Prior", 5D, 10D));
    var bankIdAlpha = bankService.createBank(new Bank(null, "Alpha", 1D, 2D));
    var clientId1 = clientService.createClient(new Client(null, "ilya", true));
    var clientId2 = clientService.createClient(new Client(null, "denis", true));
    var accountNumber1 = bankService.addClient(clientId1, 1L, 3000D, bankIdPrior);
    var accountNumber2 = bankService.addClient(clientId2, 1L, 3000D, bankIdAlpha);
    var accountId1 = accountService.getAccountByNumber(accountNumber1).getId();
    var accountId2 = accountService.getAccountByNumber(accountNumber2).getId();
    translationService.makeTranslation(accountId1, accountId2, 100D);
    var account1 = accountService.getAccountByNumber(accountNumber1);
    var account2 = accountService.getAccountByNumber(accountNumber2);
    assertEquals(2895D, account1.getAmount());
    assertEquals(3100D, account2.getAmount());
  }

  @Test
  void readClientAllTranslationsForPeriod() {
    var bankIdPrior = bankService.createBank(new Bank(null, "Prior", 5D, 10D));
    var bankIdAlpha = bankService.createBank(new Bank(null, "Alpha", 1D, 2D));
    var clientId1 = clientService.createClient(new Client(null, "ilya", true));
    var clientId2 = clientService.createClient(new Client(null, "denis", true));
    var accountNumber1 = bankService.addClient(clientId1, 1L, 3000D, bankIdPrior);
    var accountNumber2 = bankService.addClient(clientId2, 1L, 3000D, bankIdAlpha);
    var accountId1 = accountService.getAccountByNumber(accountNumber1).getId();
    var accountId2 = accountService.getAccountByNumber(accountNumber2).getId();
    translationService.makeTranslation(accountId1, accountId2, 100D);
    translationService.makeTranslation(accountId1, accountId2, 100D);
    translationService.makeTranslation(accountId1, accountId2, 100D);
    LocalDateTime from = LocalDateTime.now().minusMinutes(1);
    LocalDateTime to = LocalDateTime.now().plusMinutes(1);
    assertEquals(3,
        translationService.getExtractionByClientIdAndPeriod(
                clientId1,
                Date.from(from.atZone(ZoneId.systemDefault()).toInstant()),
                Date.from(to.atZone(ZoneId.systemDefault()).toInstant()))
            .size());
  }
}