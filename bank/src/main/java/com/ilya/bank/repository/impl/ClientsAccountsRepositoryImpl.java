package com.ilya.bank.repository.impl;

import com.ilya.bank.connector.JDBCConnector;
import com.ilya.bank.repository.ClientsAccountsRepository;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static java.sql.Statement.RETURN_GENERATED_KEYS;

public class ClientsAccountsRepositoryImpl implements ClientsAccountsRepository {
  private static final Logger LOGGER = LogManager.getLogger(ClientsAccountsRepositoryImpl.class);

  @Override
  public Long create(Long clientId, Long accountId) {
    long entityId = 0;
    Connection connection = JDBCConnector.getInstance().getConnection();
    try (PreparedStatement statement = connection.prepareStatement(
        "insert into clients_accounts(client_id, account_id) values(?, ?)", RETURN_GENERATED_KEYS)) {
      statement.setLong(1, clientId);
      statement.setLong(2, accountId);
      statement.executeUpdate();
      var generatedKeys = statement.getGeneratedKeys();
      if (generatedKeys.next()) {
        entityId = generatedKeys.getLong(1);
        LOGGER.info(String.format("ClientAccount #%s inserted", entityId));
      }
    } catch (SQLException e) {
      LOGGER.error("Error create clientAccount", e);
    }
    return entityId;
  }
}