create table people (
    id integer primary key generated always as identity,
    -- The type is "varchar(20)" just for not having
    --  to define a check constraint with "text" or
    --  "varchar". I do not understand check
    --  constraints yet. The length "20" is a
    --  more or less arbitrary value, but which
    --  seems to me to be short enough and long
    --  enough for my needs during my learning of SQL
    --  and PostgreSQL.
    name varchar(20) not null
);

create table companies (
    id integer primary key generated always as identity,
    -- The type is "integer" because I think it is
    --  simple. But in general I believe I could also
    --  use "varchar" or "text".
    registration_number integer not null
);

create table people_companies (
    id integer primary key generated always as identity,
    person_id integer not null references people,
    company_id integer not null references companies
);

create table addresses (
    id integer primary key generated always as identity,
    -- The type is "varchar(100)" just for not having
    --  to define a check constraint with "text" or
    --  "varchar". I do not understand check
    --  constraints yet. The length "100" is a
    --  more or less arbitrary value, but which
    --  seems to me to be short enough and long
    --  enough for my needs during my learning of SQL
    --  and PostgreSQL.
    address varchar(100) not null,
    -- As for the type, see the comment for the column
    --  "gps_location" in the DDL for the table
    --  "vehicles".
    gps_location varchar(20) not null
);

create table vehicles (
    id integer primary key generated always as identity,
    max_cargo_weight_in_kg integer not null,
    -- The type is "varchar(20)", because I expect
    --  this column to store strings representing
    --  decimal degrees, in a form of
    --  "90.123456,180.123456".
    gps_location varchar(20) not null
);

create table orders (
    id integer primary key generated always as identity,
    -- The type is "timestamp" only because I think it
    --  is the simplest type in this case.
    acceptance_date_and_time timestamp not null,
    order_placing_person_id integer not null references people,
    cargo_handing_over_person_id integer not null references people,
    cargo_receiving_person_id integer not null references people,
    place_of_origin_address_id integer not null references addresses,
    place_of_destination_address_id integer not null references addresses
);

create table parcels (
    id integer primary key generated always as identity,
    order_id integer not null references orders,
    estimated_weight_in_kg integer not null
);

create table shipments (
    id integer primary key generated always as identity,
    vehicle_id integer not null references vehicles,
    parcel_id integer not null references parcels,
    address_id integer not null references addresses,
    -- As for the type, see the comment for the column
    --  "acceptance_date_and_time" in the table "orders".
    date_and_time timestamp not null
);

create table deliveries (
    id integer primary key generated always as identity,
    shipment_id integer not null references shipments,
    address_id integer not null references addresses,
    -- As for the type, see the comment for the column
    --  "acceptance_date_and_time" in the table "orders".
    date_and_time timestamp not null
);

create table required_payments (
    id integer primary key generated always as identity,
    order_id integer not null references orders,
    amount integer not null,
    due_date interval day not null
);

create table done_payments (
    id integer primary key generated always as identity,
    required_payment_id integer not null references required_payments,
    date interval day not null
);
