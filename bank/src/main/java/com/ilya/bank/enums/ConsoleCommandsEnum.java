package com.ilya.bank.enums;

public enum ConsoleCommandsEnum {

  GET_COMMANDS("get_commands", "get_commands"),
  CREATE_BANK("create_bank", "create bank (name, indCommission, orgCommission)"),
  GET_BANK("get_bank", "get_bank (bankId)"),
  REMOVE_BANK("remove_bank", "remove_bank (bankId)"),
  ADD_BANK_CLIENT("add_bank_client", "add_bank_client (clientId, currencyId, amount, bankId)"),
  CREATE_CLIENT("create_client", "create_client (name, isIndividual)"),
  GET_CLIENT("get_client", "get_client (clientId)"),
  REMOVE_CLIENT("remove_client", "remove_client (clientId)"),
  GET_ALL_ACCOUNTS("get_all_accounts", "get_all_accounts (client_id)"),
  GET_ACCOUNT_BY_NUMBER("get_account_by_number", "get_account_by_number (number)"),
  REMOVE_ACCOUNT("remove_account", "remove_account (accountId)"),
  MAKE_TRANSLATION("make_translation", "make_translation (senderAccountId, consumerAccountId, amount)"),
  GET_TRANSLATIONS_EXTRACTION("translation_extraction", "translation_extraction (clientId, dateStart, dateEnd)");

  private final String name;
  private final String description;

  ConsoleCommandsEnum(String name, String description) {
    this.name = name;
    this.description = description;
  }

  public String getName() {
    return this.name;
  }

  public String getDescription() {
    return description;
  }
}