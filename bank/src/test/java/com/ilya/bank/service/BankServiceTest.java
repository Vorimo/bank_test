package com.ilya.bank.service;

import com.ilya.bank.connector.JDBCConnector;
import com.ilya.bank.domain.Bank;
import com.ilya.bank.domain.Client;
import com.ilya.bank.repository.AccountRepository;
import com.ilya.bank.repository.BankRepository;
import com.ilya.bank.repository.ClientsAccountsRepository;
import com.ilya.bank.repository.ClientRepository;
import com.ilya.bank.repository.impl.AccountRepositoryImpl;
import com.ilya.bank.repository.impl.ClientsAccountsRepositoryImpl;
import com.ilya.bank.repository.impl.BankRepositoryImpl;
import com.ilya.bank.repository.impl.ClientRepositoryImpl;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

class BankServiceTest {

  private static BankService bankService;
  private static ClientService clientService;
  private static AccountService accountService;

  @BeforeAll
  static void setUp() {
    BankRepository bankRepository = new BankRepositoryImpl();
    ClientRepository clientRepository = new ClientRepositoryImpl();
    AccountRepository accountRepository = new AccountRepositoryImpl();
    ClientsAccountsRepository clientsAccountsRepository = new ClientsAccountsRepositoryImpl();
    bankService = new BankService(bankRepository, accountRepository, clientsAccountsRepository);
    clientService = new ClientService(clientRepository);
    accountService = new AccountService(accountRepository);
  }

  @AfterAll
  static void tearDown() {
    JDBCConnector.getInstance().closeConnection();
  }

  @Test
  void createBankTest() {
    var id = bankService.createBank(new Bank(null, "Prior", 5D, 10D));
    assertEquals("Prior", bankService.getBank(id).getName());
  }

  @Test
  void addClientTest() {
    var bankId = bankService.createBank(new Bank(null, "Prior", 5D, 10D));
    var clientId = clientService.createClient(new Client(null, "ilya", true));
    var accountNumber = bankService.addClient(clientId, 1L, 3000D, bankId);
    assertEquals(bankId, accountService.getAccountByNumber(accountNumber).getBankId());
  }

  @Test
  void deleteBankTest() {
    var bankId = bankService.createBank(new Bank(null, "Prior", 5D, 10D));
    bankService.deleteBank(bankId);
    assertNull(bankService.getBank(bankId));
  }
}