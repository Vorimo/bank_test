package com.ilya.bank.service;

import com.ilya.bank.domain.Translation;
import com.ilya.bank.repository.AccountRepository;
import com.ilya.bank.repository.BankRepository;
import com.ilya.bank.repository.ClientRepository;
import com.ilya.bank.repository.TranslationRepository;

import java.util.Date;
import java.util.List;
import java.util.Objects;

public class TranslationService {

  private final TranslationRepository translationRepository;
  private final AccountRepository accountRepository;
  private final BankRepository bankRepository;
  private final ClientRepository clientRepository;

  public TranslationService(TranslationRepository translationRepository, AccountRepository accountRepository,
                            BankRepository bankRepository, ClientRepository clientRepository) {
    this.translationRepository = translationRepository;
    this.accountRepository = accountRepository;
    this.bankRepository = bankRepository;
    this.clientRepository = clientRepository;
  }

  public Long makeTranslation(Long idFrom, Long idTo, Double amount) {
    var accountFrom = accountRepository.read(idFrom);
    var accountTo = accountRepository.read(idTo);
    Double amountToTranslate = amount;
    if (!Objects.equals(accountFrom.getBankId(), accountTo.getBankId())) {
      Double commission;
      var bankFrom = bankRepository.read(accountFrom.getBankId());
      var clientFrom = clientRepository.readByAccountId(idFrom);
      if (clientFrom.isIndividual()) {
        commission = bankFrom.getIndCommission();
      } else {
        commission = bankFrom.getOrgCommission();
      }
      amountToTranslate += (amountToTranslate / 100 * commission);
    }
    var translationId = translationRepository.create(new Translation(null, idFrom, idTo, amount, null));
    accountRepository.increaseAmount(idFrom, -amountToTranslate);
    accountRepository.increaseAmount(idTo, amount);
    return translationId;
  }

  public List<Translation> getExtractionByClientIdAndPeriod(Long clientId, Date start, Date end) {
    return translationRepository.readAllByClientIdForPeriod(clientId, start, end);
  }
}