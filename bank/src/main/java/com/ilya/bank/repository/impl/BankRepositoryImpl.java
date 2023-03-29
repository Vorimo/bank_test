package com.ilya.bank.repository.impl;

import com.ilya.bank.connector.JDBCConnector;
import com.ilya.bank.domain.Bank;
import com.ilya.bank.repository.BankRepository;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static java.sql.Statement.RETURN_GENERATED_KEYS;

public class BankRepositoryImpl implements BankRepository {
  private static final Logger LOGGER = LogManager.getLogger(BankRepositoryImpl.class);

  @Override
  public long create(Bank bank) {
    long entityId = 0;
    Connection connection = JDBCConnector.getInstance().getConnection();
    try (PreparedStatement statement = connection.prepareStatement(
        "insert into banks(name, ind_commission, org_commission) values(?,?,?)", RETURN_GENERATED_KEYS)) {
      statement.setString(1, bank.getName());
      statement.setDouble(2, bank.getIndCommission());
      statement.setDouble(3, bank.getOrgCommission());
      statement.executeUpdate();
      var generatedKeys = statement.getGeneratedKeys();
      if (generatedKeys.next()) {
        entityId = generatedKeys.getLong(1);
        LOGGER.info(String.format("Bank #%s inserted", entityId));
      }
    } catch (SQLException e) {
      LOGGER.error("Error create bank", e);
    }
    return entityId;
  }

  @Override
  public Bank read(Long id) {
    Bank bank = null;
    Connection connection = JDBCConnector.getInstance().getConnection();
    try (PreparedStatement statement = connection.prepareStatement("select * from banks where id=?")) {
      statement.setLong(1, id);
      var result = statement.executeQuery();
      while (result.next()) {
        var name = result.getString(2);
        var indCommission = result.getDouble(3);
        var orgCommission = result.getDouble(4);
        LOGGER.info(String.format("Bank id=%s, name=%s, indCommission=%s, orgCommission=%s",
            id, name, indCommission, orgCommission));
        bank = new Bank(id, name, indCommission, orgCommission);
      }
    } catch (SQLException e) {
      LOGGER.error("Error read bank", e);
    }
    return bank;
  }

  @Override
  public boolean update(Bank bank) {
    return false;
  }

  @Override
  public boolean delete(Long id) {
    Connection connection = JDBCConnector.getInstance().getConnection();
    try (PreparedStatement statement = connection.prepareStatement(
        "delete from banks where id = ?")) {
      statement.setDouble(1, id);
      statement.executeUpdate();
      LOGGER.info(String.format("Bank #%s removed", id));
    } catch (SQLException e) {
      LOGGER.error("Error delete bank", e);
      return false;
    }
    return true;
  }
}