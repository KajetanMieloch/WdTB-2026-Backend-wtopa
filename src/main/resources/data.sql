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

insert into users (name, surname, email, role) values
    ('Kajetan', 'Mieloch', 's040248@student.wroclaw.merito.pl', 'USER'),
    ('Paweł', 'Szydłowski', 's553022@student.wroclaw.merito.pl', 'USER'),
    ('Majetan', 'Kieloch', 's040248+majetan@student.wroclaw.merito.pl', 'CONTRACTOR');

insert into scenario (name, description, difficulty, duration_minutes, amount, currency) values
    ('Wyciek danych', 'Klient traci bazę klientów', 'HARD', 45, 5000, 'PLN'),
    ('Hejt w social media', 'Fala negatywnych komentarzy', 'MEDIUM', 30, 2000, 'PLN'),
    ('Błędna reklama', 'Kampania z błędnym claimem', 'EASY', 20, 1000, 'PLN');

insert into scenario_run (start_time, end_time, duration_minutes, is_finished, users_points, users_errors, users_average_time) values
    ('2026-10-20 10:00:00', '2026-10-20 11:00:00', 60, true,
     '{"s040248@student.wroclaw.merito.pl": 12, "s553022@student.wroclaw.merito.pl": 8}',
     '{"s040248@student.wroclaw.merito.pl": 1, "s553022@student.wroclaw.merito.pl": 3}',
     '{"s040248@student.wroclaw.merito.pl": 40, "s553022@student.wroclaw.merito.pl": 55}'),
    ('2026-10-21 14:00:00', '2026-10-21 15:30:00', 90, true,
     '{"s553022@student.wroclaw.merito.pl": 5}',
     '{"s553022@student.wroclaw.merito.pl": 2}',
     '{"s553022@student.wroclaw.merito.pl": 70}'),
    ('2026-10-25 09:00:00', '2026-10-25 09:45:00', 45, true,
     '{"s040248@student.wroclaw.merito.pl": 9, "s553022@student.wroclaw.merito.pl": 11, "s040248+majetan@student.wroclaw.merito.pl": 4}',
     '{"s040248@student.wroclaw.merito.pl": 0, "s553022@student.wroclaw.merito.pl": 1, "s040248+majetan@student.wroclaw.merito.pl": 2}',
     '{"s040248@student.wroclaw.merito.pl": 30, "s553022@student.wroclaw.merito.pl": 48, "s040248+majetan@student.wroclaw.merito.pl": 62}');
