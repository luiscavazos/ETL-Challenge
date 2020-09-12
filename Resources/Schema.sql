CREATE TABLE poverty_rate (
  id SERIAL PRIMARY KEY,
  state VARCHAR(5),
  city VARCHAR(5),
  poverty_rate FLOAT
);

CREATE TABLE hs_rate (
  id SERIAL PRIMARY KEY,
  state VARCHAR(5),
  city VARCHAR(5),
  percent_completed_hs FLOAT
);
select * from hs_rate