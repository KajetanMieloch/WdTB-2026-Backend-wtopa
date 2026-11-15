# Schemat bazy danych

Plik generują reguły projektu (panel Maven → Lifecycle → verify). Nie edytujcie go ręcznie.

Tabele: 6 · kolumny: 40 · relacje: 4 × @ManyToOne, 1 × @OneToMany, 1 × @OneToOne, 0 × @ManyToMany

| Tabela | Encja | Kolumny | Klucze obce |
|---|---|---|---|
| scenario | Scenario | 7 | — |
| scenario_post | ScenarioPost | 7 | scenario_id |
| scenario_run | ScenarioRun | 9 | scenario_id |
| scenario_run_participant | ScenarioRunParticipant | 6 | scenario_run_id, user_id |
| user_account | UserAccount | 5 | — |
| users | Users | 6 | user_account_id |

```mermaid
erDiagram
    scenario {
        Long id PK
        int amount
        String currency
        String description
        Difficulty difficulty
        int duration_minutes
        String name
    }
    scenario_post {
        Long id PK
        String content
        int minute_offset
        String platform
        int reach
        Long scenario_id FK
        int sentiment
    }
    scenario_run {
        Long id PK
        int duration_minutes
        LocalDateTime end_time
        boolean is_finished
        Long scenario_id FK
        LocalDateTime start_time
        Map users_average_time
        Map users_errors
        Map users_points
    }
    scenario_run_participant {
        Long id PK
        int average_time_seconds
        int errors
        int points
        Long scenario_run_id FK
        Long user_id FK
    }
    user_account {
        Long id PK
        LocalDateTime created_at
        String display_name
        String email
        AccountRole role
    }
    users {
        Long id PK
        String email
        String name
        Role role
        String surname
        Long user_account_id FK
    }
    scenario ||--o{ scenario_post : "scenario_id"
    scenario ||--o{ scenario_run : "scenario_id"
    scenario_run ||--o{ scenario_run_participant : "scenario_run_id"
    user_account |o--o| users : "user_account_id"
    users ||--o{ scenario_run_participant : "user_id"
```
