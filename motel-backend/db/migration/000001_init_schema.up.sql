CREATE TABLE "flow" (
  "flow_id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "flow_name" varchar(50) UNIQUE NOT NULL DEFAULT ('')
);

CREATE TABLE "role" (
  "role_id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "role_name" varchar(50) UNIQUE NOT NULL DEFAULT (''),
  "created_at" timestamp NOT NULL DEFAULT (now())
);

CREATE TABLE "user" (
  "user_id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "role_id" INT NULL REFERENCES "role"(role_id),
  "user_name" varchar(512) UNIQUE NOT NULL,
  "cid" varchar(50) NOT NULL DEFAULT (''),
  "driver_license" varchar(50) NOT NULL DEFAULT (''),
  "phone" varchar(50) NOT NULL DEFAULT (''),
  "password" varchar(1024) NOT NULL DEFAULT (''),
  "email" varchar NOT NULL DEFAULT (''),
  "created_on" timestamp NOT NULL DEFAULT (now()),
  "last_login" timestamp NOT NULL DEFAULT (now())
);

CREATE TABLE "room" (
  "room_id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "flow_id" INT NULL REFERENCES "flow"(flow_id),
  "user_id" INT NULL REFERENCES "user"(user_id),
  "area" varchar(50) NOT NULL DEFAULT ('0'),
  "status_room" int NOT NULL DEFAULT (-1),
  "room_name" varchar(255) UNIQUE NOT NULL DEFAULT (''),
  "booking_date" timestamp NOT NULL DEFAULT (now()),
  "date_move_in" timestamp NOT NULL DEFAULT (now()),
  "date_move_out" timestamp NOT NULL DEFAULT (now()),
  "total_days" float NOT NULL DEFAULT (0),
  "electric_number" float NOT NULL DEFAULT (0),
  "electric_price" float NOT NULL DEFAULT (0),
  "deposits" float NOT NULL DEFAULT (0),
  "img_electric" text[] NULL DEFAULT('{}'),
  "img_room_rates" text[] NULL DEFAULT('{}'),
  "img_water" text[] NULL DEFAULT('{}'),
  "img_room" text[] NULL DEFAULT('{}'),
  "junk_money" float NOT NULL DEFAULT (0),
  "num_of_member" int NOT NULL DEFAULT (0),
  "room_rates" float NOT NULL DEFAULT (0),
  "water_number" float NOT NULL DEFAULT (0),
  "water_price" float NOT NULL DEFAULT (0)
);

CREATE TABLE "bill" (
  "bill_id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "room_id" INT NULL REFERENCES "room"(room_id),
  "created_date" timestamp NOT NULL DEFAULT (now()),
  "total_payment" float NOT NULL DEFAULT ('0'),
  "img_total_payment" bytea NOT NULL DEFAULT (''),
  "note" text NOT NULL DEFAULT ('')
);

INSERT INTO "flow" (flow_name) VALUES
	('flow-A'),
	('flow-B'),
	('flow-C'),
	('flow-D'),
	('flow-E'),
	('flow-F'),
	('flow-G'),
	('flow-H'),
	('flow-K'),
	('flow-KIOT');

INSERT INTO "role"(role_name) VALUES
	('admin'),
	('host'),
	('manager'),
	('client'),
	('user');

INSERT INTO "room"(
	flow_id,status_room, room_name, total_days,electric_number,electric_price,
	deposits,img_room,img_room_rates,img_water,junk_money,
	num_of_member,room_rates,water_number,water_price) VALUES
	-- A --
	(1,0,'A1',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,900000,0,10000),
	(1,0,'A2',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(1,0,'A3',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(1,0,'A4',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(1,0,'A5',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(1,0,'A6',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(1,0,'A7',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(1,0,'A8',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(1,0,'A9',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(1,0,'A10',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	-- B --
	(2,0,'B1',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(2,0,'B2',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(2,0,'B3',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(2,0,'B4',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(2,0,'B5',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(2,0,'B6',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(2,0,'B7',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(2,0,'B8',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(2,0,'B9',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(2,0,'B10',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,900000,0,10000),
	-- C --
	(3,0,'C1',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(3,0,'C2',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(3,0,'C3',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(3,0,'C4',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(3,0,'C5',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(3,0,'C6',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(3,0,'C7',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(3,0,'C8',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(3,0,'C9',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(3,0,'C10',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	-- D --
	(4,0,'D0',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,900000,0,10000),
	(4,0,'D1',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(4,0,'D2',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(4,0,'D3',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(4,0,'D4',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(4,0,'D5',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(4,0,'D6',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(4,0,'D7',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(4,0,'D8',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(4,0,'D9',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(4,0,'D10',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	-- E --
	(5,0,'E0',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(5,0,'E1',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(5,0,'E2',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(5,0,'E3',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(5,0,'E4',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(5,0,'E5',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(5,0,'E6',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(5,0,'E7',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(5,0,'E8',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(5,0,'E9',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(5,0,'E10',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,900000,0,10000),
	-- F --
	(6,0,'F1',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,1000000,0,10000),
	(6,0,'F2',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(6,0,'F3',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(6,0,'F4',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(6,0,'F5',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(6,0,'F6',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(6,0,'F7',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(6,0,'F8',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(6,0,'F9',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(6,0,'F10',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,1000000,0,10000),
	-- G --
	(7,0,'G1',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(7,0,'G2',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(7,0,'G3',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(7,0,'G4',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(7,0,'G5',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(7,0,'G6',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(7,0,'G7',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(7,0,'G8',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(7,0,'G9',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(7,0,'G10',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(7,0,'G11',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,1200000,0,10000),
	-- H --
	(8,0,'H0',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,900000,0,10000),
	(8,0,'H1',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(8,0,'H2',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(8,0,'H3',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(8,0,'H4',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(8,0,'H5',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(8,0,'H6',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(8,0,'H7',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(8,0,'H8',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(8,0,'H9',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(8,0,'H10',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(8,0,'H11',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,1200000,0,10000),
	-- K --
	(9,0,'K0',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,900000,0,10000),
	(9,0,'K1',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(9,0,'K2',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(9,0,'K3',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(9,0,'K4',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(9,0,'K5',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(9,0,'K6',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(9,0,'K7',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(9,0,'K8',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(9,0,'K9',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(9,0,'K10',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	(9,0,'K11',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,800000,0,10000),
	-- KIOT --
	(10,0,'KIOT1',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,3000000,0,10000),
	(10,0,'KIOT2',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,1400000,0,10000),
	(10,0,'KIOT3',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,1600000,0,10000),
	(10,0,'KIOT4',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,2000000,0,10000),
	(10,0,'KIOT5',0,0,3000,0,'{"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif",
	"https://unsplash.com/blog/content/images/max/1200/1-3M6D2bNtp31_Bois15h9HA.gif"}','{""}','{""}',15000,0,2000000,0,10000);



INSERT INTO "user"(
	role_id, user_name,password,email) VALUES
	(1,'admin','admin','admin@gmail.com'),
	(2,'A1-034982142','123456789','abc1@gmail.com'),
	(2,'A10-034982142','123456789','abc12@gmail.com'),
	(2,'B1-034982142','123456789','abc2@gmail.com'),
	(3,'C1-034982142','123456789','abc3@gmail.com'),
	(4,'D1-034982142','123456789','abc4@gmail.com'),
	(2,'E1-034982142','123456789','abc5@gmail.com'),
	(4,'F1-034982142','123456789','abc6@gmail.com'),
	(2,'G1-034982142','123456789','abc7@gmail.com'),
	(2,'H1-034982142','123456789','abc8@gmail.com'),
	(2,'K1-034982142','123456789','abc10@gmail.com'),
	(3,'KIOT1-034982142','123456789','abc13@gmail.com'),
	(3,'KIOT2-034982142','123456789','abc11@gmail.com');

INSERT INTO "bill"(room_id,created_date) VALUES
					(1,'2022-12-06 10:10:10'),
					(1,'2023-01-06 10:10:10'),
					(1,'2023-02-06 10:10:10'),
					(2,'2023-03-06 10:10:10'),
					(3,'2023-04-06 10:10:10'),
					(4,'2023-05-06 10:10:10'),
					(1,'2023-06-06 10:10:10'),
					(1,'2023-07-06 10:10:10'),
					(1,'2023-08-06 10:10:10'),
					(5,'2023-09-06 10:10:10'),
					(6,'2023-10-06 10:10:10'),
					(7,'2023-11-06 10:10:10'),
					(5,'2023-12-06 10:10:10'),
					(1,'2023-02-06 10:10:10'),
					(1,'2023-03-06 10:10:10'),
					(2,'2023-03-06 10:10:10'),
					(3,'2023-04-06 10:10:10'),
					(4,'2023-05-06 10:10:10'),
					(1,'2023-06-06 10:10:10'),
					(1,'2023-07-06 10:10:10'),
					(1,'2023-02-06 10:10:10'),
					(5,'2023-02-06 10:10:10'),
					(6,'2023-12-06 10:10:10'),
					(7,'2023-11-06 10:10:10');