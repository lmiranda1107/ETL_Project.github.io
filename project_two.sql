DROP DATABASE IF EXISTS medical_desert_db;
CREATE DATABASE medical_desert_db;

USE medical_desert_db;

DROP TABLE IF EXISTS hpsa;
CREATE TABLE hpsa (
  id INT AUTO_INCREMENT NOT NULL,
  hpsa_name TEXT,
  designation_type TEXT,
  hpsa_discipline_class TEXT,
  hpsa_designation_date TEXT,
  county_name TEXT,
  zip_code TEXT,
  longitude DOUBLE,
  latitude DOUBLE,
  primary key(id)
);
-- SELECT county_name FROM hpsa;
-- DESCRIBE hpsa;

DROP TABLE IF EXISTS uninsured;
CREATE TABLE uninsured (
  id INT AUTO_INCREMENT NOT NULL,
  id2 INT,
  county_name TEXT,
  total_population INT,
  total_uninsured_population INT,
  primary key(id)
);
-- SELECT * FROM uninsured;
-- DESCRIBE uninsured;
-- select county_name from uninsured;
-- merge tables
/*
SELECT h.hpsa_name, h.county_name,h.longitude, h.latitude, u.total_population, u.total_uninsured_population
FROM hpsa AS h
JOIN uninsured AS u
ON h.county_name = u.county_name;
*/

DROP TABLE IF EXISTS uninsured_rate;
CREATE TABLE uninsured_rate (
  id INT AUTO_INCREMENT NOT NULL,
  NAME TEXT,
  uninsured_rate DOUBLE,
  primary key(id)
);
-- Select NAME,  uninsured_rate from uninsured_rate;
-- find duplicates
/*
SELECT 
    NAME, COUNT(NAME)
FROM
    uninsured_rate
GROUP BY 
    NAME
HAVING 
    COUNT(NAME) > 1;
    
DELETE t1 FROM uninsured_rate t1
        INNER JOIN
    uninsured_rate t2 
WHERE
    t1.id < t2.id AND t1.NAME = t2.NAME;
    */