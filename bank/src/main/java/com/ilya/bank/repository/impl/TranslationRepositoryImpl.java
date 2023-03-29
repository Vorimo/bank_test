package com.ilya.bank.repository.impl;

import com.ilya.bank.connector.JDBCConnector;
import com.ilya.bank.domain.Translation;
import com.ilya.bank.repository.TranslationRepository;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static java.sql.Statement.RETURN_GENERATED_KEYS;

public class TranslationRepositoryImpl implements TranslationRepository {
  private static final Logger LOGGER = LogManager.getLogger(TranslationRepositoryImpl.class);

  @Override
  public Long create(Translation translation) {
    long entityId = 0;
    Connection connection = JDBCConnector.getInstance().getConnection();
    try (PreparedStatement statement = connection.prepareStatement(
        "insert into translations(account_from, account_to, amount, date) values(?,?,?,?)",
        RETURN_GENERATED_KEYS)) {
      statement.setLong(1, translation.getAccountFrom());
      statement.setLong(2, translation.getAccountTo());
      statement.setDouble(3, translation.getAmount());
      var sqlDateNow = new java.sql.Date(
          Date.from(
              LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant()
          ).getTime()
      );
      statement.setDate(4, sqlDateNow);
      statement.executeUpdate();
      var generatedKeys = statement.getGeneratedKeys();
      if (generatedKeys.next()) {
        entityId = generatedKeys.getLong(1);
        LOGGER.info(String.format("Translation #%s inserted", entityId));
      }
    } catch (SQLException e) {
      LOGGER.error("Error create translation", e);
    }
    return entityId;
  }

  @Override
  public Translation read(Long id) {
    return null;
  }

  @Override
  public List<Translation> readAllByClientIdForPeriod(Long clientId, Date start, Date end) {
    List<Translation> translations = new ArrayList<>();
    Connection connection = JDBCConnector.getInstance().getConnection();
    try (PreparedStatement statement = connection.prepareStatement(
        """
            select * from translations
                join accounts a on a.id = translations.account_from
                join clients_accounts ca on a.id = ca.account_id
            join clients c on c.id = ca.client_id
            where client_id = ? and date between ? and ?""")) {
      statement.setLong(1, clientId);
      statement.setDate(2, new java.sql.Date(start.getTime()));
      statement.setDate(3, new java.sql.Date(end.getTime()));
      var result = statement.executeQuery();
      LOGGER.info("Translations:");
      while (result.next()) {
        var id = result.getLong(1);
        var accountFrom = result.getLong(2);
        var accountTo = result.getLong(3);
        var amount = result.getDouble(4);
        var date = result.getDate(5);
        LOGGER.info(String.format("Translation from=%s, to=%s, amount=%s, date=%s",
            accountFrom, accountTo, amount, date));
        translations.add(new Translation(id, accountFrom, accountTo, amount, date));
      }
    } catch (SQLException e) {
      LOGGER.error("Error read translations by clientId", e);
    }
    return translations;
  }

  @Override
  public boolean update(Translation translation) {
    return false;
  }

  @Override
  public boolean delete(Long id) {
    return false;
  }
}