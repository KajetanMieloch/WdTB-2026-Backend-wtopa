package pl.wsb.wtopa.runtime.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import pl.wsb.wtopa.users.entity.Users;

/**
 * Tabela łącząca wiele-do-wielu: w jednym przebiegu scenariusza bierze udział wielu uczestników,
 * a ten sam uczestnik gra w wielu przebiegach. Para ma własne dane (punkty, błędy, średni czas),
 * dlatego jest encją, a nie samym {@code @ManyToMany}.
 */
@Entity
@Table(name = "scenario_run_participant")
public class ScenarioRunParticipant {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "scenario_run_id", nullable = false)
    private ScenarioRun scenarioRun;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    private Users user;

    @Column(name = "points", nullable = false)
    private int points;

    @Column(name = "errors")
    private int errors;

    @Column(name = "average_time_seconds")
    private int averageTimeSeconds;

    protected ScenarioRunParticipant() {
    }

    public Long getId() {
        return id;
    }

    public ScenarioRun getScenarioRun() {
        return scenarioRun;
    }

    public Users getUser() {
        return user;
    }

    public int getPoints() {
        return points;
    }

    public int getErrors() {
        return errors;
    }

    public int getAverageTimeSeconds() {
        return averageTimeSeconds;
    }
}
