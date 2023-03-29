package com.ilya.bank.repository;

import com.ilya.bank.domain.Translation;

import java.util.Date;
import java.util.List;

public interface TranslationRepository {

  Long create(Translation translation);

  Translation read(Long id);

  List<Translation> readAllByClientIdForPeriod(Long clientId, Date start, Date end);

  boolean update(Translation translation);

  boolean delete(Long id);
}