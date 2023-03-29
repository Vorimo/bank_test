package com.ilya.bank.service;

import com.ilya.bank.connector.JDBCConnector;
import com.ilya.bank.domain.Client;
import com.ilya.bank.repository.ClientRepository;
import com.ilya.bank.repository.impl.ClientRepositoryImpl;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

class ClientServiceTest {

  private static ClientService clientService;

  @BeforeEach
  void setUp() {
    ClientRepository clientRepository = new ClientRepositoryImpl();
    clientService = new ClientService(clientRepository);
  }

  @AfterEach
  void tearDown() {
    JDBCConnector.getInstance().closeConnection();
  }

  @Test
  void createReadClientTest() {
    var clientId = clientService.createClient(new Client(null, "ilya", false));
    assertEquals("ilya", clientService.getClient(clientId).getName());
  }

  @Test
  void deleteClientTest() {
    var clientId = clientService.createClient(new Client(null, "ilya", false));
    clientService.deleteClient(clientId);
    assertNull(clientService.getClient(clientId));
  }
}