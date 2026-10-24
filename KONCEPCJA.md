# Wtopa

Trenażer kryzysów wizerunkowych dla agencji PR. Trenerka puszcza zespołowi fikcyjną aferę: posty z internetu pojawiają się na osi czasu co kilka minut, a uczestnicy mają odpowiedzieć, zanim zrobi się z tego mem. Aplikacja liczy, kto zareagował po 3 minutach, a kto po 40, ile kosztowała każda odpowiedź i czy sytuację uratowała, czy pogorszyła.

Pomysł wziął się z pracy przy danych o wzmiankach z internetu. W prawdziwym kryzysie liczą się trzy rzeczy: zasięg, sentyment i czas reakcji. Juniorów uczy się tego na slajdach albo na prawdziwym kliencie. Tu mogą się pomylić bez konsekwencji.

Wszystkie marki, osoby i posty w scenariuszach są zmyślone. Zbieżności są przypadkowe.

## Problem

Agencja PR ma ośmiu ludzi i jedną trenerkę. Kryzysy ćwiczy się na burzy mózgów, więc nikt nie wie, kto zareagowałby po 4 minutach, a kto po godzinie, ani czy odpowiedź brzmiałaby jak człowiek, czy jak komunikat prasowy. Nie ma też jak porównać dwóch zespołów na tym samym scenariuszu.

## Klient

- **Kinga**, trenerka komunikacji kryzysowej. Układa scenariusze, prowadzi sesje, ocenia wyniki.
- **Pan Roman**, właściciel agencji. Płaci za szkolenia i chce wiedzieć, czy cokolwiek dają (stąd pytania „inwestora” niżej).
- **Tomek**, junior. Dostaje afery do gaszenia.

Role w szablonie: `USER` (uczestnik), `PARTNER` (trener), `ADMIN`.

## Funkcje

1. Biblioteka scenariuszy: fikcyjna marka, opis afery, budżet kryzysowy i oś czasu postów (kiedy, gdzie, jaki sentyment, jaki zasięg).
2. Sesja treningowa: trener startuje scenariusz dla zespołu, uczestnicy dostają role i odpowiadają na posty. Sesja ma status i kończy się raportem.
3. Odpowiedzi z kosztem i czasem: każda reakcja (przeprosiny, sprostowanie, milczenie, eskalacja do prawnika) kosztuje budżet i jest punktowana za szybkość oraz skutek.
4. Raport końcowy i ranking: wynik zespołu, średni czas reakcji, wydany budżet, kto zostawił posty bez odpowiedzi.

## Przykładowy scenariusz

**Gołąb na sali.** Pierogarnia z Wrocławia dostaje jedną gwiazdkę, bo gołąb wleciał na salę i uciekł z pierogiem. Nagranie ma 2 mln wyświetleń.

| Minuta | Platforma | Post | Sentyment | Zasięg |
|---|---|---|---|---|
| 0 | opinie | „1 gwiazdka. Gołąb miał lepszy dostęp do menu niż ja.” | -40 | 800 |
| 3 | wideo | nagranie gołębia z pierogiem | -65 | 31 000 |
| 9 | mikroblog | „Pierogarnia zaprzecza, ale mamy zdjęcia.” | -80 | 120 000 |
| 20 | portal lokalny | tekst o „aferze gołębiej” | -55 | 45 000 |

Post bez reakcji w 15 minut rośnie dwukrotnie. Dlatego liczy się, kto odpowie pierwszy.

Inne pomysły na scenariusze: partia skarpet z dniami tygodnia, w której piątek jest przed czwartkiem; maskotka lodziarni nagrana w sporze z rowerzystą; gmina Dolne Błota i logo święta ziemniaka.

## Dane

Dwa moduły, sześć własnych tabel i `user_account` z szablonu.

| Moduł (pakiet) | Tabela | Co zawiera |
|---|---|---|
| `scenario` | `scenario` | nazwa, marka, opis, trudność, budżet kryzysowy (PLN), czas trwania, autor (trener) |
| | `scenario_post` | scenariusz, minuta na osi czasu, platforma, autor posta, treść, sentyment (-100..100), zasięg |
| `training` | `training_session` | scenariusz, trener, status, termin, start, koniec |
| | `session_participant` | sesja, użytkownik, rola w zespole kryzysowym, dołączył |
| | `response` | sesja, post, uczestnik, typ reakcji, treść, koszt (PLN), czas reakcji (s), zmiana sentymentu, punkty, status |
| | `session_report` | sesja (1:1), suma punktów, średni czas reakcji, wydany budżet, komentarz trenera |

Trzeci pakiet na punktację i symulację (bez własnych tabel) pojawi się na LAB 04 i LAB 06.

## Cykl życia

- **Sesja:** planowana → w toku → zakończona (albo przerwana).
- **Odpowiedź:** szkic → wysłana → oceniona.

## Wymagania z koncepcji projektu

- Konkretny klient: Kinga (i Pan Roman jako ten, kto płaci).
- Dwa moduły: `scenario` i `training`.
- Sześć własnych tabel.
- Obiekt ze statusem: sesja i odpowiedź.
- Wielkości mierzalne: sentyment, zasięg, sekundy, złotówki, punkty.
- Relacja wiele-do-wielu z atrybutami: użytkownik i sesja przez `session_participant`, uczestnik i post przez `response`.
- Relacja jeden-do-jednego: sesja i raport.

## Pytania „inwestora” (LAB 03)

1. Który scenariusz kończy się najgorzej: średni wynik i średni czas pierwszej reakcji w podziale na scenariusze?
2. Ile budżetu kryzysowego uczestnicy wydają w każdym scenariuszu i ile punktów dostają za złotówkę?
3. Kto jest w czołówce: 10 uczestników z najwyższym średnim wynikiem z sesji zakończonych w ostatnich 90 dniach?
4. Które typy reakcji średnio poprawiają sentyment, a które go pogarszają?
5. Ile postów zostało bez odpowiedzi dłużej niż 15 minut, w podziale na platformy i scenariusze?

## Uproszczenia

- Żadnego pobierania danych z prawdziwych serwisów. Posty to dane z `data.sql` albo wpisane przez trenera.
- Oś czasu odtwarza się z zapisanych minut. Na LAB 06 zadanie cykliczne „dosypuje” posty do trwającej sesji i podbija zasięg tych bez reakcji.
- Punktację liczymy prostym wzorem (typ reakcji razy współczynnik szybkości minus kara za koszt). Wagi trafią do konfiguracji.
- Uczestnicy nie podają żadnych danych poza kontem. Treści afer są zmyślone, bez prawdziwych osób i marek.
