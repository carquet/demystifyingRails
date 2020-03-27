CREATE TABLE "events" (
  "id"         INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "name"       varchar,
  "body"       text,
  "date"   	   datetime NOT NULL,
  "created_at" datetime NOT NULL);