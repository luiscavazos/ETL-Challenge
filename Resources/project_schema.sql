drop table if exists poverty_rate;
drop table if exists hs_rate;
drop table if exists killings;

select * from poverty_rate 

CREATE TABLE poverty_rate (
  id SERIAL PRIMARY KEY,
  state VARCHAR(5),
  city text,
  poverty_rate FLOAT
);

CREATE TABLE hs_rate (
  id SERIAL PRIMARY KEY,
  state VARCHAR(5),
  city text,
  percent_completed_hs FLOAT
);

create table killings (
	date date, 
	armed text,
	age integer, 
	gender varchar(1),
	race varchar(1),
	city text,
	state varchar(2),
	signs_of_mental_illness boolean,
	body_camera boolean
);

copy (
SELECT killings.*, hs_rate.percent_completed_hs, poverty_rate.poverty_rate
FROM killings
INNER JOIN hs_rate
ON killings.city = hs_rate.city
and killings.state = hs_rate.state
INNER JOIN poverty_rate
ON killings.city = poverty_rate.city
and killings.state = poverty_rate.state;
to '/ETL-Challenge/Resources/export.csv' with csv delimiter ',' header;

