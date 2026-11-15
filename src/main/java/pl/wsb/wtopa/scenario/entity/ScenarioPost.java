package pl.wsb.wtopa.scenario.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

/**
 * Post na osi czasu scenariusza: kiedy (minuta od startu), gdzie (platforma), co i jak bardzo boli
 * (sentyment od -100 do 100, zasięg). Wiele postów należy do jednego scenariusza.
 */
@Entity
@Table(name = "scenario_post")
public class ScenarioPost {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "scenario_id", nullable = false)
    private Scenario scenario;

    @Column(name = "minute_offset", nullable = false)
    private int minuteOffset;

    @Column(name = "platform", nullable = false, length = 30)
    private String platform;

    @Column(name = "content", nullable = false, length = 500)
    private String content;

    @Column(name = "sentiment")
    private int sentiment;

    @Column(name = "reach")
    private int reach;

    protected ScenarioPost() {
    }

    public Long getId() {
        return id;
    }

    public Scenario getScenario() {
        return scenario;
    }

    public int getMinuteOffset() {
        return minuteOffset;
    }

    public String getPlatform() {
        return platform;
    }

    public String getContent() {
        return content;
    }

    public int getSentiment() {
        return sentiment;
    }

    public int getReach() {
        return reach;
    }
}
