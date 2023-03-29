package com.ilya.bank.domain;

import java.util.Date;

public class Translation {

  private Long id;
  private Long accountFrom;
  private Long accountTo;
  private Double amount;
  private Date date;

  public Translation(Long id, Long accountFrom, Long accountTo, Double amount, Date date) {
    this.id = id;
    this.accountFrom = accountFrom;
    this.accountTo = accountTo;

    this.amount = amount;
    this.date = date;
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public Long getAccountFrom() {
    return accountFrom;
  }

  public void setAccountFrom(Long accountFrom) {
    this.accountFrom = accountFrom;
  }

  public Long getAccountTo() {
    return accountTo;
  }

  public void setAccountTo(Long accountTo) {
    this.accountTo = accountTo;
  }

  public Double getAmount() {
    return amount;
  }

  public void setAmount(Double amount) {
    this.amount = amount;
  }

  public Date getDate() {
    return date;
  }

  public void setDate(Date date) {
    this.date = date;
  }
}