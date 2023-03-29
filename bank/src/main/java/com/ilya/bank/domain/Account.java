package com.ilya.bank.domain;

public class Account {

  private Long id;
  private String number;
  private Long bankId;
  private Long currencyId;
  private Double amount;

  public Account(Long id, String number, Long bankId, Long currencyId, Double amount) {
    this.id = id;
    this.number = number;
    this.bankId = bankId;
    this.currencyId = currencyId;
    this.amount = amount;
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getNumber() {
    return number;
  }

  public void setNumber(String number) {
    this.number = number;
  }

  public Long getBankId() {
    return bankId;
  }

  public void setBankId(Long bankId) {
    this.bankId = bankId;
  }

  public Long getCurrencyId() {
    return currencyId;
  }

  public void setCurrencyId(Long currencyId) {
    this.currencyId = currencyId;
  }

  public Double getAmount() {
    return amount;
  }

  public void setAmount(Double amount) {
    this.amount = amount;
  }
}