package com.ilya.bank.console.action.impl;

import com.ilya.bank.console.action.Command;
import com.ilya.bank.domain.Client;
import com.ilya.bank.repository.ClientRepository;
import com.ilya.bank.repository.impl.ClientRepositoryImpl;
import com.ilya.bank.service.ClientService;

public class CreateClientCommand implements Command {

  @Override
  public void execute(String[] params) {
    ClientRepository clientRepository = new ClientRepositoryImpl();
    ClientService clientService = new ClientService(clientRepository);
    Client client = new Client(null, params[0], Boolean.parseBoolean(params[1]));
    clientService.createClient(client);
  }
}