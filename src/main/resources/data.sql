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
    ('s553022@student.wroclaw.merito.pl', 'Paweł Szydłowski', 'USER', current_timestamp);
-- konta zespołu (koniec)
