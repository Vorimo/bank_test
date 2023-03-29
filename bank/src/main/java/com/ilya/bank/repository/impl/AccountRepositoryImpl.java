package com.ilya.bank.repository.impl;

import com.ilya.bank.connector.JDBCConnector;
import com.ilya.bank.domain.Account;
import com.ilya.bank.repository.AccountRepository;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static java.sql.Statement.RETURN_GENERATED_KEYS;

public class AccountRepositoryImpl implements AccountRepository {
  private static final Logger LOGGER = LogManager.getLogger(AccountRepositoryImpl.class);

  @Override
  public Long create(Account account) {
    long entityId = 0;
    Connection connection = JDBCConnector.getInstance().getConnection();
    try (PreparedStatement statement = connection.prepareStatement(
        "insert into accounts(number, bank_id, currency_id, amount) values(?, ?, ?, ?)", RETURN_GENERATED_KEYS)) {
      statement.setString(1, account.getNumber());
      statement.setLong(2, account.getBankId());
      statement.setLong(3, account.getCurrencyId());
      statement.setDouble(4, account.getAmount());
      statement.executeUpdate();
      var generatedKeys = statement.getGeneratedKeys();
      if (generatedKeys.next()) {
        entityId = generatedKeys.getLong(1);
        LOGGER.info(String.format("Account #%s inserted", entityId));
      }
    } catch (SQLException e) {
      LOGGER.error("Error create account", e);
    }
    return entityId;
  }

  @Override
  public Account read(Long id) {
    Account account = null;
    Connection connection = JDBCConnector.getInstance().getConnection();
    try (PreparedStatement statement = connection.prepareStatement("select * from accounts where id=?")) {
      statement.setLong(1, id);
      var result = statement.executeQuery();
      while (result.next()) {
        var number = result.getString(2);
        var bankId = result.getLong(3);
        var currencyId = result.getLong(4);
        var amount = result.getDouble(5);
        LOGGER.info(String.format("Account id=%s, number=%s, bankId=%s, currencyId=%s, amount=%s",
            id, number, bankId, currencyId, amount));
        account = new Account(id, number, bankId, currencyId, amount);
      }
    } catch (SQLException e) {
      LOGGER.error("Error read bank", e);
    }
    return account;
  }

  @Override
  public Account readByNumber(String number) {
    Account account = null;
    Connection connection = JDBCConnector.getInstance().getConnection();
    try (PreparedStatement statement = connection.prepareStatement("select * from accounts where number=?")) {
      statement.setString(1, number);
      var result = statement.executeQuery();
      while (result.next()) {
        var id = result.getLong(1);
        var bankId = result.getLong(3);
        var currencyId = result.getLong(4);
        var amount = result.getDouble(5);
        LOGGER.info(String.format("Account id=%s, number=%s, bankId=%s, currencyId=%s, amount=%s",
            id, number, bankId, currencyId, amount));
        account = new Account(id, number, bankId, currencyId, amount);
      }
    } catch (SQLException e) {
      LOGGER.error("Error read bank", e);
    }
    return account;
  }

  @Override
  public List<Account> readAllByClientId(Long clientId) {
    List<Account> accounts = new ArrayList<>();
    Connection connection = JDBCConnector.getInstance().getConnection();
    try (PreparedStatement statement = connection.prepareStatement(
        "select * from accounts a join clients_accounts ca on a.id = ca.account_id where ca.client_id=?")) {
      statement.setLong(1, clientId);
      var result = statement.executeQuery();
      LOGGER.info("Accounts:");
      while (result.next()) {
        var id = result.getLong(1);
        var number = result.getString(2);
        var bankId = result.getLong(3);
        var currencyId = result.getLong(4);
        var amount = result.getDouble(5);
        LOGGER.info(String.format("Account number=%s, amount=%s, currencyId=%s",
            number, amount, currencyId));
        accounts.add(new Account(id, number, bankId, currencyId, amount));
      }
    } catch (SQLException e) {
      LOGGER.error("Error read bank", e);
    }
    return accounts;
  }

  @Override
  public boolean increaseAmount(Long id, Double amountToAdd) {
    Connection connection = JDBCConnector.getInstance().getConnection();
    try (PreparedStatement statement = connection.prepareStatement(
        "update accounts set amount = amount + ? where id = ?")) {
      statement.setDouble(1, amountToAdd);
      statement.setLong(2, id);
      statement.executeUpdate();
        LOGGER.info(String.format("Account #%s updated", id));
    } catch (SQLException e) {
      LOGGER.error("Error create account", e);
      return false;
    }
    return true;
  }

  @Override
  public boolean delete(Long id) {
    Connection connection = JDBCConnector.getInstance().getConnection();
    try (PreparedStatement statement = connection.prepareStatement(
        "delete from accounts where id = ?")) {
      statement.setDouble(1, id);
      statement.executeUpdate();
      LOGGER.info(String.format("Account #%s removed", id));
    } catch (SQLException e) {
      LOGGER.error("Error delete account", e);
      return false;
    }
    return true;
  }
}