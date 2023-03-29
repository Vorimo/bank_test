package com.ilya.bank.domain;

public class Bank {

  private Long id;
  private String name;
  private Double indCommission;
  private Double orgCommission;

  public Bank(Long id, String name, Double indCommission, Double orgCommission) {
    this.id = id;
    this.name = name;
    this.indCommission = indCommission;
    this.orgCommission = orgCommission;
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

  public Double getIndCommission() {
    return indCommission;
  }

  public void setIndCommission(Double indCommission) {
    this.indCommission = indCommission;
  }

  public Double getOrgCommission() {
    return orgCommission;
  }

  public void setOrgCommission(Double orgCommission) {
    this.orgCommission = orgCommission;
  }
}