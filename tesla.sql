-- Demo database for testing of db-components
-- originally intended for Norwegian students
-- english names would be customer,product,order,detail

-- create role,database for demo
create role tesla password '123';     -- shop is user
alter role tesla with login;          -- allow login
create database tesla owner tesla;     -- create db

-- enter the new db
\c shop;

DROP TABLE IF EXISTS users cascade;
DROP TABLE IF EXISTS kunde cascade;
DROP TABLE IF EXISTS vare cascade;
DROP TABLE IF EXISTS bestilling cascade;
DROP TABLE IF EXISTS linje cascade;

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

ALTER TABLE "users" ADD FOREIGN KEY ("kjoperid") REFERENCES "users" ("kjoperid");

ALTER TABLE "fabrikk" ADD FOREIGN KEY ("fabrikkid") REFERENCES "cybertruck" ("fabrikkid");

ALTER TABLE "kjoper" ADD FOREIGN KEY ("kjoperid") REFERENCES "salg" ("kjoperid");

ALTER TABLE "salg" ADD FOREIGN KEY ("salgid") REFERENCES "eksemplar" ("salgid");

ALTER TABLE "cybertruck" ADD FOREIGN KEY ("cybertruckid") REFERENCES "eksemplar" ("cybertruckid");

ALTER TABLE "ymodell" ADD FOREIGN KEY ("ymodellid") REFERENCES "eksemplar" ("ymodellid");

ALTER TABLE "fabrikk" ADD FOREIGN KEY ("fabrikkid") REFERENCES "ymodell" ("fabrikkid");

ALTER TABLE "xmodell" ADD FOREIGN KEY ("xmodellid") REFERENCES "eksemplar" ("xmodellid");

ALTER TABLE "fabrikk" ADD FOREIGN KEY ("fabrikkid") REFERENCES "xmodell" ("fabrikkid");

ALTER TABLE "emodell" ADD FOREIGN KEY ("emodellid") REFERENCES "eksemplar" ("emodellid");

ALTER TABLE "fabrikk" ADD FOREIGN KEY ("fabrikkid") REFERENCES "emodell" ("fabrikkid");

ALTER TABLE "smodell" ADD FOREIGN KEY ("smodellid") REFERENCES "eksemplar" ("smodellid");

ALTER TABLE "fabrikk" ADD FOREIGN KEY ("fabrikkid") REFERENCES "smodell" ("fabrikkid");


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