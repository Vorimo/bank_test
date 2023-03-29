package com.ilya.bank.console.action.impl;

import com.ilya.bank.console.action.Command;
import com.ilya.bank.enums.ConsoleCommandsEnum;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.Arrays;

public class PrintCommand implements Command {
  private static final Logger LOGGER = LogManager.getLogger(PrintCommand.class);

  @Override
  public void execute(String[] params) {
    LOGGER.info(String.format("Available commands are: \n%s",
        Arrays.stream(ConsoleCommandsEnum.values())
            .map(ConsoleCommandsEnum::getDescription)
            .toList()));
  }
}