const createTable = '''CREATE TABLE GeoLocation (
    id INTEGER PRIMARY KEY,
    name TEXT,
    latitude REAL,
    longitude REAL
);

CREATE TABLE WeatherInfo (
    id INTEGER PRIMARY KEY,
    location_id INTEGER,
    weatherCondition TEXT,
    temperature REAL,
    rainChance INTEGER,
    minDailyTemp REAL,
    maxDailyTemp REAL,
    FOREIGN KEY (location_id) REFERENCES GeoLocation(id)
);

CREATE TABLE WeatherHistory (
    id INTEGER PRIMARY KEY,
    weatherInfo_id INTEGER,
    timestamp TEXT,
    FOREIGN KEY (weatherInfo_id) REFERENCES WeatherInfo(id)
);''';