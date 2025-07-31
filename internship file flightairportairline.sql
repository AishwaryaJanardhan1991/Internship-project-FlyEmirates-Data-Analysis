create database flightairlineairport;
use flightairlineairport;

create table airlines (
    iata_code varchar(10) primary key,
    airline varchar(100)
);
desc airlines;

load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Project files internship/airlines.csv"
into table airlines
fields terminated by',' 
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;
select * from airlines;

create table airports (
    iata_code varchar(10) primary key,
    airport varchar(100),
    city varchar(100),
    state varchar(10),
    country varchar(50),
    latitude decimal(10,6),
    longitude decimal(10,6)
);
desc airports;

load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Project files internship/airports_cleaned.csv"
into table airports
fields terminated by',' 
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;
select * from airports;


CREATE TABLE FLIGHTS_TEMP (
    YEAR INT,
    MONTH INT,
    DAY INT,
    DAY_OF_WEEK INT,
    AIRLINE VARCHAR(10),
    FLIGHT_NUMBER VARCHAR(10),
    ORIGIN_AIRPORT VARCHAR(10),
    DESTINATION_AIRPORT VARCHAR(10),
    SCHEDULED_DEPARTURE TIME,
    DEPARTURE_TIME TIME,
    SCHEDULED_ARRIVAL TIME,
    ARRIVAL_TIME TIME,
    ARRIVAL_DELAY INT
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Project files internship/flight_temp_10k.csv"
INTO TABLE flights_temp
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SELECT * from flights_temp;

    CREATE TABLE flights (
    year INT,
    month INT,
    day INT,
    day_of_week INT,
    airline VARCHAR(50),
    flight_number VARCHAR(10),
    tail_number VARCHAR(10),
    origin_airport VARCHAR(10),
    destination_airport VARCHAR(10),
    scheduled_departure TIME,
    departure_time TIME,
    departure_delay INT,
    taxi_out INT,
    wheels_off TIME,
    scheduled_time INT,
    elapsed_time INT,
    air_time INT,
    distance INT,
    wheels_on TIME,
    taxi_in INT,
    scheduled_arrival TIME,
    arrival_time TIME,
    arrival_delay INT,
    diverted TINYINT,
    cancelled TINYINT,
    cancellation_reason VARCHAR(10),
    air_system_delay INT,
    security_delay INT,
    airline_delay INT,
    late_aircraft_delay INT,
    weather_delay INT,
    PRIMARY KEY (year, month, day, flight_number)
);
desc flights;
SHOW VARIABLES LIKE 'secure_file_priv';

select count(*) as total_flights from flights;

-- 1. Top 5 busiest origin airports
select origin_airport, count(*) as num_flights
from flights
group by origin_airport
order by num_flights desc
limit 5;

-- 2. Top 5 destination airports
select destination_airport, count(*) as num_flights
from flights
group by destination_airport
order by num_flights desc
limit 5;

-- 3. Total cancelled flights
select count(*) as total_cancelled
from flights
where cancelled = 1;

