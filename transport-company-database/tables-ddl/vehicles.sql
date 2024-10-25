create table vehicles (
    id integer primary key generated always as identity,
    max_cargo_weight_in_kg integer not null,
    -- The type is "varchar(20)", because I expect
    --  this column to store strings representing
    --  decimal degrees, in a form of
    --  "90.123456,180.123456".
    gps_location varchar(20) not null
);
