DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS character;
DROP TABLE IF EXISTS relationship_type;
DROP TABLE IF EXISTS relationship;
DROP TABLE IF EXISTS position_type;
DROP TABLE IF EXISTS position;
DROP TABLE IF EXISTS clan;
DROP TABLE IF EXISTS clan_character;
DROP TABLE IF EXISTS world;

CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL
);

CREATE TABLE world (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER NOT NULL,
  name TEXT NOT NULL,
  desc TEXT
  FOREIGN KEY (user_id) REFERENCES user (id)
);

CREATE TABLE clan (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  desc TEXT NOT NULL,
  world_id INTEGER NOT NULL,
  FOREIGN KEY (world_id) REFERENCES world (id)
)

CREATE TABLE character (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  birthdate TEXT NOT NULL, --strftime('%Y-%m-%d', ...)
  deathdate TEXT,
  appearance TEXT NOT NULL,
  gender TEXT NOT NULL,
  cause_of_death TEXT,
  notes TEXT,
  skills TEXT
);

CREATE TABLE clan_character (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  clan_id INTEGER NOT NULL,
  character_id INTEGER NOT NULL,
  start TEXT,
  end TEXT,
  FOREIGN KEY (clan_id) REFERENCES clan (id),
  FOREIGN KEY (character_id) REFERENCES character (id)
)

CREATE TABLE relationship_type (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  desc TEXT NOT NULL
);

CREATE TABLE relationship (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  type_id INTEGER NOT NULL,
  character_id INTEGER NOT NULL,
  start TEXT NOT NULL,
  end TEXT,
  FOREIGN KEY (character_id) REFERENCES character (id),
  FOREIGN KEY (type_id) REFERENCES relationship_type (id)
);

CREATE TABLE position_type (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  desc TEXT NOT NULL
);

CREATE TABLE position (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  type_id INTEGER NOT NULL,
  character_id INTEGER NOT NULL,
  start TEXT NOT NULL,
  end TEXT,
  FOREIGN KEY (character_id) REFERENCES character (id),
  FOREIGN KEY (type_id) REFERENCES position_type (id)
);