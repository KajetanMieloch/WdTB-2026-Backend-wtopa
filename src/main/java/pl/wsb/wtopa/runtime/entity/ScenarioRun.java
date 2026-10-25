package pl.wsb.wtopa.runtime.entity;

import java.time.LocalDateTime;
import java.util.Map;

import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.type.SqlTypes;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "scenario_run")
public class ScenarioRun {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "start_time", nullable = false)
    private LocalDateTime startTime;

    @Column(name = "end_time", nullable = false)
    private LocalDateTime endTime;

    @Column(name = "duration_minutes")
    private int durationMinutes;

    @Column(name = "is_finished")
    private boolean isFinished;

    /** Klucz to email uczestnika, wartość to jego punkty. Skład osób zmienia się między runami. */
    @JdbcTypeCode(SqlTypes.JSON)
    @Column(name = "users_points", nullable = false)
    private Map<String, Integer> usersPoints;

    /** Klucz to email uczestnika, wartość to liczba jego błędów. */
    @JdbcTypeCode(SqlTypes.JSON)
    @Column(name = "users_errors", nullable = false)
    private Map<String, Integer> usersErrors;

    /** Klucz to email uczestnika, wartość to jego średni czas w sekundach. */
    @JdbcTypeCode(SqlTypes.JSON)
    @Column(name = "users_average_time", nullable = false)
    private Map<String, Integer> usersAverageTime;

    protected ScenarioRun() {
    }
}
