package com.ilya.bank.service;

import com.ilya.bank.domain.Account;
import com.ilya.bank.domain.Bank;
import com.ilya.bank.repository.AccountRepository;
import com.ilya.bank.repository.BankRepository;
import com.ilya.bank.repository.ClientsAccountsRepository;

import java.util.UUID;

public class BankService {

  private final BankRepository bankRepository;
  private final AccountRepository accountRepository;
  private final ClientsAccountsRepository clientsAccountsRepository;

  public BankService(BankRepository bankRepository, AccountRepository accountRepository, ClientsAccountsRepository clientsAccountsRepository) {
    this.bankRepository = bankRepository;
    this.accountRepository = accountRepository;
    this.clientsAccountsRepository = clientsAccountsRepository;
  }

  public Long createBank(Bank bank) {
    return bankRepository.create(bank);
  }

  public boolean deleteBank(Long id) {
    return bankRepository.delete(id);
  }

  public Bank getBank(Long id) {
    return bankRepository.read(id);
  }

  public String addClient(Long clientId, Long currencyId, Double amount, Long bankId) {
    var accountNumber = UUID.randomUUID().toString();
    var accountId = accountRepository.create(new Account(null, accountNumber, bankId, currencyId, amount));
    clientsAccountsRepository.create(clientId, accountId);
    return accountNumber;
  }
}