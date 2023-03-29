package com.ilya.bank.repository;


public interface ClientsAccountsRepository {

  Long create(Long clientId, Long accountId);
}