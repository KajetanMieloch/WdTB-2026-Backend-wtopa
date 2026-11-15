-- Dane startowe aplikacji. Tabele tworzy Hibernate z encji, a ten plik Spring Boot uruchamia zaraz potem.
-- LAB 02: dopiszcie dane do swoich tabel (kolejność: najpierw tabele, na które wskazują klucze obce).
insert into user_account (email, display_name, role, created_at) values
    ('ola@student.merito.pl',   'Ola',   'USER',    current_timestamp),
    ('kuba@student.merito.pl',  'Kuba',  'USER',    current_timestamp),
    ('firma@example.com',       'Firma', 'PARTNER', current_timestamp),
    ('admin@example.com',       'Admin', 'ADMIN',   current_timestamp);

-- konta zespołu (początek)
insert into user_account (email, display_name, role, created_at) values
    ('s040248@student.wroclaw.merito.pl', 'Kajetan Mieloch', 'USER', current_timestamp),
    ('s553022@student.wroclaw.merito.pl', 'Paweł Szydłowski', 'USER', current_timestamp),
    ('s040248+majetan@student.wroclaw.merito.pl', 'Majetan Kieloch', 'USER', current_timestamp);
-- konta zespołu (koniec)

-- LAB 03: user_account_id to numer wiersza z sekcji user_account (5 = Kajetan, 6 = Paweł, 7 = Majetan)
insert into users (name, surname, email, role, user_account_id) values
    ('Kajetan', 'Mieloch', 's040248@student.wroclaw.merito.pl', 'USER', 5),
    ('Paweł', 'Szydłowski', 's553022@student.wroclaw.merito.pl', 'USER', 6),
    ('Majetan', 'Kieloch', 's040248+majetan@student.wroclaw.merito.pl', 'CONTRACTOR', 7);

insert into scenario (name, description, difficulty, duration_minutes, amount, currency) values
    ('Wyciek danych', 'Klient traci bazę klientów', 'HARD', 45, 5000, 'PLN'),
    ('Hejt w social media', 'Fala negatywnych komentarzy', 'MEDIUM', 30, 2000, 'PLN'),
    ('Błędna reklama', 'Kampania z błędnym claimem', 'EASY', 20, 1000, 'PLN');

insert into scenario_run (scenario_id, start_time, end_time, duration_minutes, is_finished, users_points, users_errors, users_average_time) values
    (1, '2026-10-20 10:00:00', '2026-10-20 11:00:00', 60, true,
     '{"s040248@student.wroclaw.merito.pl": 12, "s553022@student.wroclaw.merito.pl": 8}',
     '{"s040248@student.wroclaw.merito.pl": 1, "s553022@student.wroclaw.merito.pl": 3}',
     '{"s040248@student.wroclaw.merito.pl": 40, "s553022@student.wroclaw.merito.pl": 55}'),
    (2, '2026-10-21 14:00:00', '2026-10-21 15:30:00', 90, true,
     '{"s553022@student.wroclaw.merito.pl": 5}',
     '{"s553022@student.wroclaw.merito.pl": 2}',
     '{"s553022@student.wroclaw.merito.pl": 70}'),
    (3, '2026-10-25 09:00:00', '2026-10-25 09:45:00', 45, true,
     '{"s040248@student.wroclaw.merito.pl": 9, "s553022@student.wroclaw.merito.pl": 11, "s040248+majetan@student.wroclaw.merito.pl": 4}',
     '{"s040248@student.wroclaw.merito.pl": 0, "s553022@student.wroclaw.merito.pl": 1, "s040248+majetan@student.wroclaw.merito.pl": 2}',
     '{"s040248@student.wroclaw.merito.pl": 30, "s553022@student.wroclaw.merito.pl": 48, "s040248+majetan@student.wroclaw.merito.pl": 62}');

-- ===== LAB 03 · scenario_post =====
-- scenario_id: numer scenariusza z sekcji scenario (1 = Wyciek danych, 2 = Hejt w social media, 3 = Błędna reklama)
insert into scenario_post (scenario_id, minute_offset, platform, content, sentiment, reach) values
    (1, 0,  'mikroblog', 'Dostałem mail o wycieku mojego adresu. Ktoś jeszcze?', -40, 1500),
    (1, 5,  'portal',    'Firma przyznaje się do wycieku bazy klientów',          -75, 48000),
    (1, 12, 'wideo',     'Ekspert tłumaczy, co wyciekło i co teraz zrobić',       -60, 22000),
    (2, 0,  'opinie',    'Jedna gwiazdka. Obsługa zignorowała moją reklamację.',  -50, 900),
    (2, 8,  'mikroblog', 'Wątek z hasłem #bojkot zbiera tysiące udostępnień',     -85, 130000),
    (3, 0,  'mikroblog', 'W reklamie jest błędna cena. Czy to oszustwo?',         -30, 4000);

-- ===== LAB 03 · scenario_run_participant =====
-- scenario_run_id: numer przebiegu z sekcji scenario_run (1, 2, 3), user_id: numer wiersza z sekcji users (1 = Kajetan, 2 = Paweł, 3 = Majetan)
insert into scenario_run_participant (scenario_run_id, user_id, points, errors, average_time_seconds) values
    (1, 1, 12, 1, 40),
    (1, 2, 8,  3, 55),
    (2, 2, 5,  2, 70),
    (3, 1, 9,  0, 30),
    (3, 2, 11, 1, 48),
    (3, 3, 4,  2, 62);
