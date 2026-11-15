package pl.wsb.wtopa.scenario.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.wsb.wtopa.scenario.entity.ScenarioPost;

public interface ScenarioPostRepository extends JpaRepository<ScenarioPost, Long> {

    /** Posty na osi czasu scenariusza o podanej nazwie: zapytanie prowadzi przez relację scenario → name. */
    List<ScenarioPost> findByScenario_Name(String name);
}
