package pl.wsb.wtopa.scenario.entity;

import java.time.Duration;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Enumerated;
import jakarta.persistence.EnumType;
import jakarta.persistence.Embeddable;
import jakarta.persistence.Embedded;

enum Difficulty {
    EASY,
    MEDIUM,
    HARD
}

@Embeddable
class Budget {
    @Column(name = "amount")
    private int amount;

    @Column(name = "currency")
    private String currency;
}

@Entity
@Table(name = "scenario")
public class Scenario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Enumerated(EnumType.STRING)
    @Column(name = "difficulty", nullable = false, length = 6)
    private Difficulty difficulty;

    @Column(name = "duration+minutes")
    private int durationMinutes;

    @Embedded
    private Budget budget;
}
