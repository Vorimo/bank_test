package com.ilya.bank.service;

import com.ilya.bank.domain.Client;
import com.ilya.bank.repository.ClientRepository;

public class ClientService {

  private final ClientRepository clientRepository;


  public ClientService(ClientRepository clientRepository) {
    this.clientRepository = clientRepository;
  }

  public Long createClient(Client client) {
    return clientRepository.create(client);
  }

  public Client getClient(Long id) {
    return clientRepository.read(id);
  }

  public boolean deleteClient(Long id) {
    return clientRepository.delete(id);
  }
}