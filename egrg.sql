Table "kjoper" {
  "kjoperid" int [pk, increment]
  "fornavn" text [not null]
  "etternavn" text [not null]
  "adresse" text
  "epost" text
  "tlf" text
  "kjonn" text
}

Table "fabrikk" {
  "fabrikkid" int [pk, increment]
  "navn" text [not null]
  "sted" text
}

Table "cybertruck" {
  "cybertruckid" int [pk, increment]
  "tilstand" text
  "kmkjørt" int
  "longrange" boolean
  "performance" boolean
  "ekstradekk" boolean
  "fabrikkid" int
}

Table "ymodell" {
  "ymodellid" int [pk, increment]
  "tilstand" text
  "kmkjørt" int
  "longrange" boolean
  "performance" boolean
  "fabrikkid" int
}

Table "xmodell" {
  "xmodellid" int [pk, increment]
  "tilstand" text
  "kmkjørt" int
  "longrange" boolean
  "performance" boolean
  "fabrikkid" int
}

Table "3modell" {
  "3modellid" int [pk, increment]
  "tilstand" text
  "kmkjørt" int
  "longrange" boolean
  "performance" boolean
  "fabrikkid" int
}

Table "smodell" {
  "smodellid" int [pk, increment]
  "tilstand" text
  "kmkjørt" int
  "longrange" boolean
  "performance" boolean
  "fabrikkid" int
}

Table "eksemplar" {
  "eksemplarid" int [pk, increment]
  "sdato" date
  "kjoperid" int  
  "smodellid" int
  "3modellid" int
  "xmodellid" int
  "ymodellid" int
  "cybertruckid" int
}


Ref:"cybertruck"."fabrikkid" < "fabrikk"."fabrikkid"

Ref:"eksemplar"."kjoperid" < "kjoper"."kjoperid"

Ref:"eksemplar"."cybertruckid" < "cybertruck"."cybertruckid"

Ref:"eksemplar"."ymodellid" < "ymodell"."ymodellid"

Ref:"ymodell"."fabrikkid" < "fabrikk"."fabrikkid"

Ref:"eksemplar"."xmodellid" < "xmodell"."xmodellid"

Ref:"xmodell"."fabrikkid" < "fabrikk"."fabrikkid"

Ref:"eksemplar"."3modellid" < "3modell"."3modellid"

Ref:"3modell"."fabrikkid" < "fabrikk"."fabrikkid"

Ref:"eksemplar"."smodellid" < "smodell"."smodellid"

Ref:"smodell"."fabrikkid" < "fabrikk"."fabrikkid"