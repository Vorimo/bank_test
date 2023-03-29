package com.ilya.bank.domain;

public class Client {

  private Long id;
  private String name;
  private boolean individual;

  public Client(Long id, String name, boolean individual) {

    this.id = id;
    this.name = name;
    this.individual = individual;
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

  public boolean isIndividual() {
    return individual;
  }

  public void setIndividual(boolean individual) {
    this.individual = individual;
  }
}