package com.ilya.bank.console.action.impl;

import com.ilya.bank.console.action.Command;
import com.ilya.bank.repository.ClientRepository;
import com.ilya.bank.repository.impl.ClientRepositoryImpl;
import com.ilya.bank.service.ClientService;

public class RemoveClientCommand implements Command {

  @Override
  public void execute(String[] params) {
    ClientRepository clientRepository = new ClientRepositoryImpl();
    ClientService clientService = new ClientService(clientRepository);
    clientService.deleteClient(Long.valueOf(params[0]));
  }
}