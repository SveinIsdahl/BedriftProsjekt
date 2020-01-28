
create role tesla password '123';
alter role tesla with login;     
create database tesla owner tesla;    

-- enter the new db
\c tesla;

DROP TABLE IF EXISTS users cascade;
DROP TABLE IF EXISTS kunde cascade;
DROP TABLE IF EXISTS eksemplar cascade;
DROP TABLE IF EXISTS salg cascade;
DROP TABLE IF EXISTS linje cascade;
DROP TABLE IF EXISTS kjoper cascade;
DROP TABLE IF EXISTS fabrikk cascade;
DROP TABLE IF EXISTS ymodell cascade;
DROP TABLE IF EXISTS smodell cascade;
DROP TABLE IF EXISTS emodell cascade;
DROP TABLE IF EXISTS xmodell cascade;
DROP TABLE IF EXISTS cybertruck cascade;


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
  "tilstand" text,
  "kmkjort" int,
  "pris" int,
  "longrange" boolean,
  "performance" boolean,
  "modell" text not null,
  "salgid" int
);

CREATE TABLE "salg" (
  "salgid" SERIAL PRIMARY KEY,
  "kundeid" int
);

ALTER TABLE "kunde" ADD FOREIGN KEY ("userid") REFERENCES "users" ("userid");

ALTER TABLE "salg" ADD FOREIGN KEY ("kundeid") REFERENCES "kunde" ("kundeid");

ALTER TABLE "eksemplar" ADD FOREIGN KEY ("salgid") REFERENCES "salg" ("salgid");

alter table users owner to tesla;
alter table kunde owner to tesla;
alter table eksemplar owner to tesla;
alter table salg owner to tesla;

GRANT ALL PRIVILEGES ON TABLE kunde TO tesla;
GRANT ALL PRIVILEGES ON DATABASE tesla TO tesla;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO tesla;
GRANT USAGE, SELECT ON SEQUENCE users_userid_seq TO tesla;
