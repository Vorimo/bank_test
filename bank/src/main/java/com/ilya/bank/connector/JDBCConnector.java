package com.ilya.bank.connector;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCConnector {
  private static final Logger LOGGER = LogManager.getLogger(JDBCConnector.class);

  private final String dbUrl = "jdbc:postgresql://localhost:5432/bank";
  private final String user = "postgres";
  private final String password = "postgres";
  private Connection connection;

  private JDBCConnector() {
  }

  private static JDBCConnector instance;

  public static JDBCConnector getInstance() {
    if (instance == null) {
      instance = new JDBCConnector();
    }
    return instance;
  }

  public Connection getConnection() {
    try {
      if (connection == null || connection.isClosed()) {
        connect();
      }
    } catch (SQLException e) {
      LOGGER.error("Error handling the connection", e);
    }
    return connection;
  }

  public void closeConnection() {
    try {
      if (connection != null) {
        connection.close();
      }
    } catch (SQLException e) {
      LOGGER.error("Error closing the connection", e);
    }
  }

  private void connect() {
    try {
      connection = DriverManager.getConnection(dbUrl, user, password);
    } catch (SQLException e) {
      LOGGER.error("Error establish the connection", e);
    }
  }
}