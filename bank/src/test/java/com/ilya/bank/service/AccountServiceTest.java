package com.ilya.bank.service;

import com.ilya.bank.connector.JDBCConnector;
import com.ilya.bank.domain.Bank;
import com.ilya.bank.domain.Client;
import com.ilya.bank.repository.AccountRepository;
import com.ilya.bank.repository.BankRepository;
import com.ilya.bank.repository.ClientRepository;
import com.ilya.bank.repository.ClientsAccountsRepository;
import com.ilya.bank.repository.impl.AccountRepositoryImpl;
import com.ilya.bank.repository.impl.BankRepositoryImpl;
import com.ilya.bank.repository.impl.ClientRepositoryImpl;
import com.ilya.bank.repository.impl.ClientsAccountsRepositoryImpl;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class AccountServiceTest {

  private static AccountService accountService;
  private static BankService bankService;
  private static ClientService clientService;

  @BeforeEach
  void setUp() {
    AccountRepository accountRepository = new AccountRepositoryImpl();
    accountService = new AccountService(accountRepository);
    ClientRepository clientRepository = new ClientRepositoryImpl();
    clientService = new ClientService(clientRepository);
    BankRepository bankRepository = new BankRepositoryImpl();
    ClientsAccountsRepository clientsAccountsRepository = new ClientsAccountsRepositoryImpl();
    bankService = new BankService(bankRepository, accountRepository, clientsAccountsRepository);
  }

  @AfterEach
  void tearDown() {
    JDBCConnector.getInstance().closeConnection();
  }

  @Test
  void getClientAllAccountsTest() {
    var bankIdPrior = bankService.createBank(new Bank(null, "Prior", 5D, 10D));
    var bankIdAlpha = bankService.createBank(new Bank(null, "Alpha", 5D, 10D));
    var clientId = clientService.createClient(new Client(null, "ilya", true));
    bankService.addClient(clientId, 1L, 3000D, bankIdPrior);
    bankService.addClient(clientId, 1L, 3000D, bankIdAlpha);
    assertEquals(2, accountService.getClientAllAccounts(clientId).size());
  }

  @Test
  void deleteAccountTest() {
    var bankIdPrior = bankService.createBank(new Bank(null, "Prior", 5D, 10D));
    var clientId = clientService.createClient(new Client(null, "ilya", true));
    var accountNumber = bankService.addClient(clientId, 1L, 3000D, bankIdPrior);
    var account = accountService.getAccountByNumber(accountNumber);
    accountService.deleteAccount(account.getId());
    assertNull(accountService.getAccountByNumber(accountNumber));
  }
}