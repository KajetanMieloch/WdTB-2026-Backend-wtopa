package pl.wsb.wtopa.runtime.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.wsb.wtopa.runtime.entity.ScenarioRunParticipant;

public interface ScenarioRunParticipantRepository extends JpaRepository<ScenarioRunParticipant, Long> {

    /** Udziały w przebiegach jednej osoby: zapytanie prowadzi przez relację user → email. */
    List<ScenarioRunParticipant> findByUser_Email(String email);
}
