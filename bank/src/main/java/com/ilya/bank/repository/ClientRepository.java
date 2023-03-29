package com.ilya.bank.repository;

import com.ilya.bank.domain.Client;

public interface ClientRepository {

  Long create(Client client);

  Client read(Long id);

  Client readByAccountId(Long accountId);

  boolean update(Client client);

  boolean delete(Long id);
}