package com.ilya.bank.repository.impl;

import com.ilya.bank.connector.JDBCConnector;
import com.ilya.bank.domain.Client;
import com.ilya.bank.repository.ClientRepository;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static java.sql.Statement.RETURN_GENERATED_KEYS;

public class ClientRepositoryImpl implements ClientRepository {
  private static final Logger LOGGER = LogManager.getLogger(ClientRepositoryImpl.class);

  @Override
  public Long create(Client client) {
    long entityId = 0;
    Connection connection = JDBCConnector.getInstance().getConnection();
    try (PreparedStatement statement = connection.prepareStatement(
        "insert into clients(name, individual) values(?, ?)", RETURN_GENERATED_KEYS)) {
      statement.setString(1, client.getName());
      statement.setBoolean(2, client.isIndividual());
      statement.executeUpdate();
      var generatedKeys = statement.getGeneratedKeys();
      if (generatedKeys.next()) {
        entityId = generatedKeys.getLong(1);
        LOGGER.info(String.format("Client #%s inserted", entityId));
      }
    } catch (SQLException e) {
      LOGGER.info("Error create client " + e.getMessage());
    }
    return entityId;
  }

  @Override
  public Client read(Long id) {
    Client client = null;
    Connection connection = JDBCConnector.getInstance().getConnection();
    try (PreparedStatement statement = connection.prepareStatement("select * from clients where id=?")) {
      statement.setLong(1, id);
      var result = statement.executeQuery();
      while (result.next()) {
        var name = result.getString(2);
        var isIndividual = result.getBoolean(3);
        LOGGER.info(String.format("Client id=%s, name=%s, individual=%s",
            id, name, isIndividual));
        client = new Client(id, name, isIndividual);
      }
    } catch (SQLException e) {
      LOGGER.error("Error read client", e);
    }
    return client;
  }

  @Override
  public Client readByAccountId(Long accountId) {
    Client client = null;
    Connection connection = JDBCConnector.getInstance().getConnection();
    try (PreparedStatement statement = connection.prepareStatement(
        "select * from clients join clients_accounts ca on clients.id = ca.client_id where ca.account_id = ?")) {
      statement.setLong(1, accountId);
      var result = statement.executeQuery();
      while (result.next()) {
        var name = result.getString(2);
        var isIndividual = result.getBoolean(3);
        LOGGER.info(String.format("Client id=%s, name=%s, individual=%s",
            accountId, name, isIndividual));
        client = new Client(accountId, name, isIndividual);
      }
    } catch (SQLException e) {
      LOGGER.error("Error read client", e);
    }
    return client;
  }

  @Override
  public boolean update(Client client) {
    return false;
  }

  @Override
  public boolean delete(Long id) {
    Connection connection = JDBCConnector.getInstance().getConnection();
    try (PreparedStatement statement = connection.prepareStatement(
        "delete from clients where id = ?")) {
      statement.setDouble(1, id);
      statement.executeUpdate();
      LOGGER.info(String.format("Client #%s removed", id));
    } catch (SQLException e) {
      LOGGER.error("Error delete client", e);
      return false;
    }
    return true;
  }
}