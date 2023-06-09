package com.ilya.bank.domain;

public class Currency {

  private Long id;
  private String name;

  public Currency(Long id, String name) {
    this.id = id;

    this.name = name;
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }
}