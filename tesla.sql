-- Demo database for testing of db-components
-- originally intended for Norwegian students
-- english names would be customer,product,order,detail

-- create role,database for demo
create role tesla password '123';     -- shop is user
alter role tesla with login;          -- allow login
create database tesla owner tesla;     -- create db

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
  "brukernavn" text NOT NULL,
  "passord" text,
  "kjoperid" int
);

CREATE TABLE "kjoper" (
  "kjoperid" SERIAL PRIMARY KEY,
  "fornavn" text NOT NULL,
  "etternavn" text NOT NULL,
  "adresse" text,
  "epost" text,
  "tlf" text,
  "kjonn" text
);

CREATE TABLE "fabrikk" (
  "fabrikkid" SERIAL PRIMARY KEY,
  "navn" text NOT NULL,
  "sted" text
);

CREATE TABLE "cybertruck" (
  "cybertruckid" SERIAL PRIMARY KEY,
  "tilstand" text,
  "kmkjørt" int,
  "longrange" boolean,
  "performance" boolean,
  "ekstradekk" boolean,
  "fabrikkid" int
);

CREATE TABLE "ymodell" (
  "ymodellid" SERIAL PRIMARY KEY,
  "tilstand" text,
  "kmkjørt" int,
  "longrange" boolean,
  "performance" boolean,
  "fabrikkid" int
);

CREATE TABLE "xmodell" (
  "xmodellid" SERIAL PRIMARY KEY,
  "tilstand" text,
  "kmkjørt" int,
  "longrange" boolean,
  "performance" boolean,
  "fabrikkid" int
);

CREATE TABLE "emodell" (
  "emodellid" SERIAL PRIMARY KEY,
  "tilstand" text,
  "kmkjørt" int,
  "longrange" boolean,
  "performance" boolean,
  "fabrikkid" int
);

CREATE TABLE "smodell" (
  "smodellid" SERIAL PRIMARY KEY,
  "tilstand" text,
  "kmkjørt" int,
  "longrange" boolean,
  "performance" boolean,
  "fabrikkid" int
);

CREATE TABLE "eksemplar" (
  "eksemplarid" SERIAL PRIMARY KEY,
  "sdato" date,
  "kjoperid" int,
  "smodellid" int,
  "emodellid" int,
  "xmodellid" int,
  "ymodellid" int,
  "cybertruckid" int,
  "salgid" int
);

CREATE TABLE "salg" (
  "salgid" SERIAL PRIMARY KEY,
  "kjoperid" int
);

ALTER TABLE "users" ADD FOREIGN KEY ("kjoperid") REFERENCES "kjoper" ("kjoperid");

ALTER TABLE "cybertruck" ADD FOREIGN KEY ("fabrikkid") REFERENCES "fabrikk" ("fabrikkid");

ALTER TABLE "salg" ADD FOREIGN KEY ("kjoperid") REFERENCES "kjoper" ("kjoperid");

ALTER TABLE "eksemplar" ADD FOREIGN KEY ("salgid") REFERENCES "salg" ("salgid");

ALTER TABLE "eksemplar" ADD FOREIGN KEY ("cybertruckid") REFERENCES "cybertruck" ("cybertruckid");

ALTER TABLE "eksemplar" ADD FOREIGN KEY ("ymodellid") REFERENCES "ymodell" ("ymodellid");

ALTER TABLE "ymodell" ADD FOREIGN KEY ("fabrikkid") REFERENCES "fabrikk" ("fabrikkid");

ALTER TABLE "eksemplar" ADD FOREIGN KEY ("xmodellid") REFERENCES "xmodell" ("xmodellid");

ALTER TABLE "xmodell" ADD FOREIGN KEY ("fabrikkid") REFERENCES "fabrikk" ("fabrikkid");

ALTER TABLE "eksemplar" ADD FOREIGN KEY ("emodellid") REFERENCES "emodell" ("emodellid");

ALTER TABLE "emodell" ADD FOREIGN KEY ("fabrikkid") REFERENCES "fabrikk" ("fabrikkid");

ALTER TABLE "eksemplar" ADD FOREIGN KEY ("smodellid") REFERENCES "smodell" ("smodellid");

ALTER TABLE "smodell" ADD FOREIGN KEY ("fabrikkid") REFERENCES "fabrikk" ("fabrikkid");




alter table users owner to tesla;
alter table kjoper owner to tesla;
alter table fabrikk owner to tesla;
alter table cybertruck owner to tesla;
alter table ymodell owner to tesla;
alter table xmodell owner to tesla;
alter table emodell owner to tesla;
alter table smodell owner to tesla;
alter table eksemplar owner to tesla;
alter table salg owner to tesla;