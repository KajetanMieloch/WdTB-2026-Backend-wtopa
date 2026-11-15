package pl.wsb.wtopa.scenario.entity;

import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.OneToMany;
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

    @Column(name = "name", nullable = false, length = 100)
    private String name;

    @Column(name = "description")
    private String description;

    @Enumerated(EnumType.STRING)
    @Column(name = "difficulty", nullable = false, length = 6)
    private Difficulty difficulty;

    @Column(name = "duration_minutes")
    private int durationMinutes;

    @Embedded
    private Budget budget;

    /** Druga strona relacji ScenarioPost.scenario: posty tworzące oś czasu tego scenariusza. */
    @OneToMany(mappedBy = "scenario")
    private List<ScenarioPost> posts = new ArrayList<>();

    public List<ScenarioPost> getPosts() {
        return posts;
    }
}
