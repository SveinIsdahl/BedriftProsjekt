
create role tesla password '123';
alter role tesla with login;     
create database tesla owner tesla;    

-- enter the new db
\c tesla;

DROP TABLE IF EXISTS users cascade;
DROP TABLE IF EXISTS kunde cascade;
DROP TABLE IF EXISTS eksemplar cascade;
DROP TABLE IF EXISTS salg cascade;



CREATE TABLE "users" (
  "userid" SERIAL PRIMARY KEY,
  "username" text UNIQUE NOT NULL,
  "role" text DEFAULT 'user',
  "password" text NOT NULL
);

CREATE TABLE "kunde" (
  "kundeid" SERIAL PRIMARY KEY,
  "fornavn" text NOT NULL,
  "etternavn" text NOT NULL,
  "adresse" text,
  "epost" text,
  "tlf" text,
  "kjonn" text,
  "userid" int UNIQUE NOT NULL
);

CREATE TABLE "eksemplar" (
  "eksemplarid" SERIAL PRIMARY KEY,
  "modell" text not null,
  "pris" int,
  "longrange" boolean,
  "performance" boolean,
  "farge" text
);

CREATE TABLE "salg" (
  "salgid" serial PRIMARY KEY,
  "dato" date,
  "kundeid" int not null,
  "eksemplarid" int not null
);

ALTER TABLE "kunde" ADD FOREIGN KEY ("userid") REFERENCES "users" ("userid");

ALTER TABLE "salg" ADD FOREIGN KEY ("kundeid") REFERENCES "kunde" ("kundeid");

ALTER TABLE "salg" ADD FOREIGN KEY ("eksemplarid") REFERENCES "eksemplar" ("eksemplarid");

alter table users owner to tesla;
alter table kunde owner to tesla;
alter table eksemplar owner to tesla;
alter table salg owner to tesla;

GRANT ALL PRIVILEGES ON TABLE kunde TO tesla;
GRANT ALL PRIVILEGES ON DATABASE tesla TO tesla;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO tesla;
GRANT USAGE, SELECT ON SEQUENCE users_userid_seq TO tesla;
