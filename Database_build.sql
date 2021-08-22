CREATE TABLE "hangary" (
  "id_hangaru" SERIAL PRIMARY KEY,
  "nazwa_hangaru" TEXT NOT NULL,
  "ilosc_miejsc" INTEGER NOT NULL
);

CREATE TABLE "klasy" (
  "klasa_samolotu" TEXT PRIMARY KEY
);

CREATE TABLE "linie_lotnicze" (
  "linie_lotnicze" TEXT PRIMARY KEY
);

CREATE TABLE "miejsca" (
  "miejsce_docelowe" TEXT PRIMARY KEY
);

CREATE TABLE "zalogi" (
  "nazwa_zalogi" TEXT PRIMARY KEY,
  "ilosc_osob" INTEGER NOT NULL,
  "linie_lotnicze" TEXT NOT NULL
);

CREATE INDEX "idx_zalogi__linie_lotnicze" ON "zalogi" ("linie_lotnicze");

ALTER TABLE "zalogi" ADD CONSTRAINT "fk_zalogi__linie_lotnicze" FOREIGN KEY ("linie_lotnicze") REFERENCES "linie_lotnicze" ("linie_lotnicze") ON DELETE CASCADE;

CREATE TABLE "samoloty" (
  "id_samolotu" SERIAL PRIMARY KEY,
  "hangary" INTEGER NOT NULL,
  "zalogi" TEXT,
  "linie_lotnicze" TEXT,
  "miejsca" TEXT
);

CREATE INDEX "idx_samoloty__hangary" ON "samoloty" ("hangary");

CREATE INDEX "idx_samoloty__linie_lotnicze" ON "samoloty" ("linie_lotnicze");

CREATE INDEX "idx_samoloty__miejsca" ON "samoloty" ("miejsca");

CREATE INDEX "idx_samoloty__zalogi" ON "samoloty" ("zalogi");

ALTER TABLE "samoloty" ADD CONSTRAINT "fk_samoloty__hangary" FOREIGN KEY ("hangary") REFERENCES "hangary" ("id_hangaru") ON DELETE CASCADE;

ALTER TABLE "samoloty" ADD CONSTRAINT "fk_samoloty__linie_lotnicze" FOREIGN KEY ("linie_lotnicze") REFERENCES "linie_lotnicze" ("linie_lotnicze") ON DELETE SET NULL;

ALTER TABLE "samoloty" ADD CONSTRAINT "fk_samoloty__miejsca" FOREIGN KEY ("miejsca") REFERENCES "miejsca" ("miejsce_docelowe") ON DELETE SET NULL;

ALTER TABLE "samoloty" ADD CONSTRAINT "fk_samoloty__zalogi" FOREIGN KEY ("zalogi") REFERENCES "zalogi" ("nazwa_zalogi") ON DELETE SET NULL;

CREATE TABLE "ilosc_miejsc" (
  "samoloty" INTEGER PRIMARY KEY,
  "ilosc_miejsc" INTEGER DEFAULT 20
);

ALTER TABLE "ilosc_miejsc" ADD CONSTRAINT "fk_ilosc_miejsc__samoloty" FOREIGN KEY ("samoloty") REFERENCES "samoloty" ("id_samolotu");

CREATE TABLE "klasy_samoloty" (
  "klasy" TEXT NOT NULL,
  "samoloty" INTEGER NOT NULL,
  PRIMARY KEY ("klasy", "samoloty")
);

CREATE INDEX "idx_klasy_samoloty" ON "klasy_samoloty" ("samoloty");

ALTER TABLE "klasy_samoloty" ADD CONSTRAINT "fk_klasy_samoloty__klasy" FOREIGN KEY ("klasy") REFERENCES "klasy" ("klasa_samolotu");

ALTER TABLE "klasy_samoloty" ADD CONSTRAINT "fk_klasy_samoloty__samoloty" FOREIGN KEY ("samoloty") REFERENCES "samoloty" ("id_samolotu");

CREATE TABLE "klienci" (
  "pesel" INTEGER PRIMARY KEY,
  "imie" TEXT,
  "nazwisko" TEXT NOT NULL,
  "cena_biletu" DECIMAL(7, 2) NOT NULL,
  "miejsca" TEXT NOT NULL,
  "klasy" TEXT NOT NULL,
  "samoloty" INTEGER NOT NULL
);

CREATE INDEX "idx_klienci__klasy" ON "klienci" ("klasy");

CREATE INDEX "idx_klienci__miejsca" ON "klienci" ("miejsca");

CREATE INDEX "idx_klienci__samoloty" ON "klienci" ("samoloty");

ALTER TABLE "klienci" ADD CONSTRAINT "fk_klienci__klasy" FOREIGN KEY ("klasy") REFERENCES "klasy" ("klasa_samolotu") ON DELETE CASCADE;

ALTER TABLE "klienci" ADD CONSTRAINT "fk_klienci__miejsca" FOREIGN KEY ("miejsca") REFERENCES "miejsca" ("miejsce_docelowe") ON DELETE CASCADE;

ALTER TABLE "klienci" ADD CONSTRAINT "fk_klienci__samoloty" FOREIGN KEY ("samoloty") REFERENCES "samoloty" ("id_samolotu") ON DELETE CASCADE;

CREATE TABLE "piloci" (
  "id_pilota" SERIAL PRIMARY KEY,
  "imie" TEXT NOT NULL,
  "nazwisko" TEXT NOT NULL,
  "samoloty" INTEGER
);

CREATE INDEX "idx_piloci__samoloty" ON "piloci" ("samoloty");

ALTER TABLE "piloci" ADD CONSTRAINT "fk_piloci__samoloty" FOREIGN KEY ("samoloty") REFERENCES "samoloty" ("id_samolotu") ON DELETE SET NULL
