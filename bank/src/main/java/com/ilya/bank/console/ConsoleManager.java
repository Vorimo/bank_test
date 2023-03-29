package com.ilya.bank.console;

import com.ilya.bank.connector.JDBCConnector;
import com.ilya.bank.console.action.Command;
import com.ilya.bank.console.action.impl.AddBankClientCommand;
import com.ilya.bank.console.action.impl.CreateBankCommand;
import com.ilya.bank.console.action.impl.CreateClientCommand;
import com.ilya.bank.console.action.impl.GetAccountByNumberCommand;
import com.ilya.bank.console.action.impl.GetAllAccountsCommand;
import com.ilya.bank.console.action.impl.GetBankCommand;
import com.ilya.bank.console.action.impl.GetClientCommand;
import com.ilya.bank.console.action.impl.GetTranslationExtractionCommand;
import com.ilya.bank.console.action.impl.MakeTranslationCommand;
import com.ilya.bank.console.action.impl.PrintCommand;
import com.ilya.bank.console.action.impl.RemoveAccountCommand;
import com.ilya.bank.console.action.impl.RemoveBankCommand;
import com.ilya.bank.console.action.impl.RemoveClientCommand;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import static com.ilya.bank.enums.ConsoleCommandsEnum.ADD_BANK_CLIENT;
import static com.ilya.bank.enums.ConsoleCommandsEnum.CREATE_BANK;
import static com.ilya.bank.enums.ConsoleCommandsEnum.CREATE_CLIENT;
import static com.ilya.bank.enums.ConsoleCommandsEnum.GET_ACCOUNT_BY_NUMBER;
import static com.ilya.bank.enums.ConsoleCommandsEnum.GET_ALL_ACCOUNTS;
import static com.ilya.bank.enums.ConsoleCommandsEnum.GET_BANK;
import static com.ilya.bank.enums.ConsoleCommandsEnum.GET_CLIENT;
import static com.ilya.bank.enums.ConsoleCommandsEnum.GET_COMMANDS;
import static com.ilya.bank.enums.ConsoleCommandsEnum.GET_TRANSLATIONS_EXTRACTION;
import static com.ilya.bank.enums.ConsoleCommandsEnum.MAKE_TRANSLATION;
import static com.ilya.bank.enums.ConsoleCommandsEnum.REMOVE_ACCOUNT;
import static com.ilya.bank.enums.ConsoleCommandsEnum.REMOVE_BANK;
import static com.ilya.bank.enums.ConsoleCommandsEnum.REMOVE_CLIENT;

public class ConsoleManager {
  private static final Logger LOGGER = LogManager.getLogger(ConsoleManager.class);

  private static final Map<String, Command> actionMap = new HashMap<>() {{
    put(GET_COMMANDS.getName(), new PrintCommand());
    put(CREATE_BANK.getName(), new CreateBankCommand());
    put(GET_BANK.getName(), new GetBankCommand());
    put(REMOVE_BANK.getName(), new RemoveBankCommand());
    put(ADD_BANK_CLIENT.getName(), new AddBankClientCommand());
    put(CREATE_CLIENT.getName(), new CreateClientCommand());
    put(GET_CLIENT.getName(), new GetClientCommand());
    put(REMOVE_CLIENT.getName(), new RemoveClientCommand());
    put(GET_ALL_ACCOUNTS.getName(), new GetAllAccountsCommand());
    put(GET_ACCOUNT_BY_NUMBER.getName(), new GetAccountByNumberCommand());
    put(REMOVE_ACCOUNT.getName(), new RemoveAccountCommand());
    put(MAKE_TRANSLATION.getName(), new MakeTranslationCommand());
    put(GET_TRANSLATIONS_EXTRACTION.getName(), new GetTranslationExtractionCommand());
  }};

  /**
   * Reads the command, parses it and executes service accordingly
   */
  public void readCommand() {
    LOGGER.info("Enter your command...");
    Scanner scanner = new Scanner(System.in);
    var enteredLine = scanner.nextLine().trim();
    var enteredLineParts = enteredLine.split(" ");
    var command = enteredLineParts[0];
    //remove the command itself
    var enteredParams = Arrays.copyOfRange(enteredLineParts, 1, enteredLineParts.length);
    if (!actionMap.containsKey(command)) {
      //execute the command that prints the help
      new PrintCommand().execute(enteredParams);
    } else {
      //execute other commands
      actionMap.get(command).execute(enteredParams);
    }
    JDBCConnector.getInstance().closeConnection();
    System.exit(200);
  }
}