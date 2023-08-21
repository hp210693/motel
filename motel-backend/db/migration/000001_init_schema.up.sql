CREATE TABLE "flow" (
  "flow_id" BIGSERIAL PRIMARY KEY,
  "flow_name" varchar(50) UNIQUE NOT NULL
);

CREATE TABLE "role" (
  "role_id" BIGSERIAL PRIMARY KEY,
  "role_name" varchar(50) UNIQUE NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT (now())
);

CREATE TABLE "room" (
  "room_id" BIGSERIAL PRIMARY KEY,
  "flow_id" bigserial UNIQUE NOT NULL,
  "account_id" bigserial UNIQUE NOT NULL,
  "area" varchar(50) NOT NULL DEFAULT (''),
  "status_room" int NOT NULL DEFAULT (-1),
  "room_name" varchar(255) UNIQUE NOT NULL DEFAULT (''),
  "booking_date" timestamp NOT NULL DEFAULT (now()),
  "date_move_in" timestamp NOT NULL DEFAULT (now()),
  "date_move_out" timestamp NOT NULL DEFAULT (now()),
  "total_days" float NOT NULL DEFAULT (0),
  "electric_number" float NOT NULL DEFAULT (0),
  "electric_price" float NOT NULL DEFAULT (0),
  "deposits" float NOT NULL DEFAULT (0),
  "img_electric" bytea NOT NULL DEFAULT (''),
  "img_room_rates" bytea NOT NULL DEFAULT (''),
  "img_water" bytea NOT NULL DEFAULT (''),
  "junk_money" float NOT NULL DEFAULT (0),
  "num_of_member" int NOT NULL DEFAULT (0),
  "room_rates" float NOT NULL DEFAULT (0),
  "water_number" float NOT NULL DEFAULT (0),
  "water_price" float NOT NULL DEFAULT (0)
);

CREATE TABLE "account" (
  "account_id" BIGSERIAL PRIMARY KEY,
  "role_id" bigserial UNIQUE NOT NULL,
  "user_name" varchar(512) UNIQUE NOT NULL,
  "cid" varchar(50) NOT NULL DEFAULT (''),
  "driver_license" varchar(50) NOT NULL DEFAULT (''),
  "phone" varchar(50) NOT NULL DEFAULT (''),
  "password" varchar(1024) NOT NULL DEFAULT (''),
  "email" varchar NOT NULL DEFAULT (''),
  "created_on" timestamp NOT NULL DEFAULT (now()),
  "last_login" timestamp NOT NULL DEFAULT (now())
);

CREATE TABLE "bill" (
  "bill_id" BIGSERIAL PRIMARY KEY,
  "room_id" bigserial UNIQUE NOT NULL,
  "created_date" timestamp NOT NULL DEFAULT (now()),
  "total_payment" varchar NOT NULL DEFAULT (''),
  "img_total_payment" bytea NOT NULL DEFAULT (''),
  "note" text NOT NULL DEFAULT ('')
);

ALTER TABLE "room" ADD FOREIGN KEY ("flow_id") REFERENCES "flow" ("flow_id");

ALTER TABLE "account" ADD FOREIGN KEY ("account_id") REFERENCES "room" ("account_id");

CREATE TABLE "role_account" (
  "role_role_id" bigserial,
  "account_role_id" bigserial,
  PRIMARY KEY ("role_role_id", "account_role_id")
);

ALTER TABLE "role_account" ADD FOREIGN KEY ("role_role_id") REFERENCES "role" ("role_id");

ALTER TABLE "role_account" ADD FOREIGN KEY ("account_role_id") REFERENCES "account" ("role_id");


ALTER TABLE "bill" ADD FOREIGN KEY ("room_id") REFERENCES "room" ("room_id");